#version 150

#define X 0
#define Y 1
#define Z 2

#define PI 3.14159265

//positive


#define PIX Rotate3(PI*0.5, X)
#define PIX25 Rotate3(PI*0.25, X)
#define PIX12 Rotate3(PI*0.125, X)
#define PIX62 Rotate3(PI*0.0625, X)
#define PIX2 Rotate3(PI, X)
#define PIX3 Rotate3(PI*1.5, X)
#define PIY Rotate3(PI*0.5, Y)
#define PIY25 Rotate3(PI*0.25, Y)
#define PIY12 Rotate3(PI*0.125, Y)
#define PIY62 Rotate3(PI*0.0625, Y)

#define PIY2 Rotate3(PI, Y)
#define PIY3 Rotate3(PI*1.5, Y)
#define PIZ Rotate3(PI*0.5, Z)
#define PIZ25 Rotate3(PI*0.25, Z)
#define PIZ12 Rotate3(PI*0.125, Z)
#define PIZ62 Rotate3(PI*0.0625, Z)
#define PIZ2 Rotate3(PI, Z)
#define PIZ3 Rotate3(PI*1.5, Z)


//negative
#define NIX Rotate3(-PI*0.5, X)
#define NIX25 Rotate3(-PI*0.25, X)
#define NIX12 Rotate3(-PI*0.125, X)
#define NIX62 Rotate3(-PI*0.0625, X)
#define NIX2 Rotate3(-PI, X)
#define NIX3 Rotate3(-PI*1.5, X)
#define NIY Rotate3(-PI*0.5, Y)
#define NIY25 Rotate3(-PI*0.25, Y)
#define NIY12 Rotate3(-PI*0.125, Y)
#define NIY62 Rotate3(-PI*0.0625, Y)
#define NIY2 Rotate3(-PI, Y)
#define NIY3 Rotate3(-PI*1.5, Y)
#define NIZ Rotate3(-PI*0.5, Z)
#define NIZ25 Rotate3(-PI*0.25, Z)
#define NIZ12 Rotate3(-PI*0.125, Z)
#define NIZ62 Rotate3(-PI*0.0625, Z)
#define NIZ2 Rotate3(-PI, Z)
#define NIZ3 Rotate3(-PI*1.5, Z)



#define PIX31 Rotate3(PI*0.03125, X)  // PI/32
#define PIX16 Rotate3(PI*0.015625, X) // PI/64
#define PIY31 Rotate3(PI*0.03125, Y)  // PI/32
#define PIY16 Rotate3(PI*0.015625, Y) // PI/64
#define PIZ31 Rotate3(PI*0.03125, Z)  // PI/32
#define PIZ16 Rotate3(PI*0.015625, Z) // PI/64

#define NIX31 Rotate3(-PI*0.03125, X)  // PI/32
#define NIX16 Rotate3(-PI*0.015625, X) // PI/64
#define NIY31 Rotate3(-PI*0.03125, Y)  // PI/32
#define NIY16 Rotate3(-PI*0.015625, Y) // PI/64
#define NIZ31 Rotate3(-PI*0.03125, Z)  // PI/32
#define NIZ16 Rotate3(-PI*0.015625, Z) // PI/64


#define PINULL Rotate3(0,0)



//matrix 4

mat4 MakeMat4()
{
	return mat4(1.0, 0.0, 0.0, 0.0,
				0.0, 1.0, 0.0, 0.0,
				0.0, 0.0, 1.0, 0.0,
				0.0, 0.0, 0.0, 1.0);
}

mat4 Rotate(float angle, int type)
{

	float sin = sin(angle);
	float cos = cos(angle);

	if (type == 0)
		return mat4(1.0, 0.0,  0.0, 0.0,
					0.0, cos, -sin, 0.0,
					0.0, sin,  cos, 0.0,
					0.0, 0.0,  0.0, 1.0);
	if (type == 1)
		return mat4( cos, 0.0, sin, 0.0,
					 0.0, 1.0, 0.0, 0.0,
					-sin, 0.0, cos, 0.0,
					 0.0, 0.0, 0.0, 1.0);
	if (type == 2)
		return mat4(cos, -sin, 0.0, 0.0,
					sin,  cos, 0.0, 0.0,
					0.0,  0.0, 1.0, 0.0,
					0.0,  0.0, 0.0, 1.0);				

	return mat4(0.0);
}

mat3 Rotate3(float angle, int type)
{

	float sin = sin(angle);
	float cos = cos(angle);

	if (type == 0)
		return mat3(1.0, 0.0, 0.0,
					0.0, cos, -sin,
					0.0, sin,  cos);
	if (type == 1)
		return mat3( cos, 0.0, sin,
					 0.0, 1.0, 0.0,
					-sin, 0.0, cos);
	if (type == 2)
		return mat3(cos, -sin, 0.0,
					sin,  cos, 0.0,
					0.0,  0.0, 1.0);				

	return mat3(0.0);
}

mat4 RotateByAxis(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat4(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,  0.0,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,  0.0,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c,           0.0,
                0.0,                                0.0,                                0.0,                                1.0);
}
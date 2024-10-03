
#define SKINRES 64
#define FACERES 8


const vec4[] subuvs = vec4[](
	// 4x4x12
	vec4(4.0,  0.0,  8.0,  4.0 ), // Top
	vec4(8.0,  0.0,  12.0, 4.0 ), // Bottom
	vec4(0.0,  4.0,  4.0,  16.0), // Right
	vec4(4.0,  4.0,  8.0,  16.0), // Front
	vec4(8.0,  4.0,  12.0, 16.0), // Left
	vec4(12.0, 4.0,  16.0, 16.0), // Back

	// 4x3x12
	vec4(4.0,  0.0,  7.0,  4.0 ),
	vec4(7.0,  0.0,  10.0, 4.0 ),
	vec4(0.0,  4.0,  4.0,  16.0),
	vec4(4.0,  4.0,  7.0,  16.0),
	vec4(7.0,  4.0,  11.0, 16.0),
	vec4(11.0, 4.0,  14.0, 16.0),

	// 4x8x12
	vec4(4.0,  0.0,  12.0, 4.0 ),
	vec4(12.0,  0.0, 20.0, 4.0 ),
	vec4(0.0,  4.0,  4.0,  16.0),
	vec4(4.0,  4.0,  12.0, 16.0),
	vec4(12.0, 4.0,  16.0, 16.0),
	vec4(16.0, 4.0,  24.0, 16.0)
);

const vec2[] origins = vec2[](
	vec2(40.0, 16.0), // right arm 0
	vec2(40.0, 32.0), //1
	vec2(32.0, 48.0), // left arm 2
	vec2(48.0, 48.0), //3
	vec2(40.0, 16.0), // slim right arm 4
	vec2(40.0, 32.0), //5
	vec2(32.0, 48.0), // slim left arm 6
	vec2(48.0, 48.0), //7
	vec2(16.0, 16.0), // torso 8
	vec2(16.0, 32.0),	//9
	vec2(0.0,  16.0), // right leg
	vec2(0.0,  32.0),
	vec2(16.0, 48.0), // left leg
	vec2(0.0,  48.0)
);
const int[] faceremap = int[](0, 0, 1, 1, 2, 3, 4, 5);

//UVout2 = origins[2 * (partId - 1)];

int getCube(float height){
	if(height == 0) return HEAD;
	if(height>-1024 && height <0) return RIGHT_ARM;
	if(height>-2048 && height <-1024) return LEFT_ARM;
	if(height>-3072 && height <-2048) return BODY;
	if(height>-4096 && height <-3072) return RIGHT_LEG;
	if(height>-5120 && height <-4096) return LEFT_LEG;
}
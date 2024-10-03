#define BOTTOM_FACE 0
#define TOP_FACE 1
#define RIGHT_FACE 2
#define NORTH_FACE 3
#define LEFT_FACE 4
#define SOUTH_FACE 5

//head

#define HEAD_RIGHT ivec4(0,8,8,16)
#define HEAD_FRONT ivec4(8,8,16,16)
#define HEAD_TOP ivec4(8,0,16,8)
#define HEAD_DOWN ivec4(16,0,24,8)
#define HEAD_LEFT ivec4(16,8,24,16)
#define HEAD_BACK ivec4(24,8,32,16)
//Add 32 for the x value to get the overlay
#define HEAD_RIGHT_OVERLAY ivec4(32,8,40,16)    
#define HEAD_FRONT_OVERLAY ivec4(40,8,48,16)
#define HEAD_TOP_OVERLAY ivec4(40,0,48,8)
#define HEAD_DOWN_OVERLAY ivec4(48,0,56,8)
#define HEAD_LEFT_OVERLAY ivec4(48,8,56,16)
#define HEAD_BACK_OVERLAY ivec4(56,8,64,16)

//right leg
#define RIGHT_LEG_TOP ivec4(4,16,8,20)
#define RIGHT_LEG_DOWN ivec4(8,16,12,20)
#define RIGHT_LEG_FRONT ivec4(4,20,8,32)
#define RIGHT_LEG_BACK ivec4(12,20,16,32)
#define RIGHT_LEG_RIGHT ivec4(0,20,4,32)
#define RIGHT_LEG_LEFT ivec4(8,20,12,32)
//add 16 for the y value to get the overlay
#define RIGHT_LEG_TOP_OVERLAY ivec4(4,32,8,36)
#define RIGHT_LEG_DOWN_OVERLAY ivec4(8,32,12,36)
#define RIGHT_LEG_FRONT_OVERLAY ivec4(4,36,8,48)
#define RIGHT_LEG_BACK_OVERLAY ivec4(12,36,16,48)
#define RIGHT_LEG_RIGHT_OVERLAY ivec4(0,36,4,48)
#define RIGHT_LEG_LEFT_OVERLAY ivec4(8,36,12,48)

//left leg
#define LEFT_LEG_TOP ivec4(20,48,24,52)
#define LEFT_LEG_DOWN ivec4(24,48,28,52)
#define LEFT_LEG_FRONT ivec4(20,52,24,64)
#define LEFT_LEG_BACK ivec4(28,52,32,64)
#define LEFT_LEG_RIGHT ivec4(16,52,20,64)
#define LEFT_LEG_LEFT ivec4(24,52,28,64)
//rest 16 for the x value to get the overlay
#define LEFT_LEG_TOP_OVERLAY ivec4(20,64,24,68)
#define LEFT_LEG_DOWN_OVERLAY ivec4(24,64,28,68)
#define LEFT_LEG_FRONT_OVERLAY ivec4(20,68,24,80)
#define LEFT_LEG_BACK_OVERLAY ivec4(28,68,32,80)
#define LEFT_LEG_RIGHT_OVERLAY ivec4(16,68,20,80)
#define LEFT_LEG_LEFT_OVERLAY ivec4(24,68,28,80)

//body
#define BODY_TOP ivec4(20,16,28,20)
#define BODY_DOWN ivec4(28,16,36,20)
#define BODY_FRONT ivec4(20,20,28,32)
#define BODY_BACK ivec4(32,20,40,32)
#define BODY_RIGHT ivec4(16,20,20,32)
#define BODY_LEFT ivec4(28,20,32,32)
//add 16 for the y value to get the overlay
#define BODY_TOP_OVERLAY ivec4(20,32,28,36)
#define BODY_DOWN_OVERLAY ivec4(28,32,36,36)
#define BODY_FRONT_OVERLAY ivec4(20,36,28,48)
#define BODY_BACK_OVERLAY ivec4(32,36,40,48)
#define BODY_RIGHT_OVERLAY ivec4(16,36,20,48)
#define BODY_LEFT_OVERLAY ivec4(28,36,32,48)

//right arm
#define RIGHT_ARM_TOP ivec4(44,16,48,20)
#define RIGHT_ARM_TOP_SLIM ivec4(44,16,47,20)

#define RIGHT_ARM_DOWN ivec4(48,16,52,20)
#define RIGHT_ARM_DOWN_SLIM ivec4(47,16,50,20)

#define RIGHT_ARM_FRONT ivec4(44,20,48,32)
#define RIGHT_ARM_FRONT_SLIM ivec4(44,20,47,32)

#define RIGHT_ARM_BACK ivec4(52,20,56,32)
#define RIGHT_ARM_BACK_SLIM ivec4(50,20,53,32)

#define RIGHT_ARM_RIGHT ivec4(40,20,44,32)
#define RIGHT_ARM_LEFT ivec4(48,20,52,32)
#define RIGHT_ARM_LEFT_SLIM ivec4(48,20,51,32)
//add 16 to the y value for overlay
#define RIGHT_ARM_TOP_OVERLAY ivec4(44,32,48,36)
#define RIGHT_ARM_TOP_OVERLAY_SLIM ivec4(44,32,47,36)
#define RIGHT_ARM_DOWN_OVERLAY ivec4(48,32,52,36)
#define RIGHT_ARM_DOWN_OVERLAY_SLIM ivec4(47,32,50,36)
#define RIGHT_ARM_FRONT_OVERLAY ivec4(44,36,48,48)
#define RIGHT_ARM_FRONT_OVERLAY_SLIM ivec4(44,36,47,48)
#define RIGHT_ARM_BACK_OVERLAY ivec4(52,36,56,48)
#define RIGHT_ARM_BACK_OVERLAY_SLIM ivec4(50,36,53,48)
#define RIGHT_ARM_RIGHT_OVERLAY ivec4(40,36,44,48)
#define RIGHT_ARM_LEFT_OVERLAY ivec4(48,36,52,48)
#define RIGHT_ARM_LEFT_OVERLAY_SLIM ivec4(48,36,51,48)

//left arm
#define LEFT_ARM_TOP ivec4(36,48,40,52)
#define LEFT_ARM_TOP_SLIM ivec4(36,48,39,52)
#define LEFT_ARM_DOWN ivec4(40,48,44,52)
#define LEFT_ARM_DOWN_SLIM ivec4(39,48,42,52)
#define LEFT_ARM_FRONT ivec4(36,52,40,64)
#define LEFT_ARM_FRONT_SLIM ivec4(36,52,39,64)
#define LEFT_ARM_BACK ivec4(44,52,48,64)
#define LEFT_ARM_BACK_SLIM ivec4(42,52,45,64)
#define LEFT_ARM_RIGHT ivec4(32,52,36,64)
#define LEFT_ARM_LEFT ivec4(40,52,44,64)
#define LEFT_ARM_LEFT_SLIM ivec4(39,52,42,64)
//add 16 to the x value for overlay
#define LEFT_ARM_TOP_OVERLAY ivec4(36,64,40,68)
#define LEFT_ARM_TOP_OVERLAY_SLIM ivec4(36,64,39,68)
#define LEFT_ARM_DOWN_OVERLAY ivec4(40,64,44,68)
#define LEFT_ARM_DOWN_OVERLAY_SLIM ivec4(39,64,42,68)
#define LEFT_ARM_FRONT_OVERLAY ivec4(36,68,40,80)
#define LEFT_ARM_FRONT_OVERLAY_SLIM ivec4(36,68,39,80)
#define LEFT_ARM_BACK_OVERLAY ivec4(44,68,48,80)
#define LEFT_ARM_BACK_OVERLAY_SLIM ivec4(42,68,45,80)
#define LEFT_ARM_RIGHT_OVERLAY ivec4(32,68,36,80)
#define LEFT_ARM_LEFT_OVERLAY ivec4(40,68,44,80)
#define LEFT_ARM_LEFT_OVERLAY_SLIM ivec4(39,68,42,80)




#define ALTERNA_HEAD_FRONT ivec4(24,0,32,8)
#define ALTERNA_HEAD_RIGHT ivec4(24,8,32,16)



bool isCube(vec2 defUv, ivec4 defFace, bool isSlim) {
    vec2 uv = defUv;
    ivec4 face = defFace;
    if (isSlim) {
        if (face ==RIGHT_ARM_TOP){
            face = RIGHT_ARM_TOP_SLIM;
        }
        else if (face == RIGHT_ARM_DOWN){
            face = RIGHT_ARM_DOWN_SLIM;
        }
        else if (face == RIGHT_ARM_FRONT){
            face = RIGHT_ARM_FRONT_SLIM;
        }
        else if (face == RIGHT_ARM_BACK){
            face = RIGHT_ARM_BACK_SLIM;
        }
        else if (face == RIGHT_ARM_RIGHT){
            face = RIGHT_ARM_RIGHT;
        }
        else if (face == RIGHT_ARM_LEFT){
            face = RIGHT_ARM_LEFT_SLIM;
        }
        else if (face == LEFT_ARM_TOP){
            face = LEFT_ARM_TOP_SLIM;
        }
        else if (face == LEFT_ARM_DOWN){
            face = LEFT_ARM_DOWN_SLIM;
        }
        else if (face == LEFT_ARM_FRONT){
            face = LEFT_ARM_FRONT_SLIM;
        }
        else if (face == LEFT_ARM_BACK){
            face = LEFT_ARM_BACK_SLIM;
        }
        else if (face == LEFT_ARM_RIGHT){
            face = LEFT_ARM_RIGHT;
        }
        else if (face == LEFT_ARM_LEFT){
            face = LEFT_ARM_LEFT_SLIM;
        }
    }


    return (uv.x>=face.x 
        && uv.x<=face.z 
        )&&(
        uv.y>=face.y 
        && uv.y<=face.w);
}

ivec4 addCem(ivec4 currentCems,int id){
    if(currentCems.x == -1){
        return ivec4(id,-1,-1,-1);
    }
    if(currentCems.y == -1){
        return ivec4(currentCems.x,id,-1,-1);
    }
    if(currentCems.z == -1){
        return ivec4(currentCems.x,currentCems.y,id,-1);
    }
    if(currentCems.w == -1){
        return ivec4(currentCems.x,currentCems.y,currentCems.z,id);
    }
    return currentCems;
}
// Function to create a rotation matrix around an arbitrary axis
mat3 rotationMatrix(vec3 axis, float angle) {
    float c = cos(angle);
    float s = sin(angle);
    float oneMinusC = 1.0 - c;

    // Normalize axis
    vec3 a = normalize(axis);

    // Create rotation matrix
    mat3 rotation = mat3(
        c + a.x * a.x * oneMinusC, a.x * a.y * oneMinusC - a.z * s, a.x * a.z * oneMinusC + a.y * s,
        a.y * a.x * oneMinusC + a.z * s, c + a.y * a.y * oneMinusC, a.y * a.z * oneMinusC - a.x * s,
        a.z * a.x * oneMinusC - a.y * s, a.z * a.y * oneMinusC + a.x * s, c + a.z * a.z * oneMinusC
    );

    return rotation;
}

// Function to rotate a normal vector around a given axis by a specified angle
vec3 rotateNormal(vec3 normal, vec3 axis, float angle) {
    mat3 rotation = rotationMatrix(axis, angle);
    return rotation * normal;
}

#define VERTEX_FRONT() {\
   vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, rotateNormal(Normal,vec3(1,1,0),radians(180.0)), Color) * texelFetch(Sampler2, UV2 / 16, 0);\
}
#define VERTEX_BACK(){\
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, rotateNormal(Normal,vec3(1,1,0),radians(-90.0)), Color) * texelFetch(Sampler2, UV2 / 16, 0);\
}

#define VERTEXT_ORIGINAL(){\
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);\
}

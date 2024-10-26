#version 150

#define VSH

#moj_import <light.glsl>
#moj_import <fog.glsl>
#moj_import <mods/parts.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat3 IViewRotMat;
uniform mat4 ProjMat;
uniform int FogShape;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

uniform vec2 ScreenSize;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;
flat out int slim;
flat out int skinEffects;
flat out vec4 data1Color;
flat out vec4 data2Color;

uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
out float fogAlpha;

out vec4 cem_pos1, cem_pos2, cem_pos3, cem_pos4;
out vec3 cem_glPos;
out vec3 cem_uv1, cem_uv2;
out vec4 cem_lightMapColor;
out vec4 cem_color;
out vec4 test_color;
out float emissive;

uniform float GameTime;
flat out float transparency;

flat out int cem;
flat out int bodypart;
flat out int cem_reverse;
flat out vec4 cem_light;
flat out ivec4 cems;
flat out float cem_size;
flat out int outline;
flat out vec4 outline_color;
flat out int isGui;

#define EQ(a,b) (length(a - b) < 0.002)
#define SPACING 1024.0
#define MAXRANGE (0.5 * SPACING)

#moj_import <mods/meg.glsl>

float getChannel(ivec2 cords, int channel)
{
    vec4 color = texelFetch(Sampler0, cords, 0);
    if (channel == 0)
        return floor(color.x * 255);
    if (channel == 1)
        return floor(color.y * 255);
    if (channel == 2)
        return floor(color.z * 255);
    if (channel == 3)
        return floor(color.w * 255);
    return 0;
}

vec4 getCemData(ivec2 cords)
{
    vec4 color = texelFetch(Sampler0, cords, 0);
    return floor(color * 255);
}



void main() {
    isGui = 0;
    outline = 0;
    outline_color = vec4(0);

    int editHead = 0;
    int editBody= 0;
    int editArmLeft = 0;
    int editArmRight = 0;
    int editLegLeft = 0;
    int editLegRight = 0;

    cems = ivec4(-1);
    slim = 0;
    transparency = 1;
    fogAlpha = 0;
    emissive = 0;
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    texCoord0 = UV0;
    vec3 pos = Position;
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);
    
#moj_import <fog_reader.glsl>
    normal = gl_Position;
    vec2 texSize = textureSize(Sampler0, 0);
    vec2 uv = floor(UV0 * texSize);

    const vec2[4] corners = vec2[4](vec2(0), vec2(0, 1), vec2(1, 1), vec2(1, 0));
    vec2 corner = corners[gl_VertexID % 4];
    vec2 originalcorners = corners[gl_VertexID % 4];

    cem_pos1 = cem_pos2 = cem_pos3 = cem_pos4 = vec4(0);
    cem_uv1 = cem_uv2 = vec3(0);
    cem = cem_reverse = 0;
    cem_light = texelFetch(Sampler2, UV2 / 16, 0);

    cem_size = 1;

    bodypart = -1;
    if (getChannel(ivec2(0,1),0) == 120.0 &&
        getChannel(ivec2(0,1),2) == 120.0) 
    {
    transparency = getChannel(ivec2(0,1),1) / 255.0;
    }

	ivec2 dim=textureSize(Sampler0,0);

    if(ProjMat[2][3] == 0.0){
        isGui = 1;
            return;
    }


	if(!(dim.x!=64||dim.y!=64)){
        bool isHead = false;
        if(uv.y <= 16){
            isHead = true;   
            skinEffects = 0;

            data1Color = texture(Sampler0, vec2(32.0/64.0, 0.0)); // get data pixel #1
            data2Color = texture(Sampler0, vec2(32.0/64.0, 0.0)); // get data pixel #2
            if(abs(data2Color.a-.918)<.001){
                skinEffects=1;
                editHead=1;
            }
        }
        vec4 samp1 = texture(Sampler0, vec2(54.0 / 64.0, 20.0 / 64.0));
        vec4 samp2 = texture(Sampler0, vec2(55.0 / 64.0, 20.0 / 64.0));
        bool isSlim = samp1.a == 0.0 || (((samp1.r + samp1.g + samp1.b) == 0.0) && ((samp2.r + samp2.g + samp2.b) == 0.0) && samp1.a == 1.0 && samp2.a == 1.0);
        if(isSlim) slim = 1;
        if((FogStart > 3e38) && (ProjMat[2][3] != 0)){
            bodypart = FIRST_PERSON_RIGHT_HAND_OVERLAY;
            if(isSlim)
                bodypart = FIRST_PERSON_RIGHT_HAND_SLIM_OVERLAY;
            if(uv.y > 45){
                bodypart = FIRST_PERSON_LEFT_HAND_OVERLAY;
                if(isSlim)
                    bodypart = FIRST_PERSON_LEFT_HAND_SLIM_OVERLAY;
            }
            //is hand
            #moj_import <mods/hand.glsl>
        }
        else{


            #moj_import <wpos_etrans.glsl>
            vec2 UVout = UV0;
            vec2 UVout2 = vec2(0.0);
            int partId = -int((wpos.y - MAXRANGE) / SPACING);
            int cube = (gl_VertexID / 24) % 24;
            int meg = 0;
            

            int face = gl_VertexID / 4 % 6;
            if(partId!=0){


                    switch(partId){
                        case 1:
                        case 3:
                            cube = RIGHT_ARM;
                            break;
                        case 2:
                        case 4:
                            cube = LEFT_ARM;
                            break;
                        case 5:
                            cube = BODY_FALLBACK;
                            break;
                        case 6:
                            cube = RIGHT_LEG;
                            break;
                        case 7:
                            cube = LEFT_LEG;
                            break;
                    }

                    
                wpos.y += SPACING * partId;            
                pos = inverse(IViewRotMat) * wpos;
                cem = 198;
                cem_size = 1.9;
                meg = 1;
                
		int outerLayer = (gl_VertexID / 24) % 2;
			int tFaceId = gl_VertexID % 24 / 4;
			int vertexId = gl_VertexID % 4;
			int u = int(UV0.x * 64);
			int v = int(UV0.y * 64);
			switch(vertexId) {
				case 0:
					u -= 8;
					break;
				case 1:
					break;
				case 2:
					v -= 8;
					break;
				case 3:
					u -= 8;
					v -= 8;
					break;
			}

			// Assume the face is bottom
			int faceId = 1;
			// Unique ID for each pixel
			int pixel = u + v * 16;
			if(v >= 0) { // If V is in the negative, it means it is the bottom face since vertex 2 and 3 is at V 0
				switch(pixel) {
					case 8:
					case 40:
						faceId = 0; // UP
						break;
					case 128:
					case 160:
						faceId = 2; // RIGHT
						break;
					case 136:
					case 168:
						faceId = 3; // FRONT
						break;
					case 144:
					case 176:
						faceId = 4; // LEFT
						break;
					case 152:
					case 184:
						faceId = 5; // BACK
						break;
				}
			}
			if(tFaceId == 1) {
				if(pixel != 128 && pixel != 160)
					faceId = 1;
			}
			else if(tFaceId == 3) {
				if(pixel != 136 && pixel != 168)
					faceId = 1;
			}

			int subuvIndex = faceId;

			UVout = origins[2 * (partId - 1) + outerLayer];
			UVout2 = origins[2 * (partId - 1)];

			if (partId == 3 || partId == 4) { // Check for slim left or right arm
				subuvIndex += 6;
			} else if (partId == 5) { // Check for body part
				subuvIndex += 12;
			}

			vec4 subuv = subuvs[subuvIndex];

			vec2 offset = vec2(0.0);
			if (faceId == 1) {
				if (vertexId == 0) {
					offset += subuv.zw;
				}
				else if (vertexId == 1) {
					offset += subuv.xw;
				}
				else if (vertexId == 2) {
					offset += subuv.xy;
				}
				else {
					offset += subuv.zy;
				}
			}
			else {
				if (vertexId == 0) {
					offset += subuv.zy;
				}
				else if (vertexId == 1) {
					offset += subuv.xy;
				}
				else if (vertexId == 2) {
					offset += subuv.xw;
				}
				else {
					offset += subuv.zw;
				}
			}

			UVout += offset;
			UVout2 += offset;
			UVout /= 64.0;
			UVout2 /= 64.0;
                
            }
            

            bodypart = cube;
            #moj_import <mods/generic.glsl>

            
            if(face==TOP_FACE){

                if(cem != 199 && cem != 198){
                    cem_reverse = 0;
                    corner = corner.yx;
                    cem_size = 1;
                }
                
            }else{
                bodypart = -1;
            }
            
            #moj_import <mods/body.glsl>
                if( (cube == HEAD || cube == HEAD_OVERLAY) && editHead == 0){
                    

                    cem = 0;
                    corner = originalcorners;
                    bodypart == -1;
                    VERTEXT_ORIGINAL();
                    cem_size = 1;
                    cems = ivec4(-1);
                    if(meg != 0){
                        pos = wpos;
                        #moj_import <fog_reader.glsl>
                        texCoord0 = UVout;
			            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
                       // texCoord1 = UVout2;
                    }
                    return;
                }
                if( (cube == BODY || cube == BODY_OVERLAY) && editBody == 0){
                    

                    cem = 0;
                    corner = originalcorners;
                    bodypart == -1;
                    VERTEXT_ORIGINAL();
                    cem_size = 1;
                    cems = ivec4(-1);
                    if(meg != 0){
                        pos = wpos;
                        #moj_import <fog_reader.glsl>
                        texCoord0 = UVout;
			            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
                       // texCoord1 = UVout2;
                    }
                    return;
                }
                if( (cube == RIGHT_ARM || cube == RIGHT_ARM_OVERLAY) && editArmRight == 0){
                    cem = 0;
                    corner = originalcorners;
                    VERTEXT_ORIGINAL();
                    cems = ivec4(-1);
                    if(meg != 0){
                        pos = wpos;
                        #moj_import <fog_reader.glsl>
                        texCoord0 = UVout;
			            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
                       // texCoord1 = UVout2;
                    }
                    return;
                }
                if( (cube == LEFT_ARM || cube == LEFT_ARM_OVERLAY) && editArmLeft == 0){
                    cem = 0;
                    corner = originalcorners;
                    bodypart == -1;
                    VERTEXT_ORIGINAL();
                    cems = ivec4(-1);
                    if(meg != 0){
                        pos = wpos;
                        #moj_import <fog_reader.glsl>
                        texCoord0 = UVout;
			            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
                       // texCoord1 = UVout2;
                    }
                    return;
                }
                if( (cube == RIGHT_LEG || cube == RIGHT_LEG_OVERLAY) && editLegRight == 0){
                    cem = 0;
                    corner = originalcorners;
                    bodypart == -1;
                    VERTEXT_ORIGINAL();
                    cems = ivec4(-1);
                    if(meg != 0){
                        pos = wpos;
                        #moj_import <fog_reader.glsl>
                        texCoord0 = UVout;
			            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
                       // texCoord1 = UVout2;
                    }
                    return;
                }
                if( (cube == LEFT_LEG || cube == LEFT_LEG_OVERLAY)&& editLegLeft == 0){
                    cem = 0;
                    corner = originalcorners;
                    bodypart == -1;
                    VERTEXT_ORIGINAL();
                    cems = ivec4(-1);
                    if(meg != 0){
                        pos = wpos;
                        #moj_import <fog_reader.glsl>
                        texCoord0 = UVout;
			            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
                       // texCoord1 = UVout2;
                    }
                    return;
                }
            
                cem = 199;
                
        }


        
        if (gl_VertexID / 4 == 3)
            corner.x = 1 - corner.x;

        if (cem > 0)
        {
            gl_Position = vec4(0);
            #moj_import <cem/vert_setup.glsl>
        }   
    }
}

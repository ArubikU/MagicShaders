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

    outline = 0;
    outline_color = vec4(0);

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
    transparency = 0.4;

            
	ivec2 dim=textureSize(Sampler0,0);
	if(!(dim.x!=64||dim.y!=64)){
    bool isHead = false;
    if(uv.y <= 16){
        isHead = true;
    }
        vec4 samp1 = texture(Sampler0, vec2(54.0 / 64.0, 20.0 / 64.0));
        vec4 samp2 = texture(Sampler0, vec2(55.0 / 64.0, 20.0 / 64.0));
        bool isSlim = samp1.a == 0.0 || (((samp1.r + samp1.g + samp1.b) == 0.0) && ((samp2.r + samp2.g + samp2.b) == 0.0) && samp1.a == 1.0 && samp2.a == 1.0);
        if(isSlim) slim = 1;

        if((FogStart > 3e38) && (ProjMat[2][3] != 0) && isHead == false){
            bodypart = FIRST_PERSON_RIGHT_HAND;
            if(isSlim)
                bodypart = FIRST_PERSON_RIGHT_HAND_SLIM;
            if(uv.y >45){
                bodypart = FIRST_PERSON_LEFT_HAND;
                if(isSlim)
                    bodypart = FIRST_PERSON_LEFT_HAND_SLIM;
            }
            #moj_import <mods/hand.glsl>
        }
    }
    
        
        if (gl_VertexID / 4 == 3)
            corner.x = 1 - corner.x;

        if (cem != 0)
        {
            #moj_import <cem/vert_setup.glsl>
        }

}

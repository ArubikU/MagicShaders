#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>

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

flat out int armorType;
flat out vec4 tint;

out vec4 cem_pos1, cem_pos2, cem_pos3, cem_pos4;
out vec3 cem_glPos;
out vec3 cem_uv1, cem_uv2;
out vec4 cem_lightMapColor;
flat out int cem;
flat out int cem_reverse;
flat out vec4 cem_light;
out vec4 cem_color;
out float emissive;
#define SPACING 1024.0
#define MAXRANGE (0.5 * SPACING)

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
    emissive = 0;
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    texCoord0 = UV0;
    vec3 pos = Position;
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);
    
#moj_import <fog_reader.glsl>
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);
    vec2 texSize = textureSize(Sampler0, 0);
    vec2 uv = floor(UV0 * texSize);

    const vec2[4] corners = vec2[4](vec2(0), vec2(0, 1), vec2(1, 1), vec2(1, 0));
    vec2 corner = corners[gl_VertexID % 4];

    cem_pos1 = cem_pos2 = cem_pos3 = cem_pos4 = vec4(0);
    cem_uv1 = cem_uv2 = vec3(0);
    cem = cem_reverse = 0;
    cem_light = texelFetch(Sampler2, UV2 / 16, 0);

    float cem_size = 1;

	ivec2 dim=textureSize(Sampler0,0);

	if(!((ProjMat[2][3]==0.||dim.x!=64||dim.y!=64))){

    
    int cube = (gl_VertexID / 24) % 24;
	int partId=gl_VertexID / 4 % (6*7);
        if (getChannel(ivec2(1,0),0) == 253.0 &&
            getChannel(ivec2(1,0),2) == 253.0) //body
        {
            cem_color = getCemData(ivec2(1, 0));

            if(cube==1){
                if(partId==9)
                {
                    cem = 1;
                    cem_reverse = 1;
                    corner = corner.yx;
                    cem_size = 1;
                }
            }
        }
        
        //cape
        if (getChannel(ivec2(0,0),0) == 252.0 &&
            getChannel(ivec2(0,0),2) == 252.0) //body
        {
            cem_color = getCemData(ivec2(0, 0));

            if(cube==1){
                if(partId==11)
                {
                    cem = 3;
                    cem_reverse = 3;
                    corner = corner.yx;
                    cem_size = 1;
                }
            }
        }
        //emmisive cape
        if (getChannel(ivec2(0,0),0) == 253.0 &&
            getChannel(ivec2(0,0),2) == 253.0) //body
        {
            cem_color = getCemData(ivec2(0, 0));

            if(cube==1){
                if(partId==11)
                {
                    emissive = 1;
                    cem = 3;
                    cem_reverse = 3;
                    corner = corner.yx;
                    cem_size = 1;
                }
            }
        }

        
        //wings
        if (getChannel(ivec2(0,0),0) == 232.0 &&
            getChannel(ivec2(0,0),2) == 232.0) //body
        {
            cem_color = getCemData(ivec2(0, 0));
            if(cube==1){
                if(partId==11)
                {
                    cem = 4;
                    cem_reverse = 3;
                    corner = corner.yx;
                    cem_size = 1;
                }
            }
        }

        //emissive wing
        if (getChannel(ivec2(0,0),0) == 233.0 &&
            getChannel(ivec2(0,0),2) == 233.0) //body
        {
            cem_color = getCemData(ivec2(0, 0));
            if(cube==1){
                if(partId==11)
                {
                    emissive = 1;
                    cem = 4;
                    cem_reverse = 3;
                    corner = corner.yx;
                    cem_size = 1;
                }
            }
        }
    }

    if (gl_VertexID / 4 == 3)
        corner.x = 1 - corner.x;

    if (cem != 0)
    {
        #moj_import <cem/vert_setup.glsl>
    }
}

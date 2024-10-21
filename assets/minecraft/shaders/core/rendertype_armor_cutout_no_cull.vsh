#version 150

#moj_import <fog.glsl>
#moj_import <light.glsl>
#moj_import <emissive_utils.glsl>
#moj_import <mods/armor/armorparts.glsl>
#moj_import <mods/parts.glsl>

#define INV_TEX_RES_SIX (1.0 / 64)
#define INV_TEX_RES_THREE (1.0 / 32)
#define IS_LEATHER_LAYER texelFetch(Sampler0,ivec2(0,1),0)==vec4(1)

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1, UV2;
in vec3 Normal;

uniform sampler2D Sampler0, Sampler2;
uniform mat4 ModelViewMat, ProjMat;
uniform int FogShape;
uniform vec3 Light0_Direction, Light1_Direction;
uniform vec4 ColorModulator;
uniform float GameTime;
uniform vec2 ScreenSize;

out float vertexDistance;
out vec4 vertexColor, tintColor, lightColor;
out vec2 texCoord0;
out vec4 normal;
out vec4 cem_pos1, cem_pos2, cem_pos3, cem_pos4;
out vec3 cem_glPos;
out vec3 cem_uv1, cem_uv2;
out vec4 cem_lightMapColor;
flat out int cem;
flat out int bodypart;
flat out int cem_reverse;
flat out vec4 cem_light;
flat out ivec4 cems;
flat out float cem_size;
flat out ivec2 RelativeCords;
flat out int armorType;
flat out int isGui;
flat out int isUpperArmor;

float getChannel(ivec2 cords, int channel) {
    vec4 color = texelFetch(Sampler0, cords, 0);
    return floor(color[channel] * 255.0);
}

vec4 getCemData(ivec2 cords) {
    return floor(texelFetch(Sampler0, cords, 0) * 255.0);
}

bool shouldApplyArmor() {
    int vertexColorId = int(Color.r * 255.0) << 16 | int(Color.g * 255.0) << 8 | int(Color.b * 255.0);
    switch(vertexColorId) {
        default:
        #moj_import <armorcords.glsl>
        return true;
    }
    return false;
}

void main() {
    // GUI detection
    isGui = (ProjMat[2][3] == 0.0) ? 1 : 0;

    // CEM setup
    cem_pos1 = cem_pos2 = cem_pos3 = cem_pos4 = vec4(0);
    cem_uv1 = cem_uv2 = vec3(0);
    cem = cem_reverse = 0;
    cem_light = texelFetch(Sampler2, UV2 / 16, 0);
    cem_size = 1.0;
    cems = ivec4(-1);
    bodypart = -1;

    // Common calculations
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    #moj_import <fog_reader.glsl>
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);

    vec4 light = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
    lightColor = texelFetch(Sampler2, UV2 / 16, 0);
    
    // Armor-specific logic
    RelativeCords = ivec2(0);
    vec2 cords = vec2(0);
    if (IS_LEATHER_LAYER) {
        ivec2 atlasSize = textureSize(Sampler0, 0);
        vec2 armorAmount = vec2(atlasSize) * vec2(INV_TEX_RES_SIX, INV_TEX_RES_THREE);
        vec2 offset = 1.0 / armorAmount;
        texCoord0 = UV0 * offset;
        
        if (shouldApplyArmor()) {
            RelativeCords = ivec2(floor(cords));
            texCoord0 += vec2(offset.x * cords.x, offset.y * cords.y);
            if (cords != vec2(0) && cords != vec2(13, 0)) {
                tintColor = vec4(1.0);
            } else {
                tintColor = Color;
            }
        }
    } else {
        texCoord0 = UV0;
        tintColor = Color;
    }

    // Final color calculations
    vertexColor = light * tintColor * ColorModulator * lightColor;

    // Armor type detection
    armorType = int(getChannel(ivec2(0,0), 3));

    // Detect if it's HELMET/CHESTPLATE or LEGGINGS/BOOTS
    vec4 detectionPixel = texelFetch(Sampler0, ivec2(0,0), 0);
    isUpperArmor = (detectionPixel.a == 1.0) ? 1 : 0;

    // Only run CEM logic if not in GUI
    if (isGui == 0) {
        // CEM logic
        vec2 texSize = textureSize(Sampler0, 0);
        vec2 uv = floor(UV0 * texSize);
        const vec2[4] corners = vec2[4](vec2(0), vec2(0, 1), vec2(1, 1), vec2(1, 0));
        vec2 corner = corners[gl_VertexID % 4];

        int cube = (gl_VertexID / 24) % 24;
        bodypart = cube;

        #moj_import <mods/armor/armor.glsl>

        // Conditions to avoid editing unnecessary armor parts
        bool editHead = getChannel(ivec2(0,0), 0) == 1.0;
        bool editBody = getChannel(ivec2(0,0), 1) == 1.0;
        bool editArmRight = getChannel(ivec2(0,0), 2) == 1.0;
        bool editArmLeft = getChannel(ivec2(1,0), 0) == 1.0;
        bool editLegRight = getChannel(ivec2(1,0), 1) == 1.0;
        bool editLegLeft = getChannel(ivec2(1,0), 2) == 1.0;

        if ((cube == HEAD && !editHead) ||
            (cube == BODY && !editBody) ||
            (cube == RIGHT_ARM && !editArmRight) ||
            (cube == LEFT_ARM && !editArmLeft) ||
            (cube == RIGHT_LEG && !editLegRight) ||
            (cube == LEFT_LEG && !editLegLeft)) {
            // Don't edit this part
            return;
        }

        if (gl_VertexID / 4 == 3)
            corner.x = 1 - corner.x;
        if (cems[0] > 0 || cems[1] > 0 || cems[2] > 0 || cems[3] > 0)
        {
            cem = 199; // Indicate that we're using custom entity models
            #moj_import <cem/vert_setup.glsl>
        }
    }
}
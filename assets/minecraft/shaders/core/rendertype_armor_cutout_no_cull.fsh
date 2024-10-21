#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>
#moj_import <matf.glsl>
#moj_import <emissive_utils.glsl>
#moj_import <mods/armor/armorparts.glsl>
#moj_import <mods/parts.glsl>

uniform sampler2D Sampler0;
uniform float GameTime;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform mat3 IViewRotMat;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;
in vec4 lightColor;
in vec2 uv;
in vec4 cem_color;
in float emissive;
in float fogAlpha;
flat in float transparency;
flat in int bodypart;
flat in ivec4 cems;
flat in float cem_size;
flat in int isGui;
flat in ivec2 RelativeCords;

out vec4 fragColor;

#moj_import <cem/frag_funcs.glsl>

#define def_speed 0.22/120

vec4 relativeUv(float x, float y, float xlength, float ylength, vec2 cord) {
    return vec4(x + cord.x * 32.0, y + cord.y * 16.0, xlength, ylength);
}

void main() {
    gl_FragDepth = gl_FragCoord.z;
    float vDistance = vertexDistance;
    vec2 texSize = textureSize(Sampler0, 0);
    bool isHead = (texCoord0 * texSize).y <= 16;
    vec4 color = texture(Sampler0, texCoord0);

    if (cem > 0) {
        #define MINUS_Z
        #moj_import <cem/frag_main_setup.glsl>
        modelSize /= res.y;
        modelSize *= cem_size;
        
        mat3 rotMat = Rotate3(PI / 4, Y);
        if (bodypart != -1) {
            for (int cemId = 0; cemId < 4; cemId++) {
                int cemi = cems[cemId];
                if (cemi == -1) continue;
                
                switch (cemi) {
                    #moj_import <mods/armor/generic.glsl>
                }
            }
        } else {
            discard;
        }

        //switch (bodypart) {
        //    #moj_import <mods/body.glsl>
        //}

        if (minT == MAX_DEPTH) discard;
        writeDepth(dir * minT);
        vDistance = minT;
        if (emissive == 0) color *= cem_light;
    }

    float opacity = ceil(color.a * 255);
    if (opacity == 254) {
        float animationTime = GameTime * 1000;
        color = mix(color * vertexColor, color, pow(sin(animationTime + texCoord0.x * 1.1), 2));
    } else if (opacity == 253) {
        // Keep original color
    } else if (cem < 1) {
        if (color.a < 0.1) discard;
        color *= vertexColor * lightColor;
    }

    if (emissive == 0) color *= ColorModulator;

    if (emissive == 1) {
        fragColor = color;
    } else {
        fragColor = linear_fog(color, vDistance, FogStart, FogEnd, FogColor);
    }

    if (transparency < 1 && emissive != 1 && isGui == 0) {
        fragColor.a = transparency;
    }
}
#version 150

#define FSH

#moj_import <light.glsl>
#moj_import <fog.glsl>
#moj_import <matf.glsl>
#moj_import <mods/parts.glsl>

uniform sampler2D Sampler0;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

uniform mat3 IViewRotMat;

uniform float GameTime;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;
in vec4 cem_color;
in float emissive;
in float fogAlpha;
flat in float transparency;
flat in int slim;
flat in int bodypart;
flat in ivec4 cems;
flat in float cem_size;
flat in int outline;
flat in vec4 outline_color;

out vec4 fragColor;

#moj_import <cem/frag_funcs.glsl>
#define def_speed 0.22/120

bool isColorrgb(vec4 color, int r,int g,int b){
    return floor(color.z * 255) == b && floor(color.y * 255) == g && floor(color.x * 255) == r;
}

bool isEmmisive(vec4 color){
    //CORRECT SUPPORT OF THAT 
    return isColorrgb(color,191, 239, 232) ||
    isColorrgb(color,174, 232, 230) ||
    isColorrgb(color,253, 212, 118) ||
    isColorrgb(color,255, 224, 128) ||
    isColorrgb(color,236, 93, 84) ||
    isColorrgb(color,246, 115, 96) ||
    isColorrgb(color,247, 169, 255) ||
    isColorrgb(color,227, 152, 246) ||
    isColorrgb(color,195, 255, 188) ||
    isColorrgb(color,154, 250, 159);
}

void main() {
    gl_FragDepth = gl_FragCoord.z;
    int varying_emissive = 0;
    
    vec2 texSize = textureSize(Sampler0, 0);

    bool isHead = false;

    if((texCoord0*texSize).y <= 16){
        isHead = true;
    }

    vec4 color = texture(Sampler0, texCoord0);

    if (cem != 0)
    {
        #define MINUS_Z
        #moj_import <cem/frag_main_setup.glsl>
        modelSize /= res.y;
        modelSize *= cem_size;
            
        mat3 rotMat = Rotate3(PI / 4, Y);
        
        switch (bodypart){
            #moj_import <mods/hand.glsl>
        }
        if (minT == MAX_DEPTH)
            discard;
        writeDepth(dir * minT);
        if(emissive == 0 && varying_emissive == 0) color *= cem_light;
    }

    if(isEmmisive(color)){
        varying_emissive = 1;
    }
    if (cem < 1 && color.a < 0.1) discard;

    if (cem == 0) color *= vertexColor;

    if(emissive == 0 && varying_emissive == 0) color *= ColorModulator;
    fragColor = mix(color , vertexColor, fogAlpha);
    if(emissive == 1 || varying_emissive == 1){
        fragColor = color; 
    }
    if(transparency<1 && varying_emissive!=1){
        fragColor.a = transparency;
    }
}

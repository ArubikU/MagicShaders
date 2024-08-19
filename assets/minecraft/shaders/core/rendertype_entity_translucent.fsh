#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>
#moj_import <matf.glsl>

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


out vec4 fragColor;

#moj_import <cem/frag_funcs.glsl>
#define def_speed 0.22/120

void main() {
    gl_FragDepth = gl_FragCoord.z;
    vec4 color = texture(Sampler0, texCoord0);

    if (cem != 0)
    {
        #define MINUS_Z
        #moj_import <cem/frag_main_setup.glsl>

        switch (cem)
        {
            case 1: 
            {
               modelSize /= res.y;

                break;
            }
            case 2: 
            {
               modelSize /= res.y;

                break;
            }
            case 3: 
            {
               modelSize /= res.y;

                break;
            }
            case 4: 
            {
               modelSize /= res.y;

                break;
            }
        }
            


        switch (cem)
        {
            case 1: 
            {
                mat3 rotMat = Rotate3(PI / 4, Z);
                ADD_SQUARE(vec3(-4, -6, 0), vec3(4,-6 ,0), vec3(-4, 6, 0), vec4(20,20,8,12));
                //boobs
                ADD_SQUARE(vec3(-4, -5, 0), vec3(4,-5 ,0), vec3(-4, -2, -2), vec4(20,21,8,3));
                ADD_SQUARE(vec3(-4, -2, -2), vec3(4,-2 ,-2), vec3(-4, 0, 0), vec4(20,24,8,2));

                ADD_SQUARE(vec3(-4, -2, -2), vec3(-4, -5, 0), vec3(-4, 0, 0), vec4(20,25,-2,-3));
                ADD_SQUARE_WITH_ROTATION(vec3(4, -2, -2), vec3(4, -5, 0), vec3(4, 0, 0), vec4(27,23,2,3),1);


                break;
            }
            case 2: 
            {
                mat3 rotMat = Rotate3(PI / 4, X);
                ADD_SQUARE(vec3(4.1, 6, -0.02), vec3(-4.1,6 ,-0.02), vec3(4.1, -6, -0.02), vec4(20,36,8,12));



                //boobs
                ADD_SQUARE(vec3(4.1, 5, 0), vec3(-4.1,5 ,0), vec3(4.1, 2, -2.1), vec4(20,37,8,3));
                ADD_SQUARE(vec3(4.1, 2, -2.1), vec3(-4.1,2 ,-2.1), vec3(4.1, 0, 0), vec4(20,40,8,2));


                //ADD_SQUARE(vec3(-4, -2, -2), vec3(4,-2 ,-2), vec3(-4, 0, 0), vec4(20,24,8,2));
//
                //ADD_SQUARE(vec3(-4, -2, -2), vec3(-4, -5, 0), vec3(-4, 0, 0), vec4(20,25,-2,-3));
                //ADD_SQUARE(vec3(4, -2, -2), vec3(4, -5, 0), vec3(4, 0, 0), vec4(27,23,2,3));
                break;
            }
            case 3:
            {
                mat3 rotMat = Rotate3(PI / 4, Z);

                //back chest
                ADD_SQUARE_WITH_ROTATION(vec3(-4, -6, 0), vec3(4,-6 ,0), vec3(-4, 6, 0), vec4(32,20,8,12),2);
                APPLY_SHADOW();

                float animationTime = cos(GameTime * 1000) * (cem_color.g*def_speed) + 1.15;
                // Use the same animation time for both boxes

// UP
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0, -2.2, 1.1), vec3(5, 4, 0.5),    //Pos, Size,
                 Rotate3(animationTime * PI * 0.05, X), vec3(0, 0, 0),
                vec4(63, 17, 0, 10), vec4(63, 17, 0, 10), //Down, Up,
                vec4(56, 17, 8, 10),  vec4(56, 16, 8, 0), //North, East
                vec4(56, 17, 8, 10), vec4(56, 27, 8, 0), //South, West,
                1, 1,
                1, 1, 
                1, 1);
// DOWN
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0, 5.7, 1.12), vec3(5, 4, 0.5),   //Pos, Size,
                 Rotate3(animationTime * PI * 0.05, X), vec3(0, -7.8, 0),
                vec4(63, 29, 0, 10), vec4(56, 29, 0, 10), //Down, Up,
                vec4(56, 29, 8, 10),  vec4(56, 28, 8, 0), //North, East
                vec4(56, 29, 8, 10), vec4(56, 39, 8, 0), //South, West,
                1, 1,
                1, 1, 
                1, 1);
                break;
            }
            case 4:
            {
                mat3 rotMat = Rotate3(PI / 4, Y);


                //back chest

                ADD_SQUARE_WITH_ROTATION(vec3(-4, -6, 0), vec3(4,-6 ,0), vec3(-4, 6, 0), vec4(32,20,8,12),2);
                APPLY_SHADOW();


                //wing left
                
                float animationTime = cos(GameTime * 1000) * (cem_color.g*def_speed) + 22.5;
                
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3.75, 0 , 1.5), vec3(4,8,0),   //Pos, Size,
                 Rotate3(animationTime * PI * 0.05, Y), vec3(0, 0, 0),
                vec4(63, 29, 0, 10), vec4(56, 29, 0, 10), //Down, Up, //dont care
                vec4(56, 16, 8, 16),  vec4(56, 16, 8, 16), //North, East
                vec4(56, 16, 8, 16), vec4(56, 16, 8, 16), //South, West,
                2, 2,
                2, 2, 
                2, 2);

                //wing right

                 animationTime = cos(GameTime * 1000) * (cem_color.g*def_speed) -157.5;

                ADD_BOX_WITH_ROTATION_ROTATE(vec3(3.5, 0 , 1.5), vec3(4,8,0),   //Pos, Size,
                 Rotate3(animationTime * PI * -0.05, Y), vec3(0, 0, 0),
                vec4(63, 29, 0, 10), vec4(56, 29, 0, 10), //Down, Up, //dont care
                vec4(56, 16, 8, 16),  vec4(56, 16, 8, 16), //North, East
                vec4(56, 16, 8, 16), vec4(56, 16, 8, 16), //South, West,
                2, 2,
                2, 2,
                2, 2);
                
                break;

            }
        }


        if (minT == MAX_DEPTH)
            discard;
            
        writeDepth(dir * minT);

        //color = cem_color;
        
        if(emissive == 0) color *= cem_light;
    }

    if (cem == 0) color *= vertexColor;

    if(emissive == 0) color *= ColorModulator;
    if (color.a < 0.1) discard;

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}

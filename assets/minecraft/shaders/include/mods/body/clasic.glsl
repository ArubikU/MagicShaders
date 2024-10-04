#ifdef FSH

            case HEAD:
            {   

                if(skinEffects==1){
                    vec2 duration=vec2(data2Color.r*25.5,data2Color.g*25.5);
                    float time=mod(GameTime*1200,duration.x+duration.y);


                        if(time>duration.y){
                        ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-4),vec3(4,4,4),
                        PIX, vec3(0, 0, 0),
                                vec4(8,8,8,-8), vec4(16,8,8,-8), //down up
                                vec4(8,8,8,8), vec4(24,8,-8,8) , //north east
                                vec4(32,16,-8,-8),  vec4(0,8,8,8), //south west
                                0, 0,
                                2, 2,
                                0, 2);
                        }else{
                        ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-4),vec3(4,4,4),
                        PIX, vec3(0, 0, 0),
                                vec4(8,8,8,-8), vec4(16,8,8,-8), //down up
                                vec4(24,0,8,8), vec4(24,8,-8,8) , //north east
                                vec4(32,16,-8,-8),  vec4(0,8,8,8), //south west
                                0, 0,
                                2, 2,
                                0, 2);
                        }
                }else{
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-4),vec3(4,4,4),
                 PIX, vec3(0, 0, 0),
                        vec4(8,8,8,-8), vec4(16,8,8,-8), //down up
                        vec4(8,8,8,8), vec4(24,8,-8,8) , //north east
                        vec4(32,16,-8,-8),  vec4(0,8,8,8), //south west
                        0, 0,
                        2, 2,
                        0, 2);
                }
                if(outline==1){
                    APPLY_SHADOW();
                    ADD_BOX_EXT_SOLID_EMISSIVE(vec3(0,0,-4),vec3(5,5,5),outline_color);
                    varying_emissive = 1;
                }
                if(color.a == 0){
                    color = vec4(0,0,0,1);
                }
                break;
            }
            case HEAD_OVERLAY:
            {
                
                if(isHead){
                    ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-4),vec3(4.125,4.125,4.125),
                    PIX, vec3(0, 0, 0),
                            vec4(40,8,8,-8), vec4(48,8,8,-8), //down up
                            vec4(40,8,8,8), vec4(56,8,-8,8) , //north east
                            vec4(64,16,-8,-8),  vec4(0+32,8,8,8), //south west
                            0, 0,
                            2, 2,
                            0, 2);
                    break;
                }
                break;
            }
            case LEFT_ARM:
            {

                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(2,6,2),
                 PIX, vec3(0, 0, 0),
                        vec4(40,48,-4,4), vec4(44,48,-4,4), //down up
                        vec4(36,52,4,12), vec4(44,52,-4,12) , //north left
                        vec4(48,52,-4,12),  vec4(32,52,4,12), //south right
                        0, 0,
                        2, 2,
                        2, 2);
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6.005),vec3(2.25,6.25,2.25),
                 PIX, vec3(0, 0, 0),
                        vec4(40+16,48,-4,4), vec4(44+16,48,-4,4), //down up
                        vec4(36+16,52,4,12), vec4(40+16,52,4,12) , //north east
                        vec4(48+16,52,-4,12),  vec4(48,52,4,12), //south west
                        0, 0,
                        2, 2,
                        2, 2);
                break;
            }
            case LEFT_ARM_SLIM:
            {

                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(1.5,6,2),
                 PIX, vec3(0, 0, 0),
                        vec4(39,48,-3,4), vec4(42,52,-3,-4), //up down
                        vec4(36,52,3,12), vec4(43,52,-4,12) , //north left
                        vec4(46,52,-3,12),  vec4(32,52,4,12), //south right
                        0, 0,
                        2, 2,
                        2, 2);
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6.005),vec3(1.75,6.25,2.25),
                 PIX, vec3(0, 0, 0),
                        vec4(55,48,-3,4), vec4(58,48,-3,4), //up down
                        vec4(52,52,3,12), vec4(59,52,-4,12) , //north left
                        vec4(62,52,-3,12),  vec4(48,52,4,12), //south right
                        0, 0,
                        2, 2,
                        2, 2);
                break;
            }
            case RIGHT_ARM_SLIM:
            {
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6), vec3(1.5,6,2),
                    PIX, vec3(0, 0, 0),
                    vec4(47,20,-3,-4), vec4(50,20,-3,-4), // up down
                        vec4(44,20,3,12), vec4(48,20,4,12) , //north east
                        vec4(54,20,-3,12),  vec4(40,20,4,12), //south west
                    5, 5,
                    2, 2,
                    2, 2);

                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6.005), vec3(1.75,6.25,2.25),
                    PIX, vec3(0, 0, 0),
                    vec4(47,36,-3,-4), vec4(50,36,-3,-4), // up down
                        vec4(44,36,3,12), vec4(48,36,4,12) , //north east
                        vec4(54,36,-3,12),  vec4(40,36,4,12), //south west
                    5, 5,
                    2, 2,
                    2, 2);
                break;
            }
            case RIGHT_ARM:
            {
                
                //arm
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(2,6.25,2),
                 PIX, vec3(0, 0, 0),
                        vec4(48,20,-4,-4), vec4(52,20,-4,-4), //down up
                        vec4(44,20,4,12), vec4(48,20,4,12) , //north east
                        vec4(56,20,-4,12),  vec4(40,20,4,12), //south west
                        0, 0,
                        2, 2,
                        2, 2);
                //arm overlay
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6.005),vec3(2.25,6.25,2.25),
                 PIX, vec3(0, 0, 0),
                        vec4(48,32,-4,4), vec4(52,32,-4,4), //down up
                        vec4(44,36,4,12), vec4(48,36,4,12) , //north east
                        vec4(56,48,-4,-12),  vec4(40,36,4,12), //south west
                        0, 0,
                        2, 2,
                        0, 2);
                break;
            }
            case RIGHT_LEG:{
                
                //leg
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(2,6,2),
                 PIX, vec3(0, 0, 0),
                        vec4(8,16,-4,4), vec4(12,16,-4,4), //down up

                        vec4(4,20,4,12), vec4(8,20,4,12) , //north east
                        vec4(16,32,-4,-12),  vec4(12,20,4,12), //south west
                        0, 0,
                        2, 2,
                        0, 2);
                //leg overlay
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6),vec3(2.25,6.25,2.25),
                 PIX, vec3(0, 0, 0),
                        vec4(8,32,-4,4), vec4(12,32,-4,4), //down up

                        vec4(4,36,4,12), vec4(8,36,4,12) , //north east
                        vec4(16,48,-4,-12),  vec4(12,36,4,12), //south west
                        0, 0,
                        2, 2,
                        0, 2);
                break;
            }
            case LEFT_LEG:{
                
                            
                        //leg
                        ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(2,6,2),
                        PIX, vec3(0, 0, 0),
                                vec4(24,48,-4,4), vec4(28,48,-4,4), //down up
                                vec4(20,52,4,12), vec4(24,52,4,12) , //north east
                                vec4(32,64,-4,-12),  vec4(28,52,4,12), //south west
                                0, 0,
                                2, 2,
                                0, 2);
                        //inflate 0.25 and rest 16 to X
                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6),vec3(2.25,6.25,2.25),
                        PIX, vec3(0, 0, 0),
                                vec4(8,48,-4,4), vec4(12,48,-4,4), //down up
                                vec4(4,52,4,12), vec4(8,52,4,12) , //north east
                                vec4(16,64,-4,-12),  vec4(12,52,4,12), //south west
                                0, 0,
                                2, 2,
                                0, 2);
                    break;
            }
            case BODY_FALLBACK:
            {
                
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(4,6,2),
                 PIX, vec3(0, 0, 0),
                vec4(20,20,8,-4),          // BODY_DOWN
                vec4(28,20,8,-4),          // BODY_UP
                vec4(20,20,8,12),          // BODY_FRONT
                vec4(32,20,-4,12),          // BODY_LEFT
                vec4(32,32,8,-12),          // BODY_BACK
                vec4(16,20,4,12),          // BODY_RIGHT
                0, 0,                      // Unused parameters
                2, 2,                      // Texture size parameters
                0, 2)                       // More texture parameters

                //for overlay add 16 to the Y
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6),vec3(4.25,6.25,2.25),
                 PIX, vec3(0, 0, 0),
                vec4(20,36,8,-4),          // BODY_DOWN
                vec4(28,36,8,-4),          // BODY_UP
                vec4(20,36,8,12),          // BODY_FRONT
                vec4(32,36,-4,12),          // BODY_LEFT
                vec4(32,48,8,-12),          // BODY_BACK
                vec4(16,36,4,12),          // BODY_RIGHT
                0, 0,                      // Unused parameters
                2, 2,                      // Texture size parameters
                0, 2)                       // More texture parameters

                break;
            }
            case BODY:
            {
                if(isHead){
                    ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-4),vec3(4.25,4.25,4.25),
                    PIX, vec3(0, 0, 0),
                            vec4(40,8,8,-8), vec4(48,8,8,-8), //down up
                            vec4(40,8,8,8), vec4(56,8,-8,8) , //north east
                            vec4(64,16,-8,-8),  vec4(32,8,8,8), //south west
                            0, 0,
                            2, 2,
                            0, 2);
                    break;
                }
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-6),vec3(4,6,2),
                 PIX, vec3(0, 0, 0),
                vec4(20,20,8,-4),          // BODY_DOWN
                vec4(28,20,8,-4),          // BODY_UP
                vec4(20,20,8,12),          // BODY_FRONT
                vec4(32,20,-4,12),          // BODY_LEFT
                vec4(32,32,8,-12),          // BODY_BACK
                vec4(16,20,4,12),          // BODY_RIGHT
                0, 0,                      // Unused parameters
                2, 2,                      // Texture size parameters
                0, 2)                       // More texture parameters

                //for overlay add 16 to the Y
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6),vec3(4.25,6.25,2.25),
                 PIX, vec3(0, 0, 0),
                vec4(20,36,8,-4),          // BODY_DOWN
                vec4(28,36,8,-4),          // BODY_UP
                vec4(20,36,8,12),          // BODY_FRONT
                vec4(32,36,-4,12),          // BODY_LEFT
                vec4(40,48,-8,-12),          // BODY_BACK
                vec4(16,36,4,12),          // BODY_RIGHT
                0, 0,                      // Unused parameters
                2, 2,                      // Texture size parameters
                0, 2)                       // More texture parameters

                break;
            }
            
            case -1: {break;}
            default:{
                if(bodypart < 200
                && bodypart != HEAD_OVERLAY 
                && bodypart != LEFT_LEG_OVERLAY 
                && bodypart != RIGHT_LEG_OVERLAY 
                && bodypart != LEFT_ARM_OVERLAY 
                && bodypart != RIGHT_ARM_OVERLAY 
                && bodypart != BODY_OVERLAY 
                ){
                    
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-4),vec3(4,4,4),
                 PIX, vec3(0, 0, 0),
                        vec4(8,8,8,-8), vec4(16,8,8,-8), //down up
                        vec4(8,8,8,8), vec4(24,8,-8,8) , //north east
                        vec4(32,8,-8,8),  vec4(0,8,8,8), //south west
                        0, 0,
                        2, 2,
                        0, 2);
                    ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-4),vec3(4.25,4.25,4.25),
                    PIX, vec3(0, 0, 0),
                            vec4(40,8,8,-8), vec4(48,8,8,-8), //down up
                            vec4(40,8,8,8), vec4(56,8,-8,8) , //north east
                            vec4(64,16,-8,-8),  vec4(0+32,8,8,8), //south west
                            0, 0,
                            2, 2,
                            0, 2);
                }
                break;
            }
#endif
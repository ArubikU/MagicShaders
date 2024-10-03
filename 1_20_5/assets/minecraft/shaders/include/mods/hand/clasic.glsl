#ifdef FSH
    case FIRST_PERSON_RIGHT_HAND:{
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.5,0,0), vec3(2,5,2),
                    PINULL, vec3(0, 0, 0),
                        vec4(48,20,-4,-4), vec4(52,20,-4,-4), //down up
                        vec4(44,22,4,10), vec4(48,22,4,10) , //north east
                        vec4(56,22,-4,10),  vec4(40,22,4,10), //south west
                    5, 5,
                    2, 2,
                    2, 2);

                ADD_BOX_WITH_ROTATION_ROTATE(vec3(1.5,0,0), vec3(1.75,5.25,2.25),
                    PINULL, vec3(0, 0, 0),
                        vec4(48,16+16,-4,4), vec4(52,16+16,-4,4), //down up
                        vec4(44,22+16,4,10), vec4(48,22+16,4,10) , //north east
                        vec4(56,22+16,-4,10),  vec4(40,22+16,4,10), //south west
                    5, 5,
                    2, 2,
                    2, 2);
        break;
    }
    case FIRST_PERSON_RIGHT_HAND_SLIM:{
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.5,0,0), vec3(1.5,5,2),
                    PINULL, vec3(0, 0, 0),
                    vec4(47,20,-3,-4), vec4(50,20,-3,-4), // up down
                        vec4(44,22,3,10), vec4(48,22,4,10) , //north east
                        vec4(54,22,-3,10),  vec4(40,22,4,10), //south west
                    5, 5,
                    2, 2,
                    2, 2);

                ADD_BOX_WITH_ROTATION_ROTATE(vec3(1.5,0,0), vec3(1.75,5.25,2.25),
                    PINULL, vec3(0, 0, 0),
                    vec4(47,38,-3,-4), vec4(50,38,-3,-4), // up down
                        vec4(44,38,3,10), vec4(48,38,4,10) , //north east
                        vec4(54,38,-3,10),  vec4(40,38,4,10), //south west
                    5, 5,
                    2, 2,
                    2, 2);
        break;
    }

    case FIRST_PERSON_LEFT_HAND:{
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.5,0,0),vec3(1.5,5,2),
                 PIY12, vec3(0, 0, 0),
                        vec4(39,48,-3,4), vec4(42,48,-3,4), //up down
                        vec4(36,54,4,10), vec4(44,54,-4,10) , //north left
                        vec4(48,54,-4,10),  vec4(32,54,4,10), //south right
                        0, 0,
                        2, 2,
                        2, 2);
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(1.5,0,0),vec3(1.75,5.25,2.25),
                 PIY12, vec3(0, 0, 0),
                        vec4(40+16,48,-4,4), vec4(44+16,48,-4,4), //down up
                        vec4(36+16,54,4,10), vec4(40+16,54,4,10) , //north east
                        vec4(48+16,54,-4,10),  vec4(32+16,54,4,10), //south west
                        0, 0,
                        2, 2,
                        2, 2);
        break;
    }
    case FIRST_PERSON_LEFT_HAND_SLIM:{
        
                ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5,0,0),vec3(1.5,5,2),
                 PIY12, vec3(0, 0, 0),
                        vec4(39,48,-3,4), vec4(42,48,-3,4), //up down
                        vec4(36,54,3,10), vec4(43,54,-4,10) , //north left
                        vec4(46,54,-3,10),  vec4(32,54,4,10), //south right
                        0, 0,
                        2, 2,
                        2, 2);
                ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,0),vec3(1.75,5.25,2.25),
                 PIY12, vec3(0, 0, 0),
                        vec4(55,48,-3,4), vec4(58,48,-3,4), //up down
                        vec4(52,54,3,10), vec4(59,54,-4,10) , //north left
                        vec4(62,54,-3,10),  vec4(48,54,4,10), //south right
                        0, 0,
                        2, 2,
                        2, 2);
        break;
    }
    case FIRST_PERSON_LEFT_HAND_OVERLAY:{
        break;
    }
    
    case FIRST_PERSON_RIGHT_HAND_OVERLAY:{
        break;
    }
    case FIRST_PERSON_RIGHT_HAND_SLIM_OVERLAY:{
        break;
    }

#endif

#ifdef VSH

#endif
#ifdef VSH


            //big ears
            if (getChannel(ivec2(7,0),0) == 250.0 &&
                getChannel(ivec2(7,0),2) == 250.0) //head
            {
                cem_color = getCemData(ivec2(7, 0));
                if(cube==HEAD){
                        cems = addCem(cems,CEM_EARS_BIG);
                    
                        EDIT_HEAD();
                }
            }


            //big ears rotated
            if (getChannel(ivec2(7,0),0) == 254.0 &&
                getChannel(ivec2(7,0),2) == 254.0) //head
            {
                cem_color = getCemData(ivec2(7, 0));
                if(cube==HEAD){
                        cems = addCem(cems,CEM_EARS_BIG_ROTATED);
                    
                        EDIT_HEAD();
                }
            }
#endif

#ifdef FSH

                    case CEM_EARS_BIG: 
                    {
                        
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(4, 2, 5), vec3(9,2 ,5), vec3(4, 2, 2), vec4(3,5,5,3),4);

                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(-6.5,0,-3.5), vec3(3,2,0),   //Pos, Size,
                         PIX, vec3(0, 0, 0),
                        vec4(52,32,6,4), vec4(58,32,6,4), //Down, Up, //dont care
                        vec4(58,32,-6,4), vec4(58,32,6,4), //North, East
                        vec4(58,32,6,4), vec4(58,32,6,4), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(-4, 2, 5), vec3(-9,2 ,5), vec3(-4, 2, 2), vec4(3,5,5,3),4);
                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(6.5,0,-3.5), vec3(3,2,0),   //Pos, Size,
                         PIX, vec3(0, 0, 0),
                        vec4(52,32,6,4), vec4(58,32,6,4), //Down, Up, //dont care
                        vec4(52,32,6,4), vec4(58,32,6,4), //North, East
                        vec4(64,32,-6,4), vec4(58,32,6,4), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        break;
                    }
                    case CEM_EARS_BIG_ROTATED: 
                    {
                        
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(4, 2, 5), vec3(9,2 ,5), vec3(4, 2, 2), vec4(3,5,5,3),4);

                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(-6.5,0,-3.5), vec3(3,2,0),   //Pos, Size,
                         PIX*NIZ12, vec3(0, 0, 0),
                        vec4(52,32,6,4), vec4(58,32,6,4), //Down, Up, //dont care
                        vec4(58,32,-6,4), vec4(58,32,6,4), //North, East
                        vec4(58,32,6,4), vec4(58,32,6,4), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(-4, 2, 5), vec3(-9,2 ,5), vec3(-4, 2, 2), vec4(3,5,5,3),4);
                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(6.5,0,-3.5), vec3(3,2,0),   //Pos, Size,
                         PIX*PIZ12, vec3(0, 0, 0),
                        vec4(52,32,6,4), vec4(58,32,6,4), //Down, Up, //dont care
                        vec4(52,32,6,4), vec4(58,32,6,4), //North, East
                        vec4(64,32,-6,4), vec4(58,32,6,4), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        break;
                    }
                    
#endif
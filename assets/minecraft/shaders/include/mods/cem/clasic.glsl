#ifdef VSH

            if (getChannel(ivec2(1,0),0) == 253.0 &&
                getChannel(ivec2(1,0),2) == 253.0) //body
            {
                cem_color = getCemData(ivec2(1, 0));
                //boobs
                if(cube==BODY||cube==BODY_FALLBACK){
                        VERTEX_FRONT();
                        cems = addCem(cems,CEM_BOOBS);
                        EDIT_BODY();
                }
            }
        
        
            //cape
            if (getChannel(ivec2(0,0),0) == 252.0 &&
                getChannel(ivec2(0,0),2) == 252.0) //body
            {
                cem_color = getCemData(ivec2(0, 0));

                if(cube==BODY||cube==BODY_FALLBACK){
                        VERTEX_BACK();
                        cems = addCem(cems,CEM_CAPE);
                        EDIT_BODY();
                }
            }
            //emmisive cape
            if (getChannel(ivec2(0,0),0) == 253.0 &&
                getChannel(ivec2(0,0),2) == 253.0) //body
            {
                cem_color = getCemData(ivec2(0, 0));

                if(cube==BODY||cube==BODY_FALLBACK){
                        VERTEX_BACK();
                        cems = addCem(cems,CEM_CAPE);
                        EDIT_BODY();
                }
            }
            //wings
            if (getChannel(ivec2(0,0),0) == 232.0 &&
                getChannel(ivec2(0,0),2) == 232.0) //body
            {
                cem_color = getCemData(ivec2(0, 0));
                if(cube==BODY||cube==BODY_FALLBACK){
                        VERTEX_BACK();
                        cems = addCem(cems,CEM_WINGS);
                        EDIT_BODY();
                }
            }
            
            //emissive wing
            if (getChannel(ivec2(0,0),0) == 233.0 &&
                getChannel(ivec2(0,0),2) == 233.0) //body
            {
                cem_color = getCemData(ivec2(0, 0));
                if(cube==BODY||cube==BODY_FALLBACK){
                        VERTEX_BACK();
                        cems = addCem(cems,CEM_WINGS);
                        EDIT_BODY();
                }
            }
            

            //elf ears
            if (getChannel(ivec2(7,0),0) == 120.0 &&
                getChannel(ivec2(7,0),2) == 120.0) //head
            {
                cem_color = getCemData(ivec2(7, 0));
                if(cube==HEAD){
                        cems = addCem(cems,CEM_ELF_EARS);
                        EDIT_HEAD();
                    
                }
            }
            //elf ears rotated
            if (getChannel(ivec2(7,0),0) == 125.0 &&
                getChannel(ivec2(7,0),2) == 125.0) //head
            {
                cem_color = getCemData(ivec2(7, 0));
                if(cube==HEAD){
                        cems = addCem(cems,CEM_ELF_EARS_ROTATED);
                        EDIT_HEAD();
                    
                }
            }
            
#endif

#ifdef FSH

                    case CEM_CAPE:
                    {

                        if(isHead && bodypart != BODY_FALLBACK){
                            break;
                        }
                        float animationTime = cos(GameTime * 1000) * (cem_color.g*def_speed) + 1.15;
                        // Use the same animation time for both boxes


                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(0, 3.2, -8.1), vec3(5, 4, 0.5),    //Pos, Size,
                        Rotate3(animationTime * PI * -0.05, X)*PIX, vec3(0, 0, 0),
                        vec4(63, 17, 0, 10), vec4(63, 17, 0, 10), //Down, Up,
                        vec4(56, 17, 8, 10),  vec4(56, 16, 8, 0), //North, East
                        vec4(56, 17, 8, 10), vec4(56, 27, 8, 0), //South, West,
                        1, 1,
                        1, 1, 
                        1, 1);

                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(0, 11.1, -8.12), vec3(5, 4, 0.5),   //Pos, Size,
                        Rotate3(animationTime * PI * -0.05, X)*PIX, vec3(0, -7.8, 0),
                        vec4(63, 29, 0, 10), vec4(56, 29, 0, 10), //Down, Up,
                        vec4(56, 29, 8, 10),  vec4(56, 28, 8, 0), //North, East
                        vec4(56, 29, 8, 10), vec4(56, 39, 8, 0), //South, West,
                        1, 1,
                        1, 1, 
                        1, 1);
                        break;
                    }
                    case CEM_WINGS:
                    {
                                
                        if(isHead && bodypart != BODY_FALLBACK){
                            break;
                        }
                        //wing left
                        
                        float animationTime = cos(GameTime * 1000) * (cem_color.g*def_speed) + 22.5;
                        
                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(-4, 3.75 , -5), vec3(4,8,0),   //Pos, Size,
                        Rotate3(animationTime * PI * -0.05, Y)*PIX, vec3(0, 0, 0),
                        vec4(63, 29, 0, 10), vec4(56, 29, 0, 10), //Down, Up, //dont care
                        vec4(56, 16, 8, 16),  vec4(56, 16, 8, 16), //North, East
                        vec4(56, 16, 8, 16), vec4(56, 16, 8, 16), //South, West,
                        2, 2,
                        2, 2, 
                        2, 2);

                        //wing right

                        animationTime = cos(GameTime * 1000) * (cem_color.g*def_speed) -157.5;

                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(4, 3.75 , -5), vec3(4,8,0),   //Pos, Size,
                        Rotate3(animationTime * PI * 0.05, Y)*PIX, vec3(0, 0, 0),
                        vec4(63, 29, 0, 10), vec4(56, 29, 0, 10), //Down, Up, //dont care
                        vec4(56, 16, 8, 16),  vec4(56, 16, 8, 16), //North, East
                        vec4(56, 16, 8, 16), vec4(56, 16, 8, 16), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        break;

                    }
                    case CEM_ELF_EARS: 
                    {
                        
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(4, 2, 5), vec3(9,2 ,5), vec3(4, 2, 2), vec4(3,5,5,3),4);

                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(-6.5,-2,-3.5), vec3(2.5,1.5,0),   //Pos, Size,
                         PIX, vec3(0, 0, 0),
                        vec4(3,5,5,3), vec4(3,5,5,3), //Down, Up, //dont care
                        vec4(3,5,5,3),  vec4(3,5,5,3), //North, East
                        vec4(3,5,5,3), vec4(3,5,5,3), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(-4, 2, 5), vec3(-9,2 ,5), vec3(-4, 2, 2), vec4(3,5,5,3),4);
                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(6.5,-2,-3.5), vec3(2.5,1.5,0),   //Pos, Size,
                         PIX, vec3(0, 0, 0),
                        vec4(8,5,-5,3), vec4(8,5,-5,3), //Down, Up, //dont care
                        vec4(8,5,-5,3), vec4(8,5,-5,3), //North, East
                        vec4(8,5,-5,3), vec4(8,5,-5,3), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        break;
                    }
                    case CEM_ELF_EARS_ROTATED: 
                    {
                        
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(4, 2, 5), vec3(9,2 ,5), vec3(4, 2, 2), vec4(3,5,5,3),4);

                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(-6.5,-2,-3.5), vec3(2.5,1.5,0),   //Pos, Size,
                         PIX*NIZ62, vec3(0, 0, 0),
                        vec4(3,5,5,3), vec4(3,5,5,3), //Down, Up, //dont care
                        vec4(3,5,5,3),  vec4(3,5,5,3), //North, East
                        vec4(3,5,5,3), vec4(3,5,5,3), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        //ADD_SQUARE_WITH_ROTATION(vec3(-4, 2, 5), vec3(-9,2 ,5), vec3(-4, 2, 2), vec4(3,5,5,3),4);
                        ADD_BOX_WITH_ROTATION_ROTATE(vec3(6.5,-2,-3.5), vec3(2.5,1.5,0),   //Pos, Size,
                         PIX*PIZ62, vec3(0, 0, 0),
                        vec4(8,5,-5,3), vec4(8,5,-5,3), //Down, Up, //dont care
                        vec4(8,5,-5,3), vec4(8,5,-5,3), //North, East
                        vec4(8,5,-5,3), vec4(8,5,-5,3), //South, West,
                        2, 2,
                        2, 2,
                        2, 2);
                        
                        break;
                    }
                    case CEM_BOOBS: 
                    {

                        if(isHead && bodypart != BODY_FALLBACK){
                            break;
                        }
                        //boobs
                        //ADD_SQUARE(Point1,Point2,Point3,Uvs)
                        ADD_SQUARE(vec3(-4, 2, 11), vec3(4, 2, 11), vec3(-4, 4, 8), vec4(20,21,8,3));
                        ADD_SQUARE(vec3(-4, 4, 8), vec3(4, 4, 8), vec3(-4, 2, 6), vec4(20,24,8,2));
                        //boobs faces
                        ADD_SQUARE_WITH_ROTATION(vec3(4, 4, 8), vec3(4, 2, 11), vec3(4, 2, 6), vec4(27,23,2,3),1);
                        ADD_SQUARE(vec3(-4, 4, 8), vec3(-4, 2, 11), vec3(-4, 2, 6), vec4(20,25,-2,-3));

                        //overlay
                        ADD_SQUARE(vec3(4.25, 2.25, 11), vec3(-4.25, 2.25, 11), vec3(4.25, 4.25, 7.75), vec4(20,37,8,3));
                        ADD_SQUARE(vec3(4.25, 4.25, 7.75), vec3(-4.25, 4.25, 7.75), vec3(4.25, 2.25, 6.25), vec4(20,40,8,2));

                        //overlay faces
                        ADD_SQUARE_WITH_ROTATION(vec3(4.25, 4.25, 7.75), vec3(4.25, 2.25, 11), vec3(4.25, 2.25, 6.25), vec4(30,38,-2,3),1);
                        ADD_SQUARE_WITH_ROTATION(vec3(-4.25, 4.25, 7.75), vec3(-4.25, 2.25, 11), vec3(-4.25, 2.25, 6.25),  vec4(21,40,-2,-3),2);
                        

                        break;
                    }
#endif
#ifdef VSH
    if(isSlim){
            switch(bodypart){
                case LEFT_ARM:
                    bodypart = LEFT_ARM_SLIM;
                    break;
                case RIGHT_ARM:
                    bodypart = RIGHT_ARM_SLIM;
                    break;
            }
        }

        
    //if (getChannel(ivec2(0,7),0) != 0.0 &&
    //    getChannel(ivec2(0,7),2) != 0.0) 
    //{
    //    outline = 1;
    //    outline_color = vec4((getCemData(ivec2(0,7))/255).xyz,1);
    //}
#endif
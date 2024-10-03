
#ifdef VSH
    out int editHead;
    out int editBody;
    out int editArmLeft;
    out int editArmRight;
    out int editLegLeft;
    out int editLegRight;
    
    #define EDIT_HEAD(){\
        editHead = 1;\
    }
    #define EDIT_BODY(){\
        editBody = 1;\
    }
    #define EDIT_ARM_LEFT(){\
        editArmLeft = 1;\
    }
    #define EDIT_ARM_RIGHT(){\
        editArmRight = 1;\
    }
    #define EDIT_LEG_LEFT(){\
        editLegLeft = 1;\
    }
    #define EDIT_LEG_RIGHT(){\
        editLegRight = 1;\
    }
#endif
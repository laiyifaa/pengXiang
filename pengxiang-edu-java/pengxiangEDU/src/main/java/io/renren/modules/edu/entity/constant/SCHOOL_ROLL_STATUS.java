package io.renren.modules.edu.entity.constant;

public enum SCHOOL_ROLL_STATUS {
    IN_ROLL_IN_REGISTER(0, "已注册"),
    IN_ROLL_NOT_IN_REGISTER(1, "未注册"),
    IN_ROLL_WITHDRAWN(2, "注册前退学"),
    NOT_IN_ROLL_NOT_IN_REGISTER(3, "注册后退学");

    private final int value;
    private final String description;

    SCHOOL_ROLL_STATUS(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }
    public static boolean isContain(String inputDescription){
        for(SCHOOL_ROLL_STATUS type : SCHOOL_ROLL_STATUS.values()){
            if(!type.getDescription().equalsIgnoreCase(inputDescription))
                return true;
        }
        return false;
    }
    public String getDescription() {
        return description;
    }
    public static Integer getValue(String inputDescription) {
        for (SCHOOL_ROLL_STATUS type : SCHOOL_ROLL_STATUS.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return null; // Return -1 to indicate an invalid description or no match found.
    }
}

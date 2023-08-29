package io.renren.modules.edu.entity.constant;

public enum CURRENT_STATUS {
    IN_SCHOOL(0, "在校"),
    INTERNSHIP(1, "实习"),
    EMPLOYMENT(2, "就业"),
    LEAVE_OF_ABSENCE(3, "请假"),
    SUSPENSION(4, "休学"),
    WITHDRAWN(5, "退学"),
    GRADUATED(6, "毕业"),
    NO_CHECK(7,"未报到");

    private final int value;
    private final String description;

    CURRENT_STATUS(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    public static boolean isContain(String inputDescription){
        for(CURRENT_STATUS type : CURRENT_STATUS.values()){
            if(!type.getDescription().equalsIgnoreCase(inputDescription))
                return true;
        }
        return false;
    }

    public static Integer getValue(String inputDescription) {
        for (CURRENT_STATUS type : CURRENT_STATUS.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return null; // Return -1 to indicate an invalid description or no match found.
    }
}

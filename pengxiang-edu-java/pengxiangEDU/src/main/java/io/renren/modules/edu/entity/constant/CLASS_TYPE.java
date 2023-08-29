package io.renren.modules.edu.entity.constant;

public enum CLASS_TYPE {

    EMPLOYMENT(1,"就业"),
    FURTHER_EDUCATION(0,"升学");
    private final int value;
    private final String description;

    CLASS_TYPE(int value, String description) {
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
        for(CLASS_TYPE type : CLASS_TYPE.values()){
            if(!type.getDescription().equalsIgnoreCase(inputDescription))
                return true;
        }
        return false;
    }
    public static Integer getValue(String inputDescription) {
        for (CLASS_TYPE type : CLASS_TYPE.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return null; // Return -1 to indicate an invalid description or no match found.
    }
}

package io.renren.modules.edu.entity.constant;

public enum CERTIFICATE_ERROR_INFO {
    NONE(0,"无"),
    EXIST(1,"已补发"),
    NO_EXIST(2,"未补发");
    private final int value;
    private final String description;

    CERTIFICATE_ERROR_INFO(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }
    public static int getValue(String inputDescription) {
        for (CLASS_TYPE type : CLASS_TYPE.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return 0; // Return -1 to indicate an invalid description or no match found.
    }
}

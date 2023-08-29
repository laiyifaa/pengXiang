package io.renren.modules.edu.entity.constant;

public enum CERTIFICATE_TYPE {
    NECESSARY(1,"必考"),
    OPTION(0,"选考");
    private final int value;
    private final String description;

    CERTIFICATE_TYPE(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }

    public String getDescription() {
        return description;
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

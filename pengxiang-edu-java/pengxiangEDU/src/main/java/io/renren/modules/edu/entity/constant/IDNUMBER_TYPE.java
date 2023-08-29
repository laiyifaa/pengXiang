package io.renren.modules.edu.entity.constant;

public enum IDNUMBER_TYPE {
    MAIN_LAND(0, "大陆居民身份证"),
    HKTW(1, "港澳台身份证"),
    OTHER(2,"其他");

    private final int value;
    private final String description;

    IDNUMBER_TYPE(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    // You can also override toString() if needed
    @Override
    public String toString() {
        return description;
    }

    public static Integer getValue(String inputDescription) {
        for (IDNUMBER_TYPE type : IDNUMBER_TYPE.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return null; // Return -1 to indicate an invalid description or no match found.
    }
}

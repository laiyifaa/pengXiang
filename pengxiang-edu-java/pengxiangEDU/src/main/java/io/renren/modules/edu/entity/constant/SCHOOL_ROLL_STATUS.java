package io.renren.modules.edu.entity.constant;

public enum SCHOOL_ROLL_STATUS {
    IN_ROLL_IN_REGISTER(0, "在册在籍"),
    IN_ROLL_NOT_IN_REGISTER(1, "在册不在籍"),
    IN_ROLL_WITHDRAWN(2, "在籍退学"),
    NOT_IN_ROLL_NOT_IN_REGISTER(3, "非在册非在籍"),
    EARLY_ENROLLMENT(4, "提前入学");

    private final int value;
    private final String description;

    SCHOOL_ROLL_STATUS(int value, String description) {
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
        for (SCHOOL_ROLL_STATUS type : SCHOOL_ROLL_STATUS.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return 0; // Return -1 to indicate an invalid description or no match found.
    }
}

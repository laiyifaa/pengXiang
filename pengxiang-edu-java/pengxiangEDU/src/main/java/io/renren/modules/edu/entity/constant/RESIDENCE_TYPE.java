package io.renren.modules.edu.entity.constant;

public enum RESIDENCE_TYPE {
    NON_AGRICULTURAL(0, "非农户口"),
    AGRICULTURAL(1, "农业户口");

    private final int value;
    private final String description;

    RESIDENCE_TYPE(int value, String description) {
        this.value = value;
        this.description = description;
    }

    public int getValue() {
        return value;
    }

    public static boolean isContain(String inputDescription){
        for(RESIDENCE_TYPE type : RESIDENCE_TYPE.values()){
            if(!type.getDescription().equalsIgnoreCase(inputDescription))
                return true;
        }
        return false;
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
        for (RESIDENCE_TYPE type : RESIDENCE_TYPE.values()) {
            if (type.getDescription().equalsIgnoreCase(inputDescription)) {
                return type.getValue();
            }
        }
        return null; // Return -1 to indicate an invalid description or no match found.
    }

}

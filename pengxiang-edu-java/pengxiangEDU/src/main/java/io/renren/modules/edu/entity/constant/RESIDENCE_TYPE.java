package io.renren.modules.edu.entity.constant;

public enum RESIDENCE_TYPE {

    CITY(0, "城市"),
    AGRICULTURAL(1, "农村"),
    COUNTY_TOWN(2,"县城"),
    COUNTY(3,"县镇");


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

    public static String getDescriptionByValue(Integer inputValue){
        for(RESIDENCE_TYPE type : RESIDENCE_TYPE.values()){
            if(type.value == inputValue )
                return type.description;
        }
        return "";
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

package io.renren.modules.edu.entity.constant;

public enum STUTEMP_STATUS {

  NOT_ATTEND(0,"未参加面试"),
  PASS(1,"通过面试"),
  NOT_PASS(2,"未通过面试");


  private final int value;
  private final String description;

  STUTEMP_STATUS(int value, String description) {
    this.value = value;
    this.description = description;
  }
  public int getValue() {
    return value;
  }

  public String getDescription() {
    return description;
  }
  public static  boolean isContain(String inputDescription){
    for(STUTEMP_STATUS type : STUTEMP_STATUS.values()){
      if(type.getDescription().equalsIgnoreCase(inputDescription))
        return true;
    }
    return false;
  }
  public static Integer getValue(String inputDescription) {
    for (STUTEMP_STATUS type : STUTEMP_STATUS.values()) {
      if (type.getDescription().equalsIgnoreCase(inputDescription)) {
        return type.getValue();
      }
    }
    return null; // Return -1 to indicate an invalid description or no match found.
  }
}

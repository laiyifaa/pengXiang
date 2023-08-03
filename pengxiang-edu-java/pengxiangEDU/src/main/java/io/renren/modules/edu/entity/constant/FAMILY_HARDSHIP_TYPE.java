package io.renren.modules.edu.entity.constant;

public enum FAMILY_HARDSHIP_TYPE {
    AGRICULTURE_RELATED_MAJORS("涉农专业",1),
    HOUSEHOLD_REGISTRATION("22个县户籍",2),
    FAMILIES_DIFFICULTIES("家庭经济困难",3),
    REGISTERED_CARDS("建档立卡家庭经济困难学生",4),
    MINIMUM_SUBSISTENCE_GUARANTEES("最低生活保障家庭学生",5),
    SPECIAL_HARDSHIPS("特困供养学生",6),
    ORPHAN_STUDENTS("孤儿学生",7),
    CHILDREN_MARTYRS("烈士子女",8),
    STUDENTS_DISABILITIES("家庭经济困难残疾学生",9),
    CHILDREN_DISABLED_PERSONS("家庭经济困难残疾学生",10),
    OTHERS("其他",11);
    private String name;
    private Integer code;

    FAMILY_HARDSHIP_TYPE(String name, Integer code) {
        this.name = name;
        this.code = code;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
    public static String getValue(Integer code) {
        for (FAMILY_HARDSHIP_TYPE value : FAMILY_HARDSHIP_TYPE.values()) {
            if (value.getCode().equals(code)) {
                return value.getName();
            }
        }
        return null;
    }

    public static Integer getCode(String name) {
        for (FAMILY_HARDSHIP_TYPE value : FAMILY_HARDSHIP_TYPE.values()) {
            if (value.getName().equals(name)) {
                return value.getCode();
            }
        }
        return null;
    }
}

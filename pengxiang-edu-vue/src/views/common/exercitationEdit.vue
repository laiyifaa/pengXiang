<template>
  <div class="experience-manager">
    <h2>实习经历管理</h2>
      <h2>个人信息</h2>
      <div class="personal-info">
        <div class="info-group">
          <span class="label">姓名：</span>
          <span class="value">{{ personalInfo.name }}</span>
        </div>
        <div class="info-group">
          <span class="label">年龄：</span>
          <span class="value">{{ personalInfo.age }}</span>
        </div>
        <div class="info-group">
          <span class="label">性别：</span>
          <span class="value">{{ personalInfo.sex }}</span>
        </div>
        <div class="info-group">
          <span class="label">身份证号码：</span>
          <span class="value">{{ personalInfo.idCard }}</span>
        </div>
        <div class="info-group">
          <span class="label">学号：</span>
          <span class="value">{{ personalInfo.schoolId }}</span>
        </div>
        <div class="info-group">
          <span class="label">年级：</span>
          <span class="value">{{ personalInfo.grade }}</span>
        </div>
        <div class="info-group">
          <span class="label">专业：</span>
          <span class="value">{{ personalInfo.major }}</span>
        </div>
        <div class="info-group">
          <span class="label">班级：</span>
          <span class="value">{{ personalInfo.class }}</span>
        </div>
        <div class="info-group">
          <span class="label">联系方式：</span>
          <span class="value">{{ personalInfo.contact }}</span>
        </div>
        <!-- 添加更多个人信息字段 -->
      </div>
    <div>
      <button class="add-btn" @click="addExperience">添加实习经历</button>
    </div>
    <div v-for="(experience, index) in experiences" :key="index" class="experience">
      <h3>实习经历 {{ index + 1 }}</h3>
      <div class="form-group">
        <label for="category">实习类别：</label>
        <input type="text" v-model="experience.category" id="category" />
      </div>
      <div class="form-group">
        <label for="company">实习单位：</label>
        <input type="text" v-model="experience.company" id="company" />
      </div>
      <div class="form-group">
        <label for="salary">实习报酬：</label>
        <input type="text" v-model="experience.salary" id="salary" />
      </div>
      <div class="form-group">
        <label for="position">实习岗位：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <div class="form-group">
        <label for="position">实习离校日期：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <div class="form-group">
        <label for="position">预计实习结束日期：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <div class="form-group">
        <label for="position">实际实习结束日期：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <div class="form-group">
        <label for="position">学生实习鉴定结果：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <div class="form-group">
        <label for="position">是否对岗位满意：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <div class="form-group">
        <label for="position">带队教师：</label>
        <input type="text" v-model="experience.position" id="position" />
      </div>
      <!-- 添加更多表单字段 -->
      <div class="actions">
        <button class="remove-btn" @click="removeExperience(index)">删除实习经历</button>
      </div>
      <hr />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      personalInfo: {
        name: 'Your Name',
        age: 20,
        contact: 'yourname@example.com',
        sex: '男',
        idCard: '363333111152645536',
        schoolId: '1222363436',
        grade: '2022',
        major: '计算机',
        class: '3',
        // 添加更多个人信息字段
      },
      experiences: [],
    };
  },
  methods: {
    addExperience() {
      this.experiences.push({
        company: '',
        position: '',
        duration: '',
      });
    },
    removeExperience(index) {
      this.experiences.splice(index, 1);
    },
  },
};
</script>

<style scoped>
.experience-manager {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f7f7f7;
  border-radius: 5px;
  font-family: Arial, sans-serif;
}

h2 {
  text-align: center;
}

.add-btn {
  padding: 10px 20px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  border-radius: 3px;
  cursor: pointer;
  font-size: 14px;
}

.experience {
  margin-bottom: 20px;
}

.form-group {
  margin-bottom: 10px;
}

label {
  display: inline-block;
  width: 120px;
  font-weight: bold;
}

input[type="text"] {
  padding: 5px;
  border-radius: 3px;
  border: 1px solid #ccc;
  width: 300px;
}

.actions {
  text-align: right;
}

.remove-btn {
  padding: 5px 10px;
  background-color: #ff5252;
  color: #fff;
  border: none;
  border-radius: 3px;
  cursor: pointer;
  font-size: 12px;
}
</style>

<template>
<div>
  <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
    <e-desc-item label="学号" >{{ Info.schoolNumber}}</e-desc-item>
    <e-desc-item label="姓名" >{{Info.name}}</e-desc-item>
    <e-desc-item label="身份证号码">{{ Info.idNumber }}</e-desc-item>
    <e-desc-item  label="年龄">{{ Info.age }}</e-desc-item>
    <e-desc-item label="性别">{{ Info.gender }}</e-desc-item>
    <e-desc-item label="民族">{{ Info.nation }}</e-desc-item>
    <e-desc-item label="籍贯">{{ Info.nativePlace }}</e-desc-item>
    <e-desc-item label="户口性质">{{ Info.residenceType === 0 ? '非农户口' : '农业户口' }}</e-desc-item>
    <e-desc-item label="政治面貌">{{ Info.politicalStatus }}</e-desc-item>
    <e-desc-item label="联系电话">{{ Info.phone }}</e-desc-item>
    <e-desc-item label="系部">{{ Info.deptName }}</e-desc-item>
    <e-desc-item label="专业">{{ Info.majorName }}</e-desc-item>
    <e-desc-item label="班型">{{ Info.classType }}</e-desc-item>
    <e-desc-item label="班级">{{ Info.className }}</e-desc-item>
    <e-desc-item label="班主任">{{ Info.headTeacher }}</e-desc-item>
    <e-desc-item label="班主任电话">{{ Info.headTeacherPhone }}</e-desc-item>
    <e-desc-item label="电子邮件">{{ Info.email }}</e-desc-item>
  </e-desc>

  <el-collapse v-show="schoolNumberIsNull"  v-model="activeCollapse" >
    <el-collapse-item name="1" >
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">实习详情</span>
      </template>
      <el-tabs type="border-card" key>
        <el-tab-pane v-for="(item, index) in workInfo" :key="index" :label="`第${index + 1}阶段实习`">
          <e-desc margin='0 12px' label-width='140px' column="3" >
            <e-desc-item label="实习类别" >{{ item.practiceType === 1 ? '认识实习': '岗位实习'}}</e-desc-item>
            <e-desc-item label="实习单位" >{{item.practiceOrg }}</e-desc-item>
            <e-desc-item label="实习报酬">{{ item.practiceIncome }}</e-desc-item>
            <e-desc-item  label="实习岗位">{{ item.practicePost }}</e-desc-item>
            <e-desc-item label="实习离校日期">{{ item.leaveDate }}</e-desc-item>
            <e-desc-item label="预计实习结束日期">{{ item.expectEndDate }}</e-desc-item>
            <e-desc-item label="实际实习结束日期">{{item.realEndDate }}</e-desc-item>
            <e-desc-item label="学生实习鉴定结果" >{{ item.practiceResult }}</e-desc-item>
            <e-desc-item label="是否对岗位满意" >{{item.isSatisfied === 1?'满意':'不满意'}}</e-desc-item>
            <e-desc-item label="带队教师">{{ item.postLeader }}</e-desc-item>
            <e-desc-item  label="带队教师电话">{{ item.postLeaderPhone }}</e-desc-item>
          </e-desc>
        </el-tab-pane>
      </el-tabs>

    </el-collapse-item>
  </el-collapse>
    <div class="button-container">
      <button class="custom-button" @click="returnBack">返回</button>
    </div>
</div>
</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'

export default {
  name: 'workDetail',
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      schoolNumberIsNull:'',
      Info: null,
      activeCollapse: ['1'],
      workInfo: null
    }
  },
  created () {
    this.Info = this.$route.params.Info
    if(this.$route.params.schoolNumber!=null){
      this.schoolNumberIsNull=true
      this.$http({
        url: this.$http.adornUrl('/stuWork/getPractice'),
        method: 'get'
      }).then(response => {
        this.workInfo = response.data.prEntities.filter(item => item.schoolNumber == this.$route.params.schoolNumber)
      })
        .catch(error => {
          this.$message.error(error)
        })
    }else {
      this.schoolNumberIsNull=false
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    }
  }
}
</script>

<style scoped>
.button-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 10vh;
}

.custom-button {
  padding: 10px 20px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.custom-button:hover {
  background-color: #45a049;
}

.custom-button:active {
  background-color: #3e8e41;
}
</style>

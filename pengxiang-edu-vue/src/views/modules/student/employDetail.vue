<template>
<div>
    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
      <e-desc-item label="学号" >{{ Info.scoolNumber}}</e-desc-item>
      <e-desc-item label="姓名" >{{Info.name}}</e-desc-item>
      <e-desc-item label="证件类型">身份证</e-desc-item>
      <e-desc-item label="证件号码">{{ Info.idNumber }}</e-desc-item>
      <e-desc-item  label="年龄">{{ Info.age }}</e-desc-item>
      <e-desc-item label="性别">{{ Info.gender }}</e-desc-item>
      <e-desc-item label="民族">{{ Info.nation }}</e-desc-item>
      <e-desc-item label="籍贯">{{ Info.nativePlace }}</e-desc-item>
      <e-desc-item label="户口性质">{{ Info.residenceType=== 0 ? '城市' : Info.residenceType === 1 ? '农村': Info.residenceType === 2 ? '县城' : '县镇'}}</e-desc-item>
      <e-desc-item label="政治面貌">{{ Info.politicalStatus }}</e-desc-item>
      <e-desc-item label="联系电话">{{ Info.phone }}</e-desc-item>
      <e-desc-item label="系部">{{ Info.deptName }}</e-desc-item>
      <e-desc-item label="专业">{{ Info.majorName }}</e-desc-item>
      <e-desc-item label="班型">{{ Info.classType === 1?'就业':'升学' }}</e-desc-item>
      <e-desc-item label="班级">{{ Info.className }}</e-desc-item>
      <e-desc-item label="班主任">{{ Info.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话">{{ Info.headTeacherPhone }}</e-desc-item>
      <e-desc-item label="电子邮件">{{ Info.email }}</e-desc-item>
    </e-desc>

  <el-collapse v-show="idNumberIsNull"   v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业详情</span>
      </template>
      <e-desc margin='0 12px' label-width='100px' >
        <e-desc-item label="离校日期">{{ formattedLeaveDate }}</e-desc-item>
        <e-desc-item label="离校原因" >{{ Info.leaveReason }}</e-desc-item>
        <e-desc-item label="就业单位">{{ Info.employOrg }}</e-desc-item>
        <e-desc-item  label=" 就业岗位">{{ Info.employPost }}</e-desc-item>
        <e-desc-item label="试用期薪酬">{{ Info.probationIncome }}</e-desc-item>
        <e-desc-item label="转正薪酬">{{ Info.formalIncome }}</e-desc-item>
        <e-desc-item label="岗位负责人">{{ Info.postLeader }}</e-desc-item>
      </e-desc>
    </el-collapse-item>
  </el-collapse>

  <el-collapse v-show="idNumberIsNull"  v-model="activeCollapse">
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业回访</span>
      </template>
      <el-tabs type="border-card">
        <el-tab-pane v-for="(item, index) in visit" :key="index" :label="`第${index + 1}次回访记录`">
          <e-desc margin='0 12px' label-width='140px' column="2">
            <e-desc-item label="回访日期">{{ item.visitDate }}</e-desc-item>
            <e-desc-item label="是否在岗">{{ item.isPost === 1 ? '是' : '否' }}</e-desc-item>
            <e-desc-item label="是否对岗位满意">{{ item.isSatisfied === 1 ? '是' : '否' }}</e-desc-item>
            <e-desc-item label="学生就业工作情况">{{ item.workSituation }}</e-desc-item>
            <e-desc-item label="离职原因">{{ item.departReason }}</e-desc-item>
            <e-desc-item label="是否需要二次就业">{{ item.isSecondEmploy === 1 ? '是' : '否' }}</e-desc-item>
            <e-desc-item label="二次就业分配时间">{{ item.secondEmployDate }}</e-desc-item>
            <e-desc-item label="就业单位">{{ item.employOrg }}</e-desc-item>
            <e-desc-item label="就业岗位">{{ item.employPost }}</e-desc-item>
            <e-desc-item label="试用期限">{{ item.probationPeriod }}</e-desc-item>
            <e-desc-item label="试用期薪酬">{{ item.probationIncome }}</e-desc-item>
            <e-desc-item label="转正薪酬">{{ item.formalIncome }}</e-desc-item>
            <e-desc-item label="岗位负责人">{{ item.postLeader }}</e-desc-item>
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
import moment from 'moment';

export default {
  name: 'employDetail',
  components: {
    EDesc, EDescItem
  },
  data() {
    return {
      idNumberIsNull:'',
      activeCollapse: ['1'],
      Info: null,
      visit: null
    }
  },
  methods: {
    returnBack() {
      this.$router.go(-1)
    }

  },
  computed: {
    formattedLeaveDate() {
      if (this.Info.leaveDate) {
        return this.Info.leaveDate.split(' ')[0];
      }
      return '';
    }
  },
  created() {
    this.Info = this.$route.params.Info
    if (this.$route.params.idNumber != null) {
      this.idNumberIsNull = true
      this.$http({
        url: this.$http.adornUrl('/stu/getVisitList'),
        method: 'get'
      }).then(
        response => {
          this.visit = response.data.visitList.filter(item => item.idNumber == this.$route.params.idNumber)
          this.visit.forEach(date => {
            if (date.visitDate) {

              date.visitDate=  moment(date.visitDate).format('YYYY-MM-DD')
            }
            if (date.secondEmployDate) {
              date.secondEmployDate=  moment(date.secondEmployDate).format('YYYY-MM-DD')
            }
          })
        }).catch(error => {
        this.$message.error(error)
      })
    } else {
      this.idNumberIsNull = false
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

<template>
  <div>
    <e-desc margin='0 12px' label-width='120px' title="学生基本信息">
      <e-desc-item label="姓名">{{baseInfo.stuName}}</e-desc-item>
      <e-desc-item label="身份证号码">{{ baseInfo.idNumber }}</e-desc-item>
      <e-desc-item label="学号">{{ baseInfo.schoolNumber }}</e-desc-item>
      <e-desc-item label="出生年月">{{ baseInfo.birthday }}</e-desc-item>
      <e-desc-item label="性别">{{ baseInfo.gender}}</e-desc-item>
      <e-desc-item label="现就读学校" >{{ baseInfo.studyIn }}</e-desc-item>
      <e-desc-item label="现学籍学校">{{ baseInfo.statusSchool }}</e-desc-item>
      <e-desc-item label="院校">{{ baseInfo.academyName }}</e-desc-item>
      <e-desc-item label="年级">{{ baseInfo.gradeName }}</e-desc-item>
      <e-desc-item label="专业">{{ baseInfo.majorName }}</e-desc-item>
      <e-desc-item label="班级">{{ baseInfo.className }}</e-desc-item>
      <e-desc-item label="班型">{{ baseInfo.classType === 1?'就业':'升学'}}</e-desc-item>
      <e-desc-item label="班主任" >{{ baseInfo.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话" >{{ baseInfo.headTeacherPhone }}</e-desc-item>

      <e-desc-item label="当前状态">{{ getCurrentStatusText(baseInfo.currentStatus) }}</e-desc-item>
      <e-desc-item label="学籍状态">{{ getSchoolStatusText(baseInfo.schoolRollStatus) }}</e-desc-item>

    </e-desc>

    <el-collapse  v-model="activeCollapse" >
      <el-collapse-item name="1" >
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学籍变更记录</span>
        </template>
        <el-tabs type="border-card" key>
          <el-tab-pane v-for="(item, index) in changeList" :key="index" :label="`${item.updateTime}变更`">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <e-desc-item label="变更前的当前状态">{{ getCurrentStatusText(item.oldCurrentStatus) }}</e-desc-item>
              <e-desc-item label="变更后的当前状态">{{ getCurrentStatusText(item.newCurrentStatus) }}</e-desc-item>
              <e-desc-item label="变更前的学籍状态">{{ getSchoolStatusText(item.oldSchoolRollStatus) }}</e-desc-item>
              <e-desc-item label="变更后的学籍状态">{{ getSchoolStatusText(item.newSchoolRollStatus) }}</e-desc-item>
              <e-desc-item label="学籍变更时间">{{ item.updateTime }}</e-desc-item>
              <e-desc-item label="离校日期">{{ item.levelDate }}</e-desc-item>
              <e-desc-item label="结束日期">{{ item.endDate }}</e-desc-item>
              <e-desc-item label="学籍变更原因">{{ item.changeDetail }}</e-desc-item>
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
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      formLabelWidth: '50px',
      baseInfo: null,
      activeCollapse: ['1'],
      changeList: []
    }
  },
  created () {
    this.baseInfo = this.$route.params.stuBaseInfoEntity
  },
  mounted () {
    this.getData()
  },
  methods: {
    getCurrentStatusText (status) {
      switch (status) {
        case 0:
          return '在校'
        case 1:
          return '实习'
        case 2:
          return '就业'
        case 3:
          return '请假'
        case 4:
          return '休学'
        case 5:
          return '退学'
        case 6:
          return '毕业'
        case 7:
          return '未报到'
        default:
          return ''
      }
    },
    getSchoolStatusText (status) {
      switch (status) {
        case 0:
          return '已注册'
        case 1:
          return '未注册'
        case 2:
          return '注册前退学'
        case 3:
          return '注册后退学'
        default:
          return ''
      }
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('stu/change/info'),
        method: 'get',
        params: this.$http.adornParams({
          'stuId': this.baseInfo.stuId
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.changeList = data.changeList
        } else {
          this.$message.error(data.method)
        }
      })
    },
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

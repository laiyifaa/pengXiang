<template>
  <div>
    <!-- 学生基本信息 -->
    <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item label="姓名" icon="*" >{{info.stuName}}</e-desc-item>
      <e-desc-item label="证件类型" icon="*">{{info.idNumberType}}</e-desc-item>
      <e-desc-item label="证件号码" icon="*" >{{info.idNumber}}</e-desc-item>
      <e-desc-item label="出生日期">{{info.birthday}}</e-desc-item>
      <e-desc-item label="性别">{{info.gender}}</e-desc-item>
      <e-desc-item label="民族">{{info.nation}}</e-desc-item>
      <e-desc-item label="籍贯">{{info.nativePlace}}</e-desc-item>
      <e-desc-item label="政治面貌">{{info.politicalStatus}}</e-desc-item>
      <e-desc-item label="联系电话">{{info.phone}}</e-desc-item>
      <e-desc-item label="电子邮件">{{info.email}}</e-desc-item>
      <e-desc-item label="入学前技能水平">{{info.skillBefore}}</e-desc-item>
      <e-desc-item label="入学学历">{{info.eduBefore}}</e-desc-item>
      <e-desc-item label="毕业学校">{{info.schoolBefore}}</e-desc-item>
      <e-desc-item label="户口性质">{{info.residenceType=== 0 ? '城市' : info.residenceType === 1 ? '农村': info.residenceType === 2 ? '县城' : '县镇'}}</e-desc-item>



    </e-desc>
    <!-- 学生招生详情 -->
    <el-collapse v-model="isDetail"  >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生招生详情</span>
        </template>

        <e-desc margin='0 12px' label-width='120px' >
         <e-desc-item label="班型" icon="*">{{info.classType === 1 ? '就业' : '升学'}}</e-desc-item>
          <e-desc-item label="院校" icon="*">{{info.academyName}}</e-desc-item>
          <e-desc-item label="年级" icon="*">{{info.gradeName}}</e-desc-item>
          <e-desc-item label="专业" icon="*">{{info.majorName}}</e-desc-item>
          <e-desc-item label="学制" icon="*">{{info.schoolingLength}}</e-desc-item>
          <e-desc-item label="招生老师" icon="*">{{info.enrollTeacher}}</e-desc-item>
          <e-desc-item label="招生老师部门">{{info.enrollTeacherDept}}</e-desc-item>
          <e-desc-item label="招生老师电话">{{info.enrollTeacherPhone}}</e-desc-item>
          <e-desc-item label="招生季">{{info.admissionSeason}}</e-desc-item>
          <e-desc-item label="考生状态">{{info.status === 0 ? '未参加面试' : info.status === 1 ? '通过面试' :info.status === 2 ? '未通过面试' : '状态未知'}}</e-desc-item>
          <e-desc-item label="当前状态">{{info.currentStatusName }}</e-desc-item>

        </e-desc>

      </el-collapse-item>
    </el-collapse>

    <el-row style="padding: 40px;text-align: center;" >
        <el-button type="info" @click = "returnBack">返回</el-button>
    </el-row>
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
      id: 0,
      info: {
      },
      isDetail: ['1']
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('stu/temp/info'),
        method: 'get',
        params: this.$http.adornParams({
          'id': this.id
        })
      }).then(({data}) => {
        if (data.code === 500) {
          this.$message.error(data.msg)
        }
        if (data && data.code === 0) {
          this.info = data.info
        } else {
          this.$message.error(data.msg)
        }
      })
    }
  },
  created () {
    this.id = this.$route.params.stuId
  },
  mounted () {
    this.getData()
  }

}
</script>


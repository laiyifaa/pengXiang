<template>
  <div>

    <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item label="姓名" >{{info.stuName}}</e-desc-item>
      <e-desc-item label="性别">{{ info.gender }}</e-desc-item>
      <e-desc-item label="学校">{{ info.school }}</e-desc-item>
      <e-desc-item label="专业">{{ info.major }}</e-desc-item>
      <e-desc-item label="班主任">{{ info.headTeacher }}</e-desc-item>
      <e-desc-item label="宿舍楼号">{{ info.dormNum }}</e-desc-item>
      <e-desc-item label="房间号">{{ info.roomNum }}</e-desc-item>
      <e-desc-item label="床位号">{{ info.bedNum }}</e-desc-item>
      <e-desc-item label="入住日期">{{ info.checkIn }}</e-desc-item>
      <e-desc-item label="离宿日期">{{ info.leaveDate}}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.idNumber}}</e-desc-item>
      <e-desc-item label="学号">{{ info.schoolNumber}}</e-desc-item>
      <e-desc-item label="籍贯">{{ info.nativePlace}}</e-desc-item>
      <e-desc-item label="民族">{{ info.nation}}</e-desc-item>
      <e-desc-item label="联系电话">{{ info.phone}}</e-desc-item>
      <e-desc-item label="家庭联系人">{{ info.familyMemberName}}</e-desc-item>
      <e-desc-item label="家庭住址">{{ info.familyAddr}}</e-desc-item>
      <e-desc-item label="家庭年总收入（元）">{{ info.totalIncome}}</e-desc-item>
      <e-desc-item label="家庭人均收入（元）">{{ info.aveIncome}}</e-desc-item>
      <e-desc-item label="家庭经济来源">{{ info.incomeSource}}</e-desc-item>
      <e-desc-item label="学制">{{ info.schoolingLength}}</e-desc-item>
      <e-desc-item label="招生季">{{ info.admissionSeason}}</e-desc-item>
      <e-desc-item label="政治面貌">{{ info.politicalStatus}}</e-desc-item>
      <e-desc-item label="入学日期">{{ info.admissionDate}}</e-desc-item>
      <e-desc-item label="注册学籍日期">{{ info.registerDate}}</e-desc-item>



    </e-desc>

      <!-- 退费详情 -->
      <el-collapse v-model="money" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生退费详情</span>

        </template>

      <e-desc margin='0 12px' label-width='100px' >
     <e-desc-item label="退费时间">{{ info.returnMoneyTime }}</e-desc-item>
      <e-desc-item label="退费学年">{{ info.returnSchoolYear}}</e-desc-item>
      <e-desc-item label="退费金额">{{ info.returnFeeNum}}</e-desc-item>
      <e-desc-item label="退培训费">{{ info.trainFee}}</e-desc-item>
      <e-desc-item label="退服装费">{{ info.clothesFee}}</e-desc-item>
      <e-desc-item label="退教材费">{{ info.bookFee}}</e-desc-item>
      <e-desc-item label="退住宿费">{{ info.hotelFee}}</e-desc-item>
      <e-desc-item label="退被褥费">{{ info.bedFee}}</e-desc-item>
      <e-desc-item label="退保险费">{{ info.insuranceFee}}</e-desc-item>
      <e-desc-item label="退公物押金">{{ info.publicFee}}</e-desc-item>
      <e-desc-item label="退证书费">{{ info.certificateFee}}</e-desc-item>
      <e-desc-item label="退国防教育费">{{ info.defenseEduFee}}</e-desc-item>
      <e-desc-item label="退体检费">{{ info.bodyExamFee}}</e-desc-item>
      <e-desc-item label="退费账户">{{ info.account}}</e-desc-item>
      <e-desc-item label="退费账号">{{ info.accountNumber}}</e-desc-item>
      <e-desc-item label="退费开户行">{{ info.depositBank}}</e-desc-item>
      <e-desc-item label="应收合计">{{ info.returnFeeNum}}</e-desc-item>

    </e-desc>

  </el-collapse-item>
    </el-collapse>
     <el-row style="padding: 40px;text-align: center;" >
     <el-button type="primary" @click="returnBack">返回</el-button>
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
      imageUrl: '',
      formLabelWidth: '50px',
      info: {},
      money: ['1']
    }
  },
  mounted () {
    // 初始化时请求数据
    this.getDataList()
  },
  methods: {
    getDataList () {
      this.$http.get(this.$http.adornUrl(`/generator/feereturn/info/${this.$route.params.index}`)).then(({data}) => {
        if (data && data.code === 0) {
          this.info = data.returnFeeDto
        }
      })
    },
    returnBack () {
      this.$router.go(-1)
    },
    handleChange () {

    },
    errorHandler () {
      return true
    },
    handleEdit () {
      this.dialogFormVisible = true
    },
    open () {
      this.$confirm('是否导出已选择的模块信息', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        this.$message({
          type: 'success',
          message: '导出成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消导出'
        })
      })
    }
  }
}
</script>
<style scoped>
.age{
  margin-top: 100px;
}

</style>

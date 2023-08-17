<template>
  <div>

    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">

      <e-desc-item label="学号" >{{ info.schoolNumber}}</e-desc-item>
      <e-desc-item label="姓名" >{{info.stuName}}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.idNumber }}</e-desc-item>
      <e-desc-item  label="出生日期">{{ info.birthday }}</e-desc-item>
      <e-desc-item  label="毕业学校">{{ info.schoolBefore }}</e-desc-item>
      <e-desc-item label="性别">{{ info.gender }}</e-desc-item>
      <e-desc-item label="民族">{{ info.nation}}</e-desc-item>
      <e-desc-item label="籍贯">{{ info.nativePlace}}</e-desc-item>
      <e-desc-item label="户口性质">{{ info.residenceTypeName}}</e-desc-item>
      <e-desc-item label="政治面貌">{{ info.politicalStatus}}</e-desc-item>
      <e-desc-item label="联系电话">{{ info.phone}}</e-desc-item>
      <e-desc-item label="专业">{{ info.majorName}}</e-desc-item>
      <e-desc-item label="年级">{{ info.gradeName }}</e-desc-item>
      <e-desc-item label="班级">{{ info.className}}</e-desc-item>
      <e-desc-item label="班主任">{{ info.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话">{{ info.headTeacherPhone}}</e-desc-item>
      <e-desc-item label="电子邮件">{{ info.email}}</e-desc-item>
    </e-desc>
    <el-collapse v-model="money"  >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学杂费收支情况</span>
        </template>
        <el-tabs type="border-card" @tab-click="changeYear">
          <el-tab-pane label="第一学年缴费详情" id="1">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <div style="margin-bottom: 20px">
                <e-desc-item label="减免类型">  {{ FeeInfo.derateType }}</e-desc-item>
                <e-desc-item label="减免备注">  {{ FeeInfo.derateDetail }}</e-desc-item>
                <e-desc-item label="减免金额" color="#"> {{ FeeInfo.derateMoney }} </e-desc-item>
                <e-desc-item label="减免备注" color="#"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="返费时间" color="#"> {{ FeeInfo.returnFeeTime }} </e-desc-item>
                <e-desc-item label="应返费金额" color="#"> {{ FeeInfo.needReturnFeeNum }} </e-desc-item>
                <e-desc-item label="返费金额" color="#"> {{ FeeInfo.factReturnFeeNum }} </e-desc-item>
                <e-desc-item label="返费账户" color="#"> {{ FeeInfo.account }} </e-desc-item>
                <e-desc-item label="返费账号" color="#"> {{ FeeInfo.accountNumber }} </e-desc-item>
                <e-desc-item label="返费开户行" color="#"> {{ FeeInfo.depositBank }} </e-desc-item>
                <e-desc-item label="是否欠费" color="#"> {{ info.ifQMoney }} </e-desc-item>
              </div>
              <div style="margin-bottom: 20px">
                <span style="text-align: center; font-weight: bold; font-size: 15px;">实缴、应缴情况</span>
              </div>
              <div style="margin-bottom: 20px">
                <e-desc-item label="缴费学年"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="应缴培训费" color="#"  > {{ FeeInfo.payTrainFee }} </e-desc-item>
                <e-desc-item label="实缴培训费" color="#" > {{ FeeInfo.trainFee }} </e-desc-item>
                <e-desc-item label="应缴服装费" color="#" > {{ FeeInfo.payClothesFee }} </e-desc-item>
                <e-desc-item label="实缴服装费" color="#" > {{ FeeInfo.clothesFee }} </e-desc-item>
                <e-desc-item label="应缴教材费" color="#" > {{ FeeInfo.payBookFee }} </e-desc-item>
                <e-desc-item label="实缴教材费" color="#" > {{ FeeInfo.bookFee }} </e-desc-item>
                <e-desc-item label="应缴住宿费" color="#" > {{ FeeInfo.payHotelFee }} </e-desc-item>
                <e-desc-item label="实缴住宿费" color="#" > {{ FeeInfo.hotelFee }} </e-desc-item>
                <e-desc-item label="应缴被褥费" color="#" > {{ FeeInfo.payBedFee }} </e-desc-item>
                <e-desc-item label="实缴被褥费" color="#" > {{ FeeInfo.bedFee }} </e-desc-item>
                <e-desc-item label="应缴保险费" color="#" > {{ FeeInfo.payInsuranceFee }} </e-desc-item>
                <e-desc-item label="实缴保险费" color="#" > {{ FeeInfo.insuranceFee }} </e-desc-item>
                <e-desc-item label="应缴公物押金" color="#" > {{ FeeInfo.payPublicFee }} </e-desc-item>
                <e-desc-item label="实缴公物押金" color="#" > {{ FeeInfo.publicFee }} </e-desc-item>
                <e-desc-item label="应缴证书费" color="#" > {{ FeeInfo.payCertificateFee }} </e-desc-item>
                <e-desc-item label="实缴证书费" color="#" > {{ FeeInfo.certificateFee }} </e-desc-item>
                <e-desc-item label="应缴国防教育费" color="#" > {{ FeeInfo.payDefenseEduFee }} </e-desc-item>
                <e-desc-item label="实缴国防教育费" color="#" > {{ FeeInfo.defenseEduFee }} </e-desc-item>              <e-desc-item label="实缴证书费" color="#" > {{ FeeInfo.certificateFee }} </e-desc-item>
                <e-desc-item label="应缴体检费" color="#" > {{ FeeInfo.payBodyExamFee }} </e-desc-item>
                <e-desc-item label="实缴体检费" color="#" > {{ FeeInfo.bodyExamFee }} </e-desc-item>
              </div>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第二学年缴费详情" id="2">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <div style="margin-bottom: 20px">
                <e-desc-item label="减免类型">  {{ FeeInfo.derateType }}</e-desc-item>
                <e-desc-item label="减免备注">  {{ FeeInfo.derateDetail }}</e-desc-item>
                <e-desc-item label="减免金额" color="#"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="减免备注" color="#"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="返费时间" color="#"> {{ FeeInfo.returnFeeTime }} </e-desc-item>
                <e-desc-item label="应返费金额" color="#"> {{ FeeInfo.needReturnFeeNum }} </e-desc-item>
                <e-desc-item label="返费金额" color="#"> {{ FeeInfo.factReturnFeeNum }} </e-desc-item>
                <e-desc-item label="返费账户" color="#"> {{ FeeInfo.account }} </e-desc-item>
                <e-desc-item label="返费账号" color="#"> {{ FeeInfo.accountNumber }} </e-desc-item>
                <e-desc-item label="返费开户行" color="#"> {{ FeeInfo.depositBank }} </e-desc-item>
                <e-desc-item label="是否欠费" color="#"> {{ info.ifQMoney }} </e-desc-item>
              </div>
              <div style="margin-bottom: 20px">
                <span style="text-align: center; font-weight: bold; font-size: 15px;">实缴、应缴情况</span>
              </div>
              <div style="margin-bottom: 20px">
                <e-desc-item label="缴费学年"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="应缴培训费" color="#"  > {{ FeeInfo.payTrainFee }} </e-desc-item>
                <e-desc-item label="实缴培训费" color="#" > {{ FeeInfo.trainFee }} </e-desc-item>
                <e-desc-item label="应缴服装费" color="#" > {{ FeeInfo.payClothesFee }} </e-desc-item>
                <e-desc-item label="实缴服装费" color="#" > {{ FeeInfo.clothesFee }} </e-desc-item>
                <e-desc-item label="应缴教材费" color="#" > {{ FeeInfo.payBookFee }} </e-desc-item>
                <e-desc-item label="实缴教材费" color="#" > {{ FeeInfo.bookFee }} </e-desc-item>
                <e-desc-item label="应缴住宿费" color="#" > {{ FeeInfo.payHotelFee }} </e-desc-item>
                <e-desc-item label="实缴住宿费" color="#" > {{ FeeInfo.hotelFee }} </e-desc-item>
                <e-desc-item label="应缴被褥费" color="#" > {{ FeeInfo.payBedFee }} </e-desc-item>
                <e-desc-item label="实缴被褥费" color="#" > {{ FeeInfo.bedFee }} </e-desc-item>
                <e-desc-item label="应缴保险费" color="#" > {{ FeeInfo.payInsuranceFee }} </e-desc-item>
                <e-desc-item label="实缴保险费" color="#" > {{ FeeInfo.insuranceFee }} </e-desc-item>
                <e-desc-item label="应缴公物押金" color="#" > {{ FeeInfo.payPublicFee }} </e-desc-item>
                <e-desc-item label="实缴公物押金" color="#" > {{ FeeInfo.publicFee }} </e-desc-item>
                <e-desc-item label="应缴证书费" color="#" > {{ FeeInfo.payCertificateFee }} </e-desc-item>
                <e-desc-item label="实缴证书费" color="#" > {{ FeeInfo.certificateFee }} </e-desc-item>
                <e-desc-item label="应缴国防教育费" color="#" > {{ FeeInfo.payDefenseEduFee }} </e-desc-item>
                <e-desc-item label="实缴国防教育费" color="#" > {{ FeeInfo.defenseEduFee }} </e-desc-item>              <e-desc-item label="实缴证书费" color="#" > {{ FeeInfo.certificateFee }} </e-desc-item>
                <e-desc-item label="应缴体检费" color="#" > {{ FeeInfo.payBodyExamFee }} </e-desc-item>
                <e-desc-item label="实缴体检费" color="#" > {{ FeeInfo.bodyExamFee }} </e-desc-item>
              </div>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第三学年缴费详情" id="3">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <div style="margin-bottom: 20px">
                <e-desc-item label="减免类型">  {{ FeeInfo.derateType }}</e-desc-item>
                <e-desc-item label="减免备注">  {{ FeeInfo.derateDetail }}</e-desc-item>
                <e-desc-item label="减免金额" color="#"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="减免备注" color="#"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="返费时间" color="#"> {{ FeeInfo.returnFeeTime }} </e-desc-item>
                <e-desc-item label="应返费金额" color="#"> {{ FeeInfo.needReturnFeeNum }} </e-desc-item>
                <e-desc-item label="返费金额" color="#"> {{ FeeInfo.factReturnFeeNum }} </e-desc-item>
                <e-desc-item label="返费账户" color="#"> {{ FeeInfo.account }} </e-desc-item>
                <e-desc-item label="返费账号" color="#"> {{ FeeInfo.accountNumber }} </e-desc-item>
                <e-desc-item label="返费开户行" color="#"> {{ FeeInfo.depositBank }} </e-desc-item>
                <e-desc-item label="是否欠费" color="#"> {{ info.ifQMoney }} </e-desc-item>
              </div>
              <div style="margin-bottom: 20px">
                <span style="text-align: center; font-weight: bold; font-size: 15px;">实缴、应缴情况</span>
              </div>
              <div style="margin-bottom: 20px">
                <e-desc-item label="缴费学年"> {{ FeeInfo.paySchoolYear }} </e-desc-item>
                <e-desc-item label="应缴培训费" color="#"  > {{ FeeInfo.payTrainFee }} </e-desc-item>
                <e-desc-item label="实缴培训费" color="#" > {{ FeeInfo.trainFee }} </e-desc-item>
                <e-desc-item label="应缴服装费" color="#" > {{ FeeInfo.payClothesFee }} </e-desc-item>
                <e-desc-item label="实缴服装费" color="#" > {{ FeeInfo.clothesFee }} </e-desc-item>
                <e-desc-item label="应缴教材费" color="#" > {{ FeeInfo.payBookFee }} </e-desc-item>
                <e-desc-item label="实缴教材费" color="#" > {{ FeeInfo.bookFee }} </e-desc-item>
                <e-desc-item label="应缴住宿费" color="#" > {{ FeeInfo.payHotelFee }} </e-desc-item>
                <e-desc-item label="实缴住宿费" color="#" > {{ FeeInfo.hotelFee }} </e-desc-item>
                <e-desc-item label="应缴被褥费" color="#" > {{ FeeInfo.payBedFee }} </e-desc-item>
                <e-desc-item label="实缴被褥费" color="#" > {{ FeeInfo.bedFee }} </e-desc-item>
                <e-desc-item label="应缴保险费" color="#" > {{ FeeInfo.payInsuranceFee }} </e-desc-item>
                <e-desc-item label="实缴保险费" color="#" > {{ FeeInfo.insuranceFee }} </e-desc-item>
                <e-desc-item label="应缴公物押金" color="#" > {{ FeeInfo.payPublicFee }} </e-desc-item>
                <e-desc-item label="实缴公物押金" color="#" > {{ FeeInfo.publicFee }} </e-desc-item>
                <e-desc-item label="应缴证书费" color="#" > {{ FeeInfo.payCertificateFee }} </e-desc-item>
                <e-desc-item label="实缴证书费" color="#" > {{ FeeInfo.certificateFee }} </e-desc-item>
                <e-desc-item label="应缴国防教育费" color="#" > {{ FeeInfo.payDefenseEduFee }} </e-desc-item>
                <e-desc-item label="实缴国防教育费" color="#" > {{ FeeInfo.defenseEduFee }} </e-desc-item>              <e-desc-item label="实缴证书费" color="#" > {{ FeeInfo.certificateFee }} </e-desc-item>
                <e-desc-item label="应缴体检费" color="#" > {{ FeeInfo.payBodyExamFee }} </e-desc-item>
                <e-desc-item label="实缴体检费" color="#" > {{ FeeInfo.bodyExamFee }} </e-desc-item>
              </div>
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
const cityOptions = ['学生详情', '贫困情况', '缴费信息', '评定信息', '就业信息', '实习信息']
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      FeeInfoList: [],
      formLabelWidth: '50px',
      info: {
      },
      FeeInfo: {
      },
      checkAll: false,
      checkedCities: ['上海', '北京'],
      cities: cityOptions,
      isIndeterminate: true,
      activeNames: ['1'],
      f_activeNames: ['1'],
      f_workMessage: ['1'],
      f_tryWork: ['1'],
      money: ['1']
    }
  },
  created () {
    this.getDataList()
  },
  methods: {
    getDataList () {
      this.$http.get(this.$http.adornUrl(`/generator/feeschoolsundry/info/${this.$route.params.index}`)).then(({data}) => {
        if (data && data.code === 0) {
          this.info = data.infoMap.stuInfo
          this.FeeInfo = data.infoMap.feeInfo[0]
          this.FeeInfoList = data.infoMap.feeInfo
        }
      })
    },
    changeYear (tab) {
      if (this.FeeInfoList[tab.index] != null) {
        this.FeeInfo = this.FeeInfoList[tab.index]
      } else {
        this.FeeInfo = ''
      }
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

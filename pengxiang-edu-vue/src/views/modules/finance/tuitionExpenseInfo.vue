<template>
  <div>
    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
      <e-desc-item label="学号">{{ info.schoolNumber }}</e-desc-item>
      <e-desc-item label="姓名">{{ info.stuName }}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.idNumber }}</e-desc-item>
      <e-desc-item label="出生日期">{{ info.birthday }}</e-desc-item>
      <e-desc-item label="毕业学校">{{ info.schoolBefore }}</e-desc-item>
      <e-desc-item label="性别">{{ info.gender }}</e-desc-item>
      <e-desc-item label="民族">{{ info.nation }}</e-desc-item>
      <e-desc-item label="籍贯">{{ info.nativePlace }}</e-desc-item>
      <e-desc-item label="户口性质">{{ info.residenceTypeName }}</e-desc-item>
      <e-desc-item label="政治面貌">{{ info.politicalStatus }}</e-desc-item>
      <e-desc-item label="联系电话">{{ info.phone }}</e-desc-item>
      <e-desc-item label="专业">{{ info.majorName }}</e-desc-item>
      <e-desc-item label="年级">{{ info.gradeName }}</e-desc-item>
      <e-desc-item label="班级">{{ info.className }}</e-desc-item>
      <e-desc-item label="班主任">{{ info.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话">{{ info.headTeacherPhone }}</e-desc-item>
      <e-desc-item label="电子邮件">{{ info.email }}</e-desc-item>
    </e-desc>
    <el-collapse v-model="money">
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学杂费收支情况</span>
        </template>
        <el-tabs>
          <el-tab-pane v-for="(item,index) in FeeInfo" :key="index" :label="display(item[0].paySchoolYear)"
                       @click="handleClick((item))">
            <el-tabs type="border-card">
              <el-tab-pane v-for="(item, index) in item" :key="index" :label="displaySecond(index,item)">
                <e-desc margin='0 12px' label-width='140px' column="3">
                  <div style="margin-bottom: 20px">
                    <e-desc-item label="减免类型"> {{ item.derateType }}</e-desc-item>
                    <e-desc-item label="减免备注"> {{ item.derateDetail }}</e-desc-item>
                    <e-desc-item label="减免金额" color="#"> {{ item.derateMoney }}</e-desc-item>
                    <e-desc-item label="减免备注" color="#"> {{ item.paySchoolYear }}</e-desc-item>
                    <e-desc-item label="返费时间" color="#"> {{ item.returnFeeTime }}</e-desc-item>
                    <e-desc-item label="应返费金额" color="#"> {{ item.needReturnFeeNum }}</e-desc-item>
                    <e-desc-item label="返费金额" color="#"> {{ item.factReturnFeeNum }}</e-desc-item>
                    <e-desc-item label="返费账户" color="#"> {{ item.account }}</e-desc-item>
                    <e-desc-item label="返费账号" color="#"> {{ item.accountNumber }}</e-desc-item>
                    <e-desc-item label="返费开户行" color="#"> {{ item.depositBank }}</e-desc-item>
                    <e-desc-item label="是否欠费" color="#"> {{ item.ifQMoney }}</e-desc-item>
                  </div>
                  <div style="margin-bottom: 20px">
                    <span style="text-align: center; font-weight: bold; font-size: 15px;">实缴、应缴情况</span>
                  </div>
                  <div style="margin-bottom: 20px">
                    <e-desc-item label="缴费学年"> {{ item.paySchoolYear }}</e-desc-item>
                    <e-desc-item label="缴费日期"> {{ item.paySchoolDate }}</e-desc-item>
                    <e-desc-item label="应缴培训费" color="#"> {{ item.payTrainFee }}</e-desc-item>
                    <e-desc-item label="实缴培训费" color="#"> {{ item.trainFee }}</e-desc-item>
                    <e-desc-item label="应缴服装费" color="#"> {{ item.payClothesFee }}</e-desc-item>
                    <e-desc-item label="实缴服装费" color="#"> {{ item.clothesFee }}</e-desc-item>
                    <e-desc-item label="应缴教材费" color="#"> {{ item.payBookFee }}</e-desc-item>
                    <e-desc-item label="实缴教材费" color="#"> {{ item.bookFee }}</e-desc-item>
                    <e-desc-item label="应缴住宿费" color="#"> {{ item.payHotelFee }}</e-desc-item>
                    <e-desc-item label="实缴住宿费" color="#"> {{ item.hotelFee }}</e-desc-item>
                    <e-desc-item label="应缴被褥费" color="#"> {{ item.payBedFee }}</e-desc-item>
                    <e-desc-item label="实缴被褥费" color="#"> {{ item.bedFee }}</e-desc-item>
                    <e-desc-item label="应缴保险费" color="#"> {{ item.payInsuranceFee }}</e-desc-item>
                    <e-desc-item label="实缴保险费" color="#"> {{ item.insuranceFee }}</e-desc-item>
                    <e-desc-item label="应缴公物押金" color="#"> {{ item.payPublicFee }}</e-desc-item>
                    <e-desc-item label="实缴公物押金" color="#"> {{ item.publicFee }}</e-desc-item>
                    <e-desc-item label="应缴证书费" color="#"> {{ item.payCertificateFee }}</e-desc-item>
                    <e-desc-item label="实缴证书费" color="#"> {{ item.certificateFee }}</e-desc-item>
                    <e-desc-item label="应缴国防教育费" color="#"> {{ item.payDefenseEduFee }}</e-desc-item>
                    <e-desc-item label="实缴国防教育费" color="#"> {{ item.defenseEduFee }}</e-desc-item>
                    <e-desc-item label="应缴体检费" color="#"> {{ item.payBodyExamFee }}</e-desc-item>
                    <e-desc-item label="实缴体检费" color="#"> {{ item.bodyExamFee }}</e-desc-item>
                  </div>
                </e-desc>
              </el-tab-pane>
            </el-tabs>

          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>
  </div>

</template>


<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
import moment from 'moment'

export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      feeTime: [],
      FeeInfoList: [],
      formLabelWidth: '50px',
      info: {},
      FeeInfo: {},
      checkAll: false,
      checkedCities: ['上海', '北京'],
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
    handleClick (item) {
      this.feeTime = item
    },
    displaySecond (index, item) {
      if (item == null || item.id == null) {
        return '合计'
      } else {
        let x = index + 1
        return `第${x}次缴费`
      }
    },
    display (item) {
      let data = String(item)
      if (data.includes('-')) {
        const [x, y] = data.split('-')
        return `第${x}学年第${y}学期`
      } else {
        return `第${data}学年`
      }
    },
    formatDate (value) {
      if (value) {
        return moment(value).format('YY-MM-DD HH:mm:ss')
      } else {
        return null
      }
    },
    getDataList () {
      this.$http.get(this.$http.adornUrl(`/generator/feeschoolsundry/sInfo/${this.$route.query.index}/`)).then(({data}) => {
        if (data && data.code === 0) {
          this.info = data.infoMap.stuInfo
          this.FeeInfo = data.infoMap.feeInfo
          this.FeeInfo.forEach(function (value, index, array) {
            if (array[index].paySchoolDate != null) {
              array[index].paySchoolDate = array[index].paySchoolDate.substring(0, 10)
            }
            if (array[index].returnFeeTime != null) {
              array[index].returnFeeTime = array[index].returnFeeTime.substring(0, 10)
            }
          })
          this.feeTime = this.FeeInfo[1]
        }
      })
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

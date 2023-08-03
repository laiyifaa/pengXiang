<template>
    <div>
        <!-- 学生基本信息 -->

      <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item label="学号">{{ info.schoolNumber}}</e-desc-item>
      <e-desc-item label="姓名">{{info.stuName}}</e-desc-item>
      <e-desc-item label="性别">{{ info.gender }}</e-desc-item>
      <e-desc-item label="籍贯">{{info.nativePlace}}</e-desc-item>
      <e-desc-item label="民族">{{info.nation}}</e-desc-item>
      <e-desc-item label="联系电话">{{info.phone}}</e-desc-item>
      <e-desc-item label="学校">{{ info.academyName }}</e-desc-item>
      <e-desc-item label="专业">{{ info.majorName }}</e-desc-item>
      <e-desc-item label="班主任">{{ info.headTeacher }}</e-desc-item>
      <e-desc-item label="学制">{{info.schoolingLength}}</e-desc-item>
      <e-desc-item label="招生季">{{info.admissionSeason}}</e-desc-item>
      <e-desc-item label="政治面貌">{{info.politicalStatus}}</e-desc-item>
      <e-desc-item label="入学日期">{{info.admissionDate}}</e-desc-item>
      <e-desc-item label="宿舍楼号">{{ info.dormNum}}</e-desc-item>
      <e-desc-item label="房间号">{{info.roomNum}}</e-desc-item>
      <e-desc-item label="床位号">{{info.bedNum}}</e-desc-item>
      <e-desc-item label="入住日期">{{info.checkIn}}</e-desc-item>
      <e-desc-item label="离宿日期">{{info.leaveDate}}</e-desc-item>
      <e-desc-item label="家庭联系人">{{info.familyMemberName}}</e-desc-item>
      <e-desc-item label="家庭住址">{{info.familyAddr}}</e-desc-item>
      <e-desc-item label="家庭年总收入（元）">{{info.totalIncome}}</e-desc-item>
      <e-desc-item label="家庭人均收入（元）">{{info.aveIncome}}</e-desc-item>
      <e-desc-item label="家庭经济来源">{{info.incomeSource}}</e-desc-item>


    </e-desc>


       <!-- 学生欠费详情 -->
        <el-collapse v-model="money"  >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生欠费详情</span>
        </template>

        <el-tabs type="border-card" @tab-click="changeYear">
          <el-tab-pane label="第一学年欠费详情" id="1">
            <e-desc margin='0 12px' label-width='120px' label="tab  1" name="tab1">

              <e-desc-item label="欠费学年度">{{ qMoneyInfo.year }}</e-desc-item>
              <e-desc-item label="欠培训费">{{ qMoneyInfo.trainFee }}</e-desc-item>
              <e-desc-item label="欠服装费">{{ qMoneyInfo.clothesFee }}</e-desc-item>
              <e-desc-item label="欠教材费">{{ qMoneyInfo.bookFee }}</e-desc-item>
              <e-desc-item label="欠住宿费">{{ qMoneyInfo.hotelFee }}</e-desc-item>
              <e-desc-item label="欠被褥费">{{ qMoneyInfo.bedFee }}</e-desc-item>
              <e-desc-item label="欠保险费">{{ qMoneyInfo.insuranceFee }}</e-desc-item>
              <e-desc-item label="欠公物押金费">{{ qMoneyInfo.publicFee }}</e-desc-item>
              <e-desc-item label="欠证书费">{{ qMoneyInfo.certificateFee }}</e-desc-item>
              <e-desc-item label="欠国防教育费">{{ qMoneyInfo.defenseEduFee }}</e-desc-item>
              <e-desc-item label="欠体检费">{{ qMoneyInfo.bodyExamFee }}</e-desc-item>
              <e-desc-item label="欠费合计">{{ qMoneyInfo.feeNum }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第二学年欠费详情" id="2">
            <e-desc margin='0 12px' label-width='120px' >

              <e-desc-item label="欠费学年度">{{ qMoneyInfo.year }}</e-desc-item>
              <e-desc-item label="欠培训费">{{ qMoneyInfo.trainFee }}</e-desc-item>
              <e-desc-item label="欠服装费">{{ qMoneyInfo.clothesFee }}</e-desc-item>
              <e-desc-item label="欠教材费">{{ qMoneyInfo.bookFee }}</e-desc-item>
              <e-desc-item label="欠住宿费">{{ qMoneyInfo.hotelFee }}</e-desc-item>
              <e-desc-item label="欠被褥费">{{ qMoneyInfo.bedFee }}</e-desc-item>
              <e-desc-item label="欠保险费">{{ qMoneyInfo.insuranceFee }}</e-desc-item>
              <e-desc-item label="欠公物押金费">{{ qMoneyInfo.publicFee }}</e-desc-item>
              <e-desc-item label="欠证书费">{{ qMoneyInfo.certificateFee }}</e-desc-item>
              <e-desc-item label="欠国防教育费">{{ qMoneyInfo.defenseEduFee }}</e-desc-item>
              <e-desc-item label="欠体检费">{{ qMoneyInfo.bodyExamFee }}</e-desc-item>
              <e-desc-item label="欠费合计">{{ qMoneyInfo.feeNum }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第三学年欠费详情" id="3">
            <e-desc margin='0 12px' label-width='120px' >

              <e-desc-item label="欠费学年度">{{ qMoneyInfo.year }}</e-desc-item>
              <e-desc-item label="欠培训费">{{ qMoneyInfo.trainFee }}</e-desc-item>
              <e-desc-item label="欠服装费">{{ qMoneyInfo.clothesFee }}</e-desc-item>
              <e-desc-item label="欠教材费">{{ qMoneyInfo.bookFee }}</e-desc-item>
              <e-desc-item label="欠住宿费">{{ qMoneyInfo.hotelFee }}</e-desc-item>
              <e-desc-item label="欠被褥费">{{ qMoneyInfo.bedFee }}</e-desc-item>
              <e-desc-item label="欠保险费">{{ qMoneyInfo.insuranceFee }}</e-desc-item>
              <e-desc-item label="欠公物押金费">{{ qMoneyInfo.publicFee }}</e-desc-item>
              <e-desc-item label="欠证书费">{{ qMoneyInfo.certificateFee }}</e-desc-item>
              <e-desc-item label="欠国防教育费">{{ qMoneyInfo.defenseEduFee }}</e-desc-item>
              <e-desc-item label="欠体检费">{{ qMoneyInfo.bodyExamFee }}</e-desc-item>
              <e-desc-item label="欠费合计">{{ qMoneyInfo.feeNum }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>
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
        formLabelWidth: '50px',
        info: {
          id: 0,
          schoolNumber: '',
          stuName: '',
          gender: '',
          nativePlace: '',
          nation: '',
          phone: '',
          academyName: '',
          majorName: '',
          headTeacher: '',
          schoolingLength: '',
          admissionSeason: '',
          politicalStatus: '',
          admissionDate: '',
          dormNum: '',
          roomNum: '',
          bedNum: '',
          checkIn: '',
          leaveDate: '',
          familyMemberName: '',
          familyAddr: '',
          totalIncome: '',
          aveIncome: '',
          incomeSource: ''
        },
        qMoneyInfoList: [],
        qMoneyInfo: {
          year: '',
          trainFee: '',
          clothesFee: '',
          bookFee: '',
          hotelFee: '',
          bedFee: '',
          insuranceFee: '',
          publicFee: '',
          certificateFee: '',
          defenseEduFee: '',
          bodyExamFee: '',
          feeNum: ''
        },
        checkAll: false,
        isIndeterminate: true,
        money: ['1']
      }
    },
    created () {
      this.getDataList()
      this.getQmoneyList()
    },
    methods: {
      getDataList () {
        this.$http.get(this.$http.adornUrl(`/generator/feearrearage/info/${this.$route.params.index}`)).then(({data}) => {
          if (data && data.code === 0) {
            this.info = data.feeArrearage
          }
        })
      },
      getQmoneyList () {
        this.$http.get(this.$http.adornUrl(`/generator/feearrearage/qMoneyinfo/${this.$route.params.index}`)).then(({data}) => {
          if (data && data.code === 0) {
            this.qMoneyInfoList = data.qMoneyinfo

            this.qMoneyInfo = data.qMoneyinfo[0]
          }
        })
      },
      changeYear (tab) {
        if (this.qMoneyInfoList[tab.index] != null){
          this.qMoneyInfo = this.qMoneyInfoList[tab.index]
        } else {
          this.qMoneyInfo = ''
        }
      },
      returnBack () {
        this.info = '',
        this.qMoneyInfoList = '',
        this.qMoneyInfo = '',
        this.$router.go(-1)
      }
    }
  }
  </script>

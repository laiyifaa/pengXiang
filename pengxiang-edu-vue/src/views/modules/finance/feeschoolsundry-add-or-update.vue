<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="120px">
    <el-form-item label="缴费日期" prop="paySchoolDate">
      <el-input v-model="dataForm.paySchoolDate" placeholder="缴费日期" disabled="true"></el-input>
    </el-form-item>
    <el-form-item label="缴费学年" prop="paySchoolYear">
      <el-input v-model="dataForm.paySchoolYear" placeholder="缴费学年" disabled="true"></el-input>
    </el-form-item>
    <el-form-item label="实缴培训费" prop="trainFee">
      <el-input v-model="dataForm.trainFee" placeholder="实缴培训费"></el-input>
    </el-form-item>
    <el-form-item label="实缴服装费" prop="clothesFee">
      <el-input v-model="dataForm.clothesFee" placeholder="实缴服装费"></el-input>
    </el-form-item>
    <el-form-item label="实缴教材费" prop="bookFee">
      <el-input v-model="dataForm.bookFee" placeholder="实缴教材费"></el-input>
    </el-form-item>
    <el-form-item label="实缴住宿费" prop="hotelFee">
      <el-input v-model="dataForm.hotelFee" placeholder="实缴住宿费"></el-input>
    </el-form-item>
    <el-form-item label="实缴被褥费" prop="bedFee">
      <el-input v-model="dataForm.bedFee" placeholder="实缴被褥费"></el-input>
    </el-form-item>
    <el-form-item label="实缴保险费" prop="insuranceFee">
      <el-input v-model="dataForm.insuranceFee" placeholder="实缴保险费"></el-input>
    </el-form-item>
    <el-form-item label="实缴公物押金" prop="publicFee">
      <el-input v-model="dataForm.publicFee" placeholder="实缴公物押金"></el-input>
    </el-form-item>
    <el-form-item label="实缴证书费" prop="certificateFee">
      <el-input v-model="dataForm.certificateFee" placeholder="实缴证书费"></el-input>
    </el-form-item>
    <el-form-item label="实缴国防教育费" prop="defenseEduFee">
      <el-input v-model="dataForm.defenseEduFee" placeholder="实缴国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="实缴体检费" prop="bodyExamFee">
      <el-input v-model="dataForm.bodyExamFee" placeholder="实缴体检费"></el-input>
    </el-form-item>
    <el-form-item label="减免金额" prop="derateMoney">
      <el-input v-model="dataForm.derateMoney" placeholder="减免金额"></el-input>
    </el-form-item>
    <el-form-item label="减免类型 1：贫困生 0：非贫困" prop="derateType">
      <el-input v-model="dataForm.derateType" placeholder="减免类型 1：贫困生 0：非贫困"></el-input>
    </el-form-item>
    <el-form-item label="减免备注" prop="derateDetail">
      <el-input v-model="dataForm.derateDetail" placeholder="减免备注"></el-input>
    </el-form-item>
    <el-form-item label="返费时间" prop="returnFeeTime">
      <el-input v-model="dataForm.returnFeeTime" placeholder="返费时间"></el-input>
    </el-form-item>
    <el-form-item label="应返费总额" prop="needReturnFeeNum">
      <el-input v-model="dataForm.needReturnFeeNum" placeholder="应返费总额"></el-input>
    </el-form-item>
    <el-form-item label="返费金额" prop="factReturnFeeNum">
      <el-input v-model="dataForm.factReturnFeeNum" placeholder="返费金额"></el-input>
    </el-form-item>
    <el-form-item label="返费账户" prop="account">
      <el-input v-model="dataForm.account" placeholder="返费账户"></el-input>
    </el-form-item>
    <el-form-item label="返费账号" prop="accountNumber">
      <el-input v-model="dataForm.accountNumber" placeholder="返费账号"></el-input>
    </el-form-item>
    <el-form-item label="返费开户行" prop="depositBank">
      <el-input v-model="dataForm.depositBank" placeholder="返费开户行"></el-input>
    </el-form-item>
    <el-form-item label="应缴培训费" prop="payTrainFee">
      <el-input v-model="dataForm.payTrainFee" placeholder="应缴培训费"></el-input>
    </el-form-item>
    <el-form-item label="应缴服装费" prop="payClothesFee">
      <el-input v-model="dataForm.payClothesFee" placeholder="应缴服装费"></el-input>
    </el-form-item>
    <el-form-item label="应缴教材费" prop="payBookFee">
      <el-input v-model="dataForm.payBookFee" placeholder="应缴教材费"></el-input>
    </el-form-item>
    <el-form-item label="应缴住宿费" prop="payHotelFee">
      <el-input v-model="dataForm.payHotelFee" placeholder="应缴住宿费"></el-input>
    </el-form-item>
    <el-form-item label="应缴被褥费" prop="payBedFee">
      <el-input v-model="dataForm.payBedFee" placeholder="应缴被褥费"></el-input>
    </el-form-item>
    <el-form-item label="应缴保险费" prop="payInsuranceFee">
      <el-input v-model="dataForm.payInsuranceFee" placeholder="应缴保险费"></el-input>
    </el-form-item>
    <el-form-item label="应缴公物押金" prop="payPublicFee">
      <el-input v-model="dataForm.payPublicFee" placeholder="应缴公物押金"></el-input>
    </el-form-item>
    <el-form-item label="应缴证书费" prop="payCertificateFee">
      <el-input v-model="dataForm.payCertificateFee" placeholder="应缴证书费"></el-input>
    </el-form-item>
    <el-form-item label="应缴国防教育费" prop="payDefenseEduFee">
      <el-input v-model="dataForm.payDefenseEduFee" placeholder="应缴国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="应缴体检费" prop="payBodyExamFee">
      <el-input v-model="dataForm.payBodyExamFee" placeholder="应缴体检费"></el-input>
    </el-form-item>

    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          stuId: '',
          academyId: '',
          deptId: '',
          paySchoolDate: '',
          paySchoolYear: '',
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
          derateMoney: '',
          derateType: '',
          derateDetail: '',
          returnFeeTime: '',
          needReturnFeeNum: '',
          factReturnFeeNum: '',
          account: '',
          accountNumber: '',
          depositBank: '',
          payTrainFee: '',
          payClothesFee: '',
          payBookFee: '',
          payHotelFee: '',
          payBedFee: '',
          payInsuranceFee: '',
          payPublicFee: '',
          payCertificateFee: '',
          payDefenseEduFee: '',
          payBodyExamFee: '',
          isArrearage: '',
          createTime: '',
          updateTime: '',
          createBy: '',
          updateBy: '',
          isDeleted: ''
        },
        dataRule: {
          stuId: [
            { required: true, message: '学生id不能为空', trigger: 'blur' }
          ],
          academyId: [
            { required: true, message: '院校id不能为空', trigger: 'blur' }
          ],
          deptId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          paySchoolDate: [
            { required: true, message: '缴费日期不能为空', trigger: 'blur' }
          ],
          paySchoolYear: [
            { required: true, message: '缴费学年不能为空', trigger: 'blur' }
          ],
          trainFee: [
            { required: true, message: '实缴培训费不能为空', trigger: 'blur' }
          ],
          clothesFee: [
            { required: true, message: '实缴服装费不能为空', trigger: 'blur' }
          ],
          bookFee: [
            { required: true, message: '实缴教材费不能为空', trigger: 'blur' }
          ],
          hotelFee: [
            { required: true, message: '实缴住宿费不能为空', trigger: 'blur' }
          ],
          bedFee: [
            { required: true, message: '实缴被褥费不能为空', trigger: 'blur' }
          ],
          insuranceFee: [
            { required: true, message: '实缴保险费不能为空', trigger: 'blur' }
          ],
          publicFee: [
            { required: true, message: '实缴公物押金不能为空', trigger: 'blur' }
          ],
          certificateFee: [
            { required: true, message: '实缴证书费不能为空', trigger: 'blur' }
          ],
          defenseEduFee: [
            { required: true, message: '实缴国防教育费不能为空', trigger: 'blur' }
          ],
          bodyExamFee: [
            { required: true, message: '实缴体检费不能为空', trigger: 'blur' }
          ],
          derateMoney: [
            { required: true, message: '减免金额不能为空', trigger: 'blur' }
          ],
          derateType: [
            { required: true, message: '减免类型 1：贫困生 0：非贫困不能为空', trigger: 'blur' }
          ],
          derateDetail: [
            { required: true, message: '减免备注不能为空', trigger: 'blur' }
          ],
          returnFeeTime: [
            { required: true, message: '返费时间不能为空', trigger: 'blur' }
          ],
          needReturnFeeNum: [
            { required: true, message: '应返费总额不能为空', trigger: 'blur' }
          ],
          factReturnFeeNum: [
            { required: true, message: '返费金额不能为空', trigger: 'blur' }
          ],
          account: [
            { required: true, message: '返费账户不能为空', trigger: 'blur' }
          ],
          accountNumber: [
            { required: true, message: '返费账号不能为空', trigger: 'blur' }
          ],
          depositBank: [
            { required: true, message: '返费开户行不能为空', trigger: 'blur' }
          ],
          payTrainFee: [
            { required: true, message: '应缴培训费不能为空', trigger: 'blur' }
          ],
          payClothesFee: [
            { required: true, message: '应缴服装费不能为空', trigger: 'blur' }
          ],
          payBookFee: [
            { required: true, message: '应缴教材费不能为空', trigger: 'blur' }
          ],
          payHotelFee: [
            { required: true, message: '应缴住宿费不能为空', trigger: 'blur' }
          ],
          payBedFee: [
            { required: true, message: '应缴被褥费不能为空', trigger: 'blur' }
          ],
          payInsuranceFee: [
            { required: true, message: '应缴保险费不能为空', trigger: 'blur' }
          ],
          payPublicFee: [
            { required: true, message: '应缴公物押金不能为空', trigger: 'blur' }
          ],
          payCertificateFee: [
            { required: true, message: '应缴证书费不能为空', trigger: 'blur' }
          ],
          payDefenseEduFee: [
            { required: true, message: '应缴国防教育费不能为空', trigger: 'blur' }
          ],
          payBodyExamFee: [
            { required: true, message: '应缴体检费不能为空', trigger: 'blur' }
          ],
          isArrearage: [
            { required: true, message: '是否欠费 1：是 0：否不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建(缴费)时间不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '更新时间不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          updateBy: [
            { required: true, message: '修改人不能为空', trigger: 'blur' }
          ],
          isDeleted: [
            { required: true, message: '是否删除不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/generator/feeschoolsundry/infoOne/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuId = data.feeSchoolSundry.stuId
                this.dataForm.academyId = data.feeSchoolSundry.academyId
                this.dataForm.deptId = data.feeSchoolSundry.deptId
                this.dataForm.paySchoolDate = data.feeSchoolSundry.paySchoolDate
                this.dataForm.paySchoolYear = data.feeSchoolSundry.paySchoolYear
                this.dataForm.trainFee = data.feeSchoolSundry.trainFee
                this.dataForm.clothesFee = data.feeSchoolSundry.clothesFee
                this.dataForm.bookFee = data.feeSchoolSundry.bookFee
                this.dataForm.hotelFee = data.feeSchoolSundry.hotelFee
                this.dataForm.bedFee = data.feeSchoolSundry.bedFee
                this.dataForm.insuranceFee = data.feeSchoolSundry.insuranceFee
                this.dataForm.publicFee = data.feeSchoolSundry.publicFee
                this.dataForm.certificateFee = data.feeSchoolSundry.certificateFee
                this.dataForm.defenseEduFee = data.feeSchoolSundry.defenseEduFee
                this.dataForm.bodyExamFee = data.feeSchoolSundry.bodyExamFee
                this.dataForm.derateMoney = data.feeSchoolSundry.derateMoney
                this.dataForm.derateType = data.feeSchoolSundry.derateType
                this.dataForm.derateDetail = data.feeSchoolSundry.derateDetail
                this.dataForm.returnFeeTime = data.feeSchoolSundry.returnFeeTime
                this.dataForm.needReturnFeeNum = data.feeSchoolSundry.needReturnFeeNum
                this.dataForm.factReturnFeeNum = data.feeSchoolSundry.factReturnFeeNum
                this.dataForm.account = data.feeSchoolSundry.account
                this.dataForm.accountNumber = data.feeSchoolSundry.accountNumber
                this.dataForm.depositBank = data.feeSchoolSundry.depositBank
                this.dataForm.payTrainFee = data.feeSchoolSundry.payTrainFee
                this.dataForm.payClothesFee = data.feeSchoolSundry.payClothesFee
                this.dataForm.payBookFee = data.feeSchoolSundry.payBookFee
                this.dataForm.payHotelFee = data.feeSchoolSundry.payHotelFee
                this.dataForm.payBedFee = data.feeSchoolSundry.payBedFee
                this.dataForm.payInsuranceFee = data.feeSchoolSundry.payInsuranceFee
                this.dataForm.payPublicFee = data.feeSchoolSundry.payPublicFee
                this.dataForm.payCertificateFee = data.feeSchoolSundry.payCertificateFee
                this.dataForm.payDefenseEduFee = data.feeSchoolSundry.payDefenseEduFee
                this.dataForm.payBodyExamFee = data.feeSchoolSundry.payBodyExamFee
                this.dataForm.isArrearage = data.feeSchoolSundry.isArrearage
                this.dataForm.createTime = data.feeSchoolSundry.createTime
                this.dataForm.updateTime = data.feeSchoolSundry.updateTime
                this.dataForm.createBy = data.feeSchoolSundry.createBy
                this.dataForm.updateBy = data.feeSchoolSundry.updateBy
                this.dataForm.isDeleted = data.feeSchoolSundry.isDeleted
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/generator/feeschoolsundry/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuId': this.dataForm.stuId,
                'academyId': this.dataForm.academyId,
                'deptId': this.dataForm.deptId,
                'paySchoolDate': this.dataForm.paySchoolDate,
                'paySchoolYear': this.dataForm.paySchoolYear,
                'trainFee': this.dataForm.trainFee,
                'clothesFee': this.dataForm.clothesFee,
                'bookFee': this.dataForm.bookFee,
                'hotelFee': this.dataForm.hotelFee,
                'bedFee': this.dataForm.bedFee,
                'insuranceFee': this.dataForm.insuranceFee,
                'publicFee': this.dataForm.publicFee,
                'certificateFee': this.dataForm.certificateFee,
                'defenseEduFee': this.dataForm.defenseEduFee,
                'bodyExamFee': this.dataForm.bodyExamFee,
                'derateMoney': this.dataForm.derateMoney,
                'derateType': this.dataForm.derateType,
                'derateDetail': this.dataForm.derateDetail,
                'returnFeeTime': this.dataForm.returnFeeTime,
                'needReturnFeeNum': this.dataForm.needReturnFeeNum,
                'factReturnFeeNum': this.dataForm.factReturnFeeNum,
                'account': this.dataForm.account,
                'accountNumber': this.dataForm.accountNumber,
                'depositBank': this.dataForm.depositBank,
                'payTrainFee': this.dataForm.payTrainFee,
                'payClothesFee': this.dataForm.payClothesFee,
                'payBookFee': this.dataForm.payBookFee,
                'payHotelFee': this.dataForm.payHotelFee,
                'payBedFee': this.dataForm.payBedFee,
                'payInsuranceFee': this.dataForm.payInsuranceFee,
                'payPublicFee': this.dataForm.payPublicFee,
                'payCertificateFee': this.dataForm.payCertificateFee,
                'payDefenseEduFee': this.dataForm.payDefenseEduFee,
                'payBodyExamFee': this.dataForm.payBodyExamFee,
                'isArrearage': this.dataForm.isArrearage,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime,
                'createBy': this.dataForm.createBy,
                'updateBy': this.dataForm.updateBy,
                'isDeleted': this.dataForm.isDeleted
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>

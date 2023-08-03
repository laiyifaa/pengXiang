<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
<!--    <el-form-item label="学生id" prop="stuId">-->
<!--      <el-input v-model="dataForm.stuId" placeholder="学生id"></el-input>-->
<!--    </el-form-item>-->
<!--    <el-form-item label="院校id" prop="academyId">-->
<!--      <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>-->
<!--    </el-form-item>-->
<!--    <el-form-item label="" prop="deptId">-->
<!--      <el-input v-model="dataForm.deptId" placeholder=""></el-input>-->
<!--    </el-form-item>-->
    <el-form-item label="退费学年" prop="returnSchoolYear">
      <el-input v-model="dataForm.returnSchoolYear" placeholder="退费学年"></el-input>
    </el-form-item>
    <el-form-item label="退费金额" prop="returnFeeNum">
      <el-input v-model="dataForm.returnFeeNum" placeholder="退费金额"></el-input>
    </el-form-item>
    <el-form-item label="退培训费" prop="trainFee">
      <el-input v-model="dataForm.trainFee" placeholder="退培训费"></el-input>
    </el-form-item>
    <el-form-item label="退服装费" prop="clothesFee">
      <el-input v-model="dataForm.clothesFee" placeholder="退服装费"></el-input>
    </el-form-item>
    <el-form-item label="退教材费" prop="bookFee">
      <el-input v-model="dataForm.bookFee" placeholder="退教材费"></el-input>
    </el-form-item>
    <el-form-item label="退住宿费" prop="hotelFee">
      <el-input v-model="dataForm.hotelFee" placeholder="退住宿费"></el-input>
    </el-form-item>
    <el-form-item label="退被褥费" prop="bedFee">
      <el-input v-model="dataForm.bedFee" placeholder="退被褥费"></el-input>
    </el-form-item>
    <el-form-item label="退保险费" prop="insuranceFee">
      <el-input v-model="dataForm.insuranceFee" placeholder="退保险费"></el-input>
    </el-form-item>
    <el-form-item label="退公物押金" prop="publicFee">
      <el-input v-model="dataForm.publicFee" placeholder="退公物押金"></el-input>
    </el-form-item>
    <el-form-item label="退证书费" prop="certificateFee">
      <el-input v-model="dataForm.certificateFee" placeholder="退证书费"></el-input>
    </el-form-item>
    <el-form-item label="退国防教育费" prop="defenseEduFee">
      <el-input v-model="dataForm.defenseEduFee" placeholder="退国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="退体检费" prop="bodyExamFee">
      <el-input v-model="dataForm.bodyExamFee" placeholder="退体检费"></el-input>
    </el-form-item>
    <el-form-item label="退费账户" prop="account">
      <el-input v-model="dataForm.account" placeholder="退费账户"></el-input>
    </el-form-item>
    <el-form-item label="退费账号" prop="accountNumber">
      <el-input v-model="dataForm.accountNumber" placeholder="退费账号"></el-input>
    </el-form-item>
    <el-form-item label="退费开户行" prop="depositBank">
      <el-input v-model="dataForm.depositBank" placeholder="退费开户行"></el-input>
    </el-form-item>
<!--    <el-form-item label="创建(退费)时间" prop="createTime">-->
<!--      <el-input v-model="dataForm.createTime" placeholder="创建(退费)时间"></el-input>-->
<!--    </el-form-item>-->
<!--    <el-form-item label="更新时间" prop="updateTime">-->
<!--      <el-input v-model="dataForm.updateTime" placeholder="更新时间"></el-input>-->
<!--    </el-form-item>-->
<!--    <el-form-item label="创建人" prop="createBy">-->
<!--      <el-input v-model="dataForm.createBy" placeholder="创建人"></el-input>-->
<!--    </el-form-item>-->
<!--    <el-form-item label="修改人" prop="updateBy">-->
<!--      <el-input v-model="dataForm.updateBy" placeholder="修改人"></el-input>-->
<!--    </el-form-item>-->
<!--    <el-form-item label="是否删除" prop="isDeleted">-->
<!--      <el-input v-model="dataForm.isDeleted" placeholder="是否删除"></el-input>-->
<!--    </el-form-item>-->
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
          returnSchoolYear: '',
          returnFeeNum: '',
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
          account: '',
          accountNumber: '',
          depositBank: '',
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
          returnSchoolYear: [
            { required: true, message: '退费学年不能为空', trigger: 'blur' }
          ],
          returnFeeNum: [
            { required: true, message: '退费金额不能为空', trigger: 'blur' }
          ],
          trainFee: [
            { required: true, message: '退培训费不能为空', trigger: 'blur' }
          ],
          clothesFee: [
            { required: true, message: '退服装费不能为空', trigger: 'blur' }
          ],
          bookFee: [
            { required: true, message: '退教材费不能为空', trigger: 'blur' }
          ],
          hotelFee: [
            { required: true, message: '退住宿费不能为空', trigger: 'blur' }
          ],
          bedFee: [
            { required: true, message: '退被褥费不能为空', trigger: 'blur' }
          ],
          insuranceFee: [
            { required: true, message: '退保险费不能为空', trigger: 'blur' }
          ],
          publicFee: [
            { required: true, message: '退公物押金不能为空', trigger: 'blur' }
          ],
          certificateFee: [
            { required: true, message: '退证书费不能为空', trigger: 'blur' }
          ],
          defenseEduFee: [
            { required: true, message: '退国防教育费不能为空', trigger: 'blur' }
          ],
          bodyExamFee: [
            { required: true, message: '退体检费不能为空', trigger: 'blur' }
          ],
          account: [
            { required: true, message: '退费账户不能为空', trigger: 'blur' }
          ],
          accountNumber: [
            { required: true, message: '退费账号不能为空', trigger: 'blur' }
          ],
          depositBank: [
            { required: true, message: '退费开户行不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建(退费)时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/feereturn/infoOne/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuId = data.feeReturn.stuId
                this.dataForm.academyId = data.feeReturn.academyId
                this.dataForm.deptId = data.feeReturn.deptId
                this.dataForm.returnSchoolYear = data.feeReturn.returnSchoolYear
                this.dataForm.returnFeeNum = data.feeReturn.returnFeeNum
                this.dataForm.trainFee = data.feeReturn.trainFee
                this.dataForm.clothesFee = data.feeReturn.clothesFee
                this.dataForm.bookFee = data.feeReturn.bookFee
                this.dataForm.hotelFee = data.feeReturn.hotelFee
                this.dataForm.bedFee = data.feeReturn.bedFee
                this.dataForm.insuranceFee = data.feeReturn.insuranceFee
                this.dataForm.publicFee = data.feeReturn.publicFee
                this.dataForm.certificateFee = data.feeReturn.certificateFee
                this.dataForm.defenseEduFee = data.feeReturn.defenseEduFee
                this.dataForm.bodyExamFee = data.feeReturn.bodyExamFee
                this.dataForm.account = data.feeReturn.account
                this.dataForm.accountNumber = data.feeReturn.accountNumber
                this.dataForm.depositBank = data.feeReturn.depositBank
                this.dataForm.createTime = data.feeReturn.createTime
                this.dataForm.updateTime = data.feeReturn.updateTime
                this.dataForm.createBy = data.feeReturn.createBy
                this.dataForm.updateBy = data.feeReturn.updateBy
                this.dataForm.isDeleted = data.feeReturn.isDeleted
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
              url: this.$http.adornUrl(`/generator/feereturn/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuId': this.dataForm.stuId,
                'academyId': this.dataForm.academyId,
                'deptId': this.dataForm.deptId,
                'returnSchoolYear': this.dataForm.returnSchoolYear,
                'returnFeeNum': this.dataForm.returnFeeNum,
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
                'account': this.dataForm.account,
                'accountNumber': this.dataForm.accountNumber,
                'depositBank': this.dataForm.depositBank,
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

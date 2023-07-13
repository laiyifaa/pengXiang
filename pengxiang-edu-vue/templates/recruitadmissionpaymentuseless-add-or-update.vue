<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="" prop="stuId">
      <el-input v-model="dataForm.stuId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="返费账户" prop="rebateAccount">
      <el-input v-model="dataForm.rebateAccount" placeholder="返费账户"></el-input>
    </el-form-item>
    <el-form-item label="返费账号" prop="rebateAccountNumber">
      <el-input v-model="dataForm.rebateAccountNumber" placeholder="返费账号"></el-input>
    </el-form-item>
    <el-form-item label="返费开户行" prop="rebateBank">
      <el-input v-model="dataForm.rebateBank" placeholder="返费开户行"></el-input>
    </el-form-item>
    <el-form-item label="缴费日期" prop="paymentDate">
      <el-input v-model="dataForm.paymentDate" placeholder="缴费日期"></el-input>
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
          stuId: '',
          id: 0,
          rebateAccount: '',
          rebateAccountNumber: '',
          rebateBank: '',
          paymentDate: ''
        },
        dataRule: {
          stuId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          rebateAccount: [
            { required: true, message: '返费账户不能为空', trigger: 'blur' }
          ],
          rebateAccountNumber: [
            { required: true, message: '返费账号不能为空', trigger: 'blur' }
          ],
          rebateBank: [
            { required: true, message: '返费开户行不能为空', trigger: 'blur' }
          ],
          paymentDate: [
            { required: true, message: '缴费日期不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/recruitadmissionpaymentuseless/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuId = data.recruitAdmissionPaymentUseless.stuId
                this.dataForm.rebateAccount = data.recruitAdmissionPaymentUseless.rebateAccount
                this.dataForm.rebateAccountNumber = data.recruitAdmissionPaymentUseless.rebateAccountNumber
                this.dataForm.rebateBank = data.recruitAdmissionPaymentUseless.rebateBank
                this.dataForm.paymentDate = data.recruitAdmissionPaymentUseless.paymentDate
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
              url: this.$http.adornUrl(`/generator/recruitadmissionpaymentuseless/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'stuId': this.dataForm.stuId,
                'id': this.dataForm.id || undefined,
                'rebateAccount': this.dataForm.rebateAccount,
                'rebateAccountNumber': this.dataForm.rebateAccountNumber,
                'rebateBank': this.dataForm.rebateBank,
                'paymentDate': this.dataForm.paymentDate
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

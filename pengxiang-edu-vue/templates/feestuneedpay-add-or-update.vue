<template>
  <el-dialog
    :title="!dataForm.stuId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="" prop="deptId">
      <el-input v-model="dataForm.deptId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="学年（1、2、3）" prop="schoolYear">
      <el-input v-model="dataForm.schoolYear" placeholder="学年（1、2、3）"></el-input>
    </el-form-item>
    <el-form-item label="培训费" prop="trainFee">
      <el-input v-model="dataForm.trainFee" placeholder="培训费"></el-input>
    </el-form-item>
    <el-form-item label="服装费" prop="clothesFee">
      <el-input v-model="dataForm.clothesFee" placeholder="服装费"></el-input>
    </el-form-item>
    <el-form-item label="教材费" prop="bookFee">
      <el-input v-model="dataForm.bookFee" placeholder="教材费"></el-input>
    </el-form-item>
    <el-form-item label="住宿费" prop="hotelFee">
      <el-input v-model="dataForm.hotelFee" placeholder="住宿费"></el-input>
    </el-form-item>
    <el-form-item label="被褥费" prop="bedFee">
      <el-input v-model="dataForm.bedFee" placeholder="被褥费"></el-input>
    </el-form-item>
    <el-form-item label="保险费" prop="insuranceFee">
      <el-input v-model="dataForm.insuranceFee" placeholder="保险费"></el-input>
    </el-form-item>
    <el-form-item label="公物押金" prop="publicFee">
      <el-input v-model="dataForm.publicFee" placeholder="公物押金"></el-input>
    </el-form-item>
    <el-form-item label="证书费" prop="certificateFee">
      <el-input v-model="dataForm.certificateFee" placeholder="证书费"></el-input>
    </el-form-item>
    <el-form-item label="国防教育费" prop="defenseEduFee">
      <el-input v-model="dataForm.defenseEduFee" placeholder="国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="体检费" prop="bodyExamFee">
      <el-input v-model="dataForm.bodyExamFee" placeholder="体检费"></el-input>
    </el-form-item>
    <el-form-item label="应收合计" prop="totalNeedFee">
      <el-input v-model="dataForm.totalNeedFee" placeholder="应收合计"></el-input>
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
          stuId: 0,
          deptId: '',
          schoolYear: '',
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
          totalNeedFee: ''
        },
        dataRule: {
          deptId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          schoolYear: [
            { required: true, message: '学年（1、2、3）不能为空', trigger: 'blur' }
          ],
          trainFee: [
            { required: true, message: '培训费不能为空', trigger: 'blur' }
          ],
          clothesFee: [
            { required: true, message: '服装费不能为空', trigger: 'blur' }
          ],
          bookFee: [
            { required: true, message: '教材费不能为空', trigger: 'blur' }
          ],
          hotelFee: [
            { required: true, message: '住宿费不能为空', trigger: 'blur' }
          ],
          bedFee: [
            { required: true, message: '被褥费不能为空', trigger: 'blur' }
          ],
          insuranceFee: [
            { required: true, message: '保险费不能为空', trigger: 'blur' }
          ],
          publicFee: [
            { required: true, message: '公物押金不能为空', trigger: 'blur' }
          ],
          certificateFee: [
            { required: true, message: '证书费不能为空', trigger: 'blur' }
          ],
          defenseEduFee: [
            { required: true, message: '国防教育费不能为空', trigger: 'blur' }
          ],
          bodyExamFee: [
            { required: true, message: '体检费不能为空', trigger: 'blur' }
          ],
          totalNeedFee: [
            { required: true, message: '应收合计不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.stuId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.stuId) {
            this.$http({
              url: this.$http.adornUrl(`/generator/feestuneedpay/info/${this.dataForm.stuId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.deptId = data.feeStuNeedPay.deptId
                this.dataForm.schoolYear = data.feeStuNeedPay.schoolYear
                this.dataForm.trainFee = data.feeStuNeedPay.trainFee
                this.dataForm.clothesFee = data.feeStuNeedPay.clothesFee
                this.dataForm.bookFee = data.feeStuNeedPay.bookFee
                this.dataForm.hotelFee = data.feeStuNeedPay.hotelFee
                this.dataForm.bedFee = data.feeStuNeedPay.bedFee
                this.dataForm.insuranceFee = data.feeStuNeedPay.insuranceFee
                this.dataForm.publicFee = data.feeStuNeedPay.publicFee
                this.dataForm.certificateFee = data.feeStuNeedPay.certificateFee
                this.dataForm.defenseEduFee = data.feeStuNeedPay.defenseEduFee
                this.dataForm.bodyExamFee = data.feeStuNeedPay.bodyExamFee
                this.dataForm.totalNeedFee = data.feeStuNeedPay.totalNeedFee
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
              url: this.$http.adornUrl(`/generator/feestuneedpay/${!this.dataForm.stuId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'stuId': this.dataForm.stuId || undefined,
                'deptId': this.dataForm.deptId,
                'schoolYear': this.dataForm.schoolYear,
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
                'totalNeedFee': this.dataForm.totalNeedFee
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

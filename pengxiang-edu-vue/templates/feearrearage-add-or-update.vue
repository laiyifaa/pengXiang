<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="学生id" prop="stuId">
      <el-input v-model="dataForm.stuId" placeholder="学生id"></el-input>
    </el-form-item>
    <el-form-item label="院校id" prop="academyId">
      <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>
    </el-form-item>
    <el-form-item label="" prop="deptId">
      <el-input v-model="dataForm.deptId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="欠培训费" prop="ownTrainFee">
      <el-input v-model="dataForm.ownTrainFee" placeholder="欠培训费"></el-input>
    </el-form-item>
    <el-form-item label="欠服装费" prop="ownClothesFee">
      <el-input v-model="dataForm.ownClothesFee" placeholder="欠服装费"></el-input>
    </el-form-item>
    <el-form-item label="欠教材费" prop="ownBookFee">
      <el-input v-model="dataForm.ownBookFee" placeholder="欠教材费"></el-input>
    </el-form-item>
    <el-form-item label="欠住宿费" prop="ownHotelFee">
      <el-input v-model="dataForm.ownHotelFee" placeholder="欠住宿费"></el-input>
    </el-form-item>
    <el-form-item label="欠被褥费" prop="ownBedFee">
      <el-input v-model="dataForm.ownBedFee" placeholder="欠被褥费"></el-input>
    </el-form-item>
    <el-form-item label="欠保险费" prop="ownInsuranceFee">
      <el-input v-model="dataForm.ownInsuranceFee" placeholder="欠保险费"></el-input>
    </el-form-item>
    <el-form-item label="欠公物押金" prop="ownPublicFee">
      <el-input v-model="dataForm.ownPublicFee" placeholder="欠公物押金"></el-input>
    </el-form-item>
    <el-form-item label="欠证书费" prop="ownCertificateFee">
      <el-input v-model="dataForm.ownCertificateFee" placeholder="欠证书费"></el-input>
    </el-form-item>
    <el-form-item label="欠国防教育费" prop="ownDefenseEduFee">
      <el-input v-model="dataForm.ownDefenseEduFee" placeholder="欠国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="欠体检费" prop="ownBodyExamFee">
      <el-input v-model="dataForm.ownBodyExamFee" placeholder="欠体检费"></el-input>
    </el-form-item>
    <el-form-item label="欠费合计" prop="ownFeeNum">
      <el-input v-model="dataForm.ownFeeNum" placeholder="欠费合计"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="更新时间" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder="更新时间"></el-input>
    </el-form-item>
    <el-form-item label="创建人" prop="createBy">
      <el-input v-model="dataForm.createBy" placeholder="创建人"></el-input>
    </el-form-item>
    <el-form-item label="修改人" prop="updateBy">
      <el-input v-model="dataForm.updateBy" placeholder="修改人"></el-input>
    </el-form-item>
    <el-form-item label="是否删除" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder="是否删除"></el-input>
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
          ownTrainFee: '',
          ownClothesFee: '',
          ownBookFee: '',
          ownHotelFee: '',
          ownBedFee: '',
          ownInsuranceFee: '',
          ownPublicFee: '',
          ownCertificateFee: '',
          ownDefenseEduFee: '',
          ownBodyExamFee: '',
          ownFeeNum: '',
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
          ownTrainFee: [
            { required: true, message: '欠培训费不能为空', trigger: 'blur' }
          ],
          ownClothesFee: [
            { required: true, message: '欠服装费不能为空', trigger: 'blur' }
          ],
          ownBookFee: [
            { required: true, message: '欠教材费不能为空', trigger: 'blur' }
          ],
          ownHotelFee: [
            { required: true, message: '欠住宿费不能为空', trigger: 'blur' }
          ],
          ownBedFee: [
            { required: true, message: '欠被褥费不能为空', trigger: 'blur' }
          ],
          ownInsuranceFee: [
            { required: true, message: '欠保险费不能为空', trigger: 'blur' }
          ],
          ownPublicFee: [
            { required: true, message: '欠公物押金不能为空', trigger: 'blur' }
          ],
          ownCertificateFee: [
            { required: true, message: '欠证书费不能为空', trigger: 'blur' }
          ],
          ownDefenseEduFee: [
            { required: true, message: '欠国防教育费不能为空', trigger: 'blur' }
          ],
          ownBodyExamFee: [
            { required: true, message: '欠体检费不能为空', trigger: 'blur' }
          ],
          ownFeeNum: [
            { required: true, message: '欠费合计不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/feearrearage/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuId = data.feeArrearage.stuId
                this.dataForm.academyId = data.feeArrearage.academyId
                this.dataForm.deptId = data.feeArrearage.deptId
                this.dataForm.ownTrainFee = data.feeArrearage.ownTrainFee
                this.dataForm.ownClothesFee = data.feeArrearage.ownClothesFee
                this.dataForm.ownBookFee = data.feeArrearage.ownBookFee
                this.dataForm.ownHotelFee = data.feeArrearage.ownHotelFee
                this.dataForm.ownBedFee = data.feeArrearage.ownBedFee
                this.dataForm.ownInsuranceFee = data.feeArrearage.ownInsuranceFee
                this.dataForm.ownPublicFee = data.feeArrearage.ownPublicFee
                this.dataForm.ownCertificateFee = data.feeArrearage.ownCertificateFee
                this.dataForm.ownDefenseEduFee = data.feeArrearage.ownDefenseEduFee
                this.dataForm.ownBodyExamFee = data.feeArrearage.ownBodyExamFee
                this.dataForm.ownFeeNum = data.feeArrearage.ownFeeNum
                this.dataForm.createTime = data.feeArrearage.createTime
                this.dataForm.updateTime = data.feeArrearage.updateTime
                this.dataForm.createBy = data.feeArrearage.createBy
                this.dataForm.updateBy = data.feeArrearage.updateBy
                this.dataForm.isDeleted = data.feeArrearage.isDeleted
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
              url: this.$http.adornUrl(`/generator/feearrearage/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuId': this.dataForm.stuId,
                'academyId': this.dataForm.academyId,
                'deptId': this.dataForm.deptId,
                'ownTrainFee': this.dataForm.ownTrainFee,
                'ownClothesFee': this.dataForm.ownClothesFee,
                'ownBookFee': this.dataForm.ownBookFee,
                'ownHotelFee': this.dataForm.ownHotelFee,
                'ownBedFee': this.dataForm.ownBedFee,
                'ownInsuranceFee': this.dataForm.ownInsuranceFee,
                'ownPublicFee': this.dataForm.ownPublicFee,
                'ownCertificateFee': this.dataForm.ownCertificateFee,
                'ownDefenseEduFee': this.dataForm.ownDefenseEduFee,
                'ownBodyExamFee': this.dataForm.ownBodyExamFee,
                'ownFeeNum': this.dataForm.ownFeeNum,
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

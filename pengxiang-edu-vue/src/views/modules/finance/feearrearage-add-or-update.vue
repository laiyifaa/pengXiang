<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">

    <el-form-item label="年份" prop="year" >
      <el-input v-model="dataForm.year" placeholder="年份" disabled="true"></el-input>
    </el-form-item>
    <el-form-item label="欠培训费" prop="trainFee">
      <el-input v-model="dataForm.trainFee" placeholder="欠培训费"></el-input>
    </el-form-item>
    <el-form-item label="欠服装费" prop="clothesFee">
      <el-input v-model="dataForm.clothesFee" placeholder="欠服装费"></el-input>
    </el-form-item>
    <el-form-item label="欠教材费" prop="bookFee">
      <el-input v-model="dataForm.bookFee" placeholder="欠教材费"></el-input>
    </el-form-item>
    <el-form-item label="欠住宿费" prop="hotelFee">
      <el-input v-model="dataForm.hotelFee" placeholder="欠住宿费"></el-input>
    </el-form-item>
    <el-form-item label="欠被褥费" prop="bedFee">
      <el-input v-model="dataForm.bedFee" placeholder="欠被褥费"></el-input>
    </el-form-item>
    <el-form-item label="欠保险费" prop="insuranceFee">
      <el-input v-model="dataForm.insuranceFee" placeholder="欠保险费"></el-input>
    </el-form-item>
    <el-form-item label="欠公物押金" prop="publicFee">
      <el-input v-model="dataForm.publicFee" placeholder="欠公物押金"></el-input>
    </el-form-item>
    <el-form-item label="欠证书费" prop="certificateFee">
      <el-input v-model="dataForm.certificateFee" placeholder="欠证书费"></el-input>
    </el-form-item>
    <el-form-item label="欠国防教育费" prop="defenseEduFee">
      <el-input v-model="dataForm.defenseEduFee" placeholder="欠国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="欠体检费" prop="bodyExamFee">
      <el-input v-model="dataForm.bodyExamFee" placeholder="欠体检费"></el-input>
    </el-form-item>
    <el-form-item label="欠费合计" prop="feeNum">
      <el-input v-model="dataForm.feeNum" placeholder="欠费合计"></el-input>
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
          feeNum: '',
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
          year: [
            { required: false, message: '年份不能为空', trigger: 'blur' }
          ],
          trainFee: [
            { required: true, message: '欠培训费不能为空', trigger: 'blur' }
          ],
          clothesFee: [
            { required: true, message: '欠服装费不能为空', trigger: 'blur' }
          ],
          bookFee: [
            { required: true, message: '欠教材费不能为空', trigger: 'blur' }
          ],
          hotelFee: [
            { required: true, message: '欠住宿费不能为空', trigger: 'blur' }
          ],
          bedFee: [
            { required: true, message: '欠被褥费不能为空', trigger: 'blur' }
          ],
          insuranceFee: [
            { required: true, message: '欠保险费不能为空', trigger: 'blur' }
          ],
          publicFee: [
            { required: true, message: '欠公物押金不能为空', trigger: 'blur' }
          ],
          certificateFee: [
            { required: true, message: '欠证书费不能为空', trigger: 'blur' }
          ],
          defenseEduFee: [
            { required: true, message: '欠国防教育费不能为空', trigger: 'blur' }
          ],
          bodyExamFee: [
            { required: true, message: '欠体检费不能为空', trigger: 'blur' }
          ],
          feeNum: [
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
                this.dataForm.year = data.feeArrearage.year
                this.dataForm.trainFee = data.feeArrearage.trainFee
                this.dataForm.clothesFee = data.feeArrearage.clothesFee
                this.dataForm.bookFee = data.feeArrearage.bookFee
                this.dataForm.hotelFee = data.feeArrearage.hotelFee
                this.dataForm.bedFee = data.feeArrearage.bedFee
                this.dataForm.insuranceFee = data.feeArrearage.insuranceFee
                this.dataForm.publicFee = data.feeArrearage.publicFee
                this.dataForm.certificateFee = data.feeArrearage.certificateFee
                this.dataForm.defenseEduFee = data.feeArrearage.defenseEduFee
                this.dataForm.bodyExamFee = data.feeArrearage.bodyExamFee
                this.dataForm.feeNum = data.feeArrearage.feeNum
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
                'year': this.dataForm.year,
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
                'feeNum': this.dataForm.feeNum,
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

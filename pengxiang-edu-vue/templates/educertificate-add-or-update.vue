<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="证书名称（茶艺证、礼仪证、铁路客服证、急救证、普通话证、教师资格证、保育员证等，其他证书）" prop="
certificateName">
      <el-input v-model="dataForm.
certificateName" placeholder="证书名称（茶艺证、礼仪证、铁路客服证、急救证、普通话证、教师资格证、保育员证等，其他证书）"></el-input>
    </el-form-item>
    <el-form-item label="证书级别" prop="certificateLevel">
      <el-input v-model="dataForm.certificateLevel" placeholder="证书级别"></el-input>
    </el-form-item>
    <el-form-item label="" prop="stuId">
      <el-input v-model="dataForm.stuId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="联办校" prop="jointSchools">
      <el-input v-model="dataForm.jointSchools" placeholder="联办校"></el-input>
    </el-form-item>
    <el-form-item label="培训时间" prop="trainingTime">
      <el-input v-model="dataForm.trainingTime" placeholder="培训时间"></el-input>
    </el-form-item>
    <el-form-item label="培训地点" prop="trainingPlace">
      <el-input v-model="dataForm.trainingPlace" placeholder="培训地点"></el-input>
    </el-form-item>
    <el-form-item label="考试方式" prop="examinationMethod">
      <el-input v-model="dataForm.examinationMethod" placeholder="考试方式"></el-input>
    </el-form-item>
    <el-form-item label="理论考试成绩" prop="theoreticalExaminationResults">
      <el-input v-model="dataForm.theoreticalExaminationResults" placeholder="理论考试成绩"></el-input>
    </el-form-item>
    <el-form-item label="实践考试成绩" prop="practicalExaminationResults">
      <el-input v-model="dataForm.practicalExaminationResults" placeholder="实践考试成绩"></el-input>
    </el-form-item>
    <el-form-item label="总评成绩" prop="totalResults">
      <el-input v-model="dataForm.totalResults" placeholder="总评成绩"></el-input>
    </el-form-item>
    <el-form-item label="错补证信息（无，已补发/未补发）" prop="wrongCertificateSupplementInformation">
      <el-input v-model="dataForm.wrongCertificateSupplementInformation" placeholder="错补证信息（无，已补发/未补发）"></el-input>
    </el-form-item>
    <el-form-item label="培训年月" prop="
trainingDate">
      <el-input v-model="dataForm.
trainingDate" placeholder="培训年月"></el-input>
    </el-form-item>
    <el-form-item label="发证日期" prop="dateOfIssue">
      <el-input v-model="dataForm.dateOfIssue" placeholder="发证日期"></el-input>
    </el-form-item>
    <el-form-item label="备注" prop="remarks">
      <el-input v-model="dataForm.remarks" placeholder="备注"></el-input>
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
          
certificateName: '',
          certificateLevel: '',
          stuId: '',
          jointSchools: '',
          trainingTime: '',
          trainingPlace: '',
          examinationMethod: '',
          theoreticalExaminationResults: '',
          practicalExaminationResults: '',
          totalResults: '',
          wrongCertificateSupplementInformation: '',
          
trainingDate: '',
          dateOfIssue: '',
          remarks: ''
        },
        dataRule: {
          
certificateName: [
            { required: true, message: '证书名称（茶艺证、礼仪证、铁路客服证、急救证、普通话证、教师资格证、保育员证等，其他证书）不能为空', trigger: 'blur' }
          ],
          certificateLevel: [
            { required: true, message: '证书级别不能为空', trigger: 'blur' }
          ],
          stuId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          jointSchools: [
            { required: true, message: '联办校不能为空', trigger: 'blur' }
          ],
          trainingTime: [
            { required: true, message: '培训时间不能为空', trigger: 'blur' }
          ],
          trainingPlace: [
            { required: true, message: '培训地点不能为空', trigger: 'blur' }
          ],
          examinationMethod: [
            { required: true, message: '考试方式不能为空', trigger: 'blur' }
          ],
          theoreticalExaminationResults: [
            { required: true, message: '理论考试成绩不能为空', trigger: 'blur' }
          ],
          practicalExaminationResults: [
            { required: true, message: '实践考试成绩不能为空', trigger: 'blur' }
          ],
          totalResults: [
            { required: true, message: '总评成绩不能为空', trigger: 'blur' }
          ],
          wrongCertificateSupplementInformation: [
            { required: true, message: '错补证信息（无，已补发/未补发）不能为空', trigger: 'blur' }
          ],
          
trainingDate: [
            { required: true, message: '培训年月不能为空', trigger: 'blur' }
          ],
          dateOfIssue: [
            { required: true, message: '发证日期不能为空', trigger: 'blur' }
          ],
          remarks: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/educertificate/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.
certificateName = data.eduCertificate.
certificateName
                this.dataForm.certificateLevel = data.eduCertificate.certificateLevel
                this.dataForm.stuId = data.eduCertificate.stuId
                this.dataForm.jointSchools = data.eduCertificate.jointSchools
                this.dataForm.trainingTime = data.eduCertificate.trainingTime
                this.dataForm.trainingPlace = data.eduCertificate.trainingPlace
                this.dataForm.examinationMethod = data.eduCertificate.examinationMethod
                this.dataForm.theoreticalExaminationResults = data.eduCertificate.theoreticalExaminationResults
                this.dataForm.practicalExaminationResults = data.eduCertificate.practicalExaminationResults
                this.dataForm.totalResults = data.eduCertificate.totalResults
                this.dataForm.wrongCertificateSupplementInformation = data.eduCertificate.wrongCertificateSupplementInformation
                this.dataForm.
trainingDate = data.eduCertificate.
trainingDate
                this.dataForm.dateOfIssue = data.eduCertificate.dateOfIssue
                this.dataForm.remarks = data.eduCertificate.remarks
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
              url: this.$http.adornUrl(`/generator/educertificate/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                '
certificateName': this.dataForm.
certificateName,
                'certificateLevel': this.dataForm.certificateLevel,
                'stuId': this.dataForm.stuId,
                'jointSchools': this.dataForm.jointSchools,
                'trainingTime': this.dataForm.trainingTime,
                'trainingPlace': this.dataForm.trainingPlace,
                'examinationMethod': this.dataForm.examinationMethod,
                'theoreticalExaminationResults': this.dataForm.theoreticalExaminationResults,
                'practicalExaminationResults': this.dataForm.practicalExaminationResults,
                'totalResults': this.dataForm.totalResults,
                'wrongCertificateSupplementInformation': this.dataForm.wrongCertificateSupplementInformation,
                '
trainingDate': this.dataForm.
trainingDate,
                'dateOfIssue': this.dataForm.dateOfIssue,
                'remarks': this.dataForm.remarks
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

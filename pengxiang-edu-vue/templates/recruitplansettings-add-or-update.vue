<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="年级" prop="grade">
      <el-input v-model="dataForm.grade" placeholder="年级"></el-input>
    </el-form-item>
    <el-form-item label="招生季" prop="admissionSeason">
      <el-input v-model="dataForm.admissionSeason" placeholder="招生季"></el-input>
    </el-form-item>
    <el-form-item label="专业" prop="majorid">
      <el-input v-model="dataForm.majorid" placeholder="专业"></el-input>
    </el-form-item>
    <el-form-item label="升学/就业" prop="further">
      <el-input v-model="dataForm.further" placeholder="升学/就业"></el-input>
    </el-form-item>
    <el-form-item label="招生计划" prop="enrollmentPlan">
      <el-input v-model="dataForm.enrollmentPlan" placeholder="招生计划"></el-input>
    </el-form-item>
    <el-form-item label="院校id" prop="schoolId">
      <el-input v-model="dataForm.schoolId" placeholder="院校id"></el-input>
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
          grade: '',
          admissionSeason: '',
          majorid: '',
          further: '',
          enrollmentPlan: '',
          schoolId: ''
        },
        dataRule: {
          grade: [
            { required: true, message: '年级不能为空', trigger: 'blur' }
          ],
          admissionSeason: [
            { required: true, message: '招生季不能为空', trigger: 'blur' }
          ],
          majorid: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          further: [
            { required: true, message: '升学/就业不能为空', trigger: 'blur' }
          ],
          enrollmentPlan: [
            { required: true, message: '招生计划不能为空', trigger: 'blur' }
          ],
          schoolId: [
            { required: true, message: '院校id不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/recruitplansettings/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.grade = data.recruitPlanSettings.grade
                this.dataForm.admissionSeason = data.recruitPlanSettings.admissionSeason
                this.dataForm.majorid = data.recruitPlanSettings.majorid
                this.dataForm.further = data.recruitPlanSettings.further
                this.dataForm.enrollmentPlan = data.recruitPlanSettings.enrollmentPlan
                this.dataForm.schoolId = data.recruitPlanSettings.schoolId
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
              url: this.$http.adornUrl(`/generator/recruitplansettings/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'grade': this.dataForm.grade,
                'admissionSeason': this.dataForm.admissionSeason,
                'majorid': this.dataForm.majorid,
                'further': this.dataForm.further,
                'enrollmentPlan': this.dataForm.enrollmentPlan,
                'schoolId': this.dataForm.schoolId
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

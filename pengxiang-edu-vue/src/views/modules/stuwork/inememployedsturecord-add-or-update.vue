<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
      <el-form-item label="姓名" prop="stuName">
        <el-input disabled v-model="dataForm.stuName" placeholder="姓名"></el-input>
      </el-form-item>
      <el-form-item label="学号" prop="schoolNumber">
        <el-input disabled v-model="dataForm.schoolNumber" placeholder="学号"></el-input>
      </el-form-item>

      <el-form-item label="入学日期" prop="studyIn">
        <el-input disabled v-model="dataForm.admissionDate" placeholder="入学日期"></el-input>
      </el-form-item>
<!--      <el-form-item label="系部" prop="dept">-->
<!--        <el-input v-model="dataForm.dept" placeholder="系部"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="专业" prop="major">-->
<!--        <el-input v-model="dataForm.major" placeholder="专业"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="年级" prop="grade">-->
<!--        <el-input v-model="dataForm.grade" placeholder="年级"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="班级" prop="className">-->
<!--        <el-input v-model="dataForm.className" placeholder="班级"></el-input>-->
<!--      </el-form-item>-->
      <el-form-item label="现就读学校" prop="studyIn">
        <el-input disabled v-model="dataForm.studyIn" placeholder="现就读学校"></el-input>
      </el-form-item>
      <el-form-item label="现学籍学校" prop="statusSchool">
        <el-input disabled v-model="dataForm.statusSchool" placeholder="现学籍学校"></el-input>
      </el-form-item>


      <el-form-item label="离校日期" prop="leaveDate">
        <el-input v-model="dataForm.leaveDate" placeholder="离校日期" type="date"></el-input>
      </el-form-item>

      <el-form-item label="离校原因" prop="leaveReason">
        <el-input v-model="dataForm.leaveReason" placeholder="离校原因(上岗就业或自主择业)"></el-input>
      </el-form-item>

      <el-form-item label="就业单位" prop="workIn">
        <el-input v-model="dataForm.workIn" placeholder="就业单位"></el-input>
      </el-form-item>

      <el-form-item label="就业岗位" prop="job">
        <el-input v-model="dataForm.job" placeholder="就业岗位"></el-input>
      </el-form-item>
      <el-form-item label="试用期薪酬" prop="probationSalary">
        <el-input v-model="dataForm.probationSalary" placeholder="试用期薪酬"></el-input>
      </el-form-item>
      <el-form-item label="转正薪酬" prop="regularizeSalary">
        <el-input v-model="dataForm.regularizeSalary" placeholder="转正薪酬"></el-input>
      </el-form-item>
      <el-form-item label="岗位负责人" prop="workLeader">
        <el-input v-model="dataForm.workLeader" placeholder="岗位负责人"></el-input>
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
  data() {
    return {
      visible: false,
      dataForm: {
        id: 0,
        stuId: '',
        deptId: '',
        admissionDate: '',
        leaveDate: '',
        leaveReason: '',
        workIn: '',
        job: '',
        trialPeriod: '',
        probationSalary: '',
        regularizeSalary: '',
        workLeader: ''
      },
      dataRule: {
        stuId: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        deptId: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        admissionDate: [
          {required: true, message: '入学日期不能为空', trigger: 'blur'}
        ],
        leaveDate: [
          {required: true, message: '离校日期不能为空', trigger: 'blur'}
        ],
        leaveReason: [
          {required: true, message: '离校原因(上岗就业或自主择业)不能为空', trigger: 'blur'}
        ],
        workIn: [
          {required: true, message: '就业单位不能为空', trigger: 'blur'}
        ],
        job: [
          {required: true, message: '就业岗位不能为空', trigger: 'blur'}
        ],
        trialPeriod: [
          {required: true, message: '试用期限不能为空', trigger: 'blur'}
        ],
        probationSalary: [
          {required: true, message: '试用期薪酬不能为空', trigger: 'blur'}
        ],
        regularizeSalary: [
          {required: true, message: '转正薪酬不能为空', trigger: 'blur'}
        ],
        workLeader: [
          {required: true, message: '岗位负责人不能为空', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    init(id) {
      this.dataForm.id = id || 0
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/generator/stuwork/employedInfo/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            console.log(data)
            if (data && data.code === 0) {
              // this.dataForm.stuId = data.inemEmployedStuRecord.stuId
              this.dataForm.admissionDate = data.inemEmployedStuRecord.admissionDate
              this.dataForm.leaveDate = data.inemEmployedStuRecord.leaveDate
              this.dataForm.leaveReason = data.inemEmployedStuRecord.leaveReason
              this.dataForm.workIn = data.inemEmployedStuRecord.workIn
              this.dataForm.job = data.inemEmployedStuRecord.job
              this.dataForm.trialPeriod = data.inemEmployedStuRecord.trialPeriod
              this.dataForm.probationSalary = data.inemEmployedStuRecord.probationSalary
              this.dataForm.regularizeSalary = data.inemEmployedStuRecord.regularizeSalary
              this.dataForm.workLeader = data.inemEmployedStuRecord.workLeader
              this.dataForm.schoolNumber = data.inemEmployedStuRecord.schoolNumber
              this.dataForm.stuName = data.inemEmployedStuRecord.stuName
              this.dataForm.studyIn = data.inemEmployedStuRecord.studyIn
              this.dataForm.statusSchool = data.inemEmployedStuRecord.statusSchool
            }
          })
        }
      })
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.$http({
            url: this.$http.adornUrl(`/generator/inememployedsturecord/${!this.dataForm.id ? 'save' : 'update'}`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id || undefined,
              // 'stuId': this.dataForm.stuId,
              // 'deptId': this.dataForm.deptId,
              // 'admissionDate': this.dataForm.admissionDate,
              'leaveDate': this.dataForm.leaveDate,
              'leaveReason': this.dataForm.leaveReason,
              'workIn': this.dataForm.workIn,
              'job': this.dataForm.job,
              'trialPeriod': this.dataForm.trialPeriod,
              'probationSalary': this.dataForm.probationSalary,
              'regularizeSalary': this.dataForm.regularizeSalary,
              'workLeader': this.dataForm.workLeader
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

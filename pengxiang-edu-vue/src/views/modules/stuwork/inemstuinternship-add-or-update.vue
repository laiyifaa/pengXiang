<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="150px" label-position="left">
      <el-form-item label="姓名" prop="stuName">
        <el-input disabled v-model="dataForm.stuName" placeholder="姓名"></el-input>
      </el-form-item>
      <el-form-item label="学号" prop="schoolNumber">
        <el-input disabled v-model="dataForm.schoolNumber" placeholder="学号"></el-input>
      </el-form-item>
<!--      <el-form-item label="系部" prop="academyName">-->
<!--        <el-input disabled v-model="dataForm.academyName" placeholder="系部"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="专业" prop="major">-->
<!--        <el-input disabled v-model="dataForm.major" placeholder="专业"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="年级" prop="grade">-->
<!--        <el-input disabled v-model="dataForm.grade" placeholder="年级"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="班级" prop="className">-->
<!--        <el-input disabled v-model="dataForm.className" placeholder="班级"></el-input>-->
<!--      </el-form-item>-->
      <el-form-item label="实习类别" prop="internshipType">
        <el-input v-model="dataForm.internshipType" placeholder="实习类别"></el-input>
      </el-form-item>
      <el-form-item label="实习单位" prop="internshipUnit">
        <el-input v-model="dataForm.internshipUnit" placeholder="实习单位"></el-input>
      </el-form-item>
      <el-form-item label="实习岗位" prop="internshipPost">
        <el-input v-model="dataForm.internshipPost" placeholder="实习岗位"></el-input>
      </el-form-item>
      <el-form-item label="实习报酬" prop="internshipSalary">
        <el-input v-model="dataForm.internshipSalary" placeholder="实习报酬"></el-input>
      </el-form-item>
      <el-form-item label="带队老师" prop="className">
        <el-input v-model="dataForm.leadTeacher" placeholder="带队老师"></el-input>
      </el-form-item>
      <el-form-item label="现就读学校" prop="studyIn">
        <el-input disabled v-model="dataForm.studyIn" placeholder="现就读学校"></el-input>
      </el-form-item>
      <el-form-item label="现学籍学校" prop="statusSchool">
        <el-input disabled v-model="dataForm.statusSchool" placeholder="现学籍学校"></el-input>
      </el-form-item>
      <el-form-item label="学生实习鉴定结果(优、良、合格、不合格)" prop="internshipResults">
        <el-input v-model="dataForm.internshipResults" placeholder="学生实习鉴定结果(优、良、合格、不合格)"></el-input>
      </el-form-item>
      <el-form-item label="实习离校日期" prop="internshipLeaveDate">
        <el-input v-model="dataForm.internshipLeaveDate" placeholder="实习离校日期" type="date"></el-input>
      </el-form-item>
      <el-form-item label="预计实习结束日期" prop="expectedEndDate">
        <el-input v-model="dataForm.expectedEndDate" placeholder="预计实习结束日期" type="date"></el-input>
      </el-form-item>
      <el-form-item label="实际实习结束日期" prop="actualEndDate">
        <el-input v-model="dataForm.actualEndDate" placeholder="实际实习结束日期" type="date"></el-input>
      </el-form-item>
      <el-form-item label="对岗位是否满意" prop="isSatisfied">
        <el-input v-model="dataForm.isSatisfied" placeholder="实际实习结束日期"></el-input>
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
        internshipType: '',
        internshipUnit: '',
        internshipSalary: '',
        internshipPost: '',
        internshipLeaveDate: '',
        expectedEndDate: '',
        actualEndDate: '',
        internshipResults: '',
        isSatisfied: '',
        leadTeacher: ''
      },
      dataRule: {
        stuId: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        internshipType: [
          {required: true, message: '实习类别(认识实习、岗位实习)不能为空', trigger: 'blur'}
        ],
        internshipUnit: [
          {required: true, message: '实习单位不能为空', trigger: 'blur'}
        ],
        internshipSalary: [
          {required: true, message: '实习报酬不能为空', trigger: 'blur'}
        ],
        internshipPost: [
          {required: true, message: '实习岗位不能为空', trigger: 'blur'}
        ],
        internshipLeaveDate: [
          {required: true, message: '实习离校日期不能为空', trigger: 'blur'}
        ],
        expectedEndDate: [
          {required: true, message: '预计实习结束日期不能为空', trigger: 'blur'}
        ],
        actualEndDate: [
          {required: true, message: '实际实习结束日期不能为空', trigger: 'blur'}
        ],
        internshipResults: [
          {required: true, message: '学生实习鉴定结果(优、良、合格、不合格)不能为空', trigger: 'blur'}
        ],
        isSatisfied: [
          {required: true, message: '是否对岗位满意不能为空', trigger: 'blur'}
        ],
        leadTeacher: [
          {required: true, message: '带队教师不能为空', trigger: 'blur'}
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
            url: this.$http.adornUrl(`/generator/stuwork/internshipInfo/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.inemStuInternship.id
              this.dataForm.stuId = data.inemStuInternship.stuId
              this.dataForm.internshipType = data.inemStuInternship.internshipType
              this.dataForm.internshipUnit = data.inemStuInternship.internshipUnit
              this.dataForm.internshipSalary = data.inemStuInternship.internshipSalary
              this.dataForm.internshipPost = data.inemStuInternship.internshipPost
              this.dataForm.internshipLeaveDate = data.inemStuInternship.internshipLeaveDate
              this.dataForm.expectedEndDate = data.inemStuInternship.expectedEndDate
              this.dataForm.actualEndDate = data.inemStuInternship.actualEndDate
              this.dataForm.internshipResults = data.inemStuInternship.internshipResults
              this.dataForm.isSatisfied = data.inemStuInternship.isSatisfied
              this.dataForm.leadTeacher = data.inemStuInternship.leadTeacher
              this.dataForm.schoolNumber = data.inemStuInternship.schoolNumber
              this.dataForm.stuName = data.inemStuInternship.stuName
              // this.dataForm.academyName = data.inemStuInternship.academyName
              // this.dataForm.grade = data.inemStuInternship.grade
              // this.dataForm.className = data.inemStuInternship.className
              // this.dataForm.major = data.inemStuInternship.major
              this.dataForm.studyIn = data.inemStuInternship.studyIn
              this.dataForm.statusSchool = data.inemStuInternship.statusSchool
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
            url: this.$http.adornUrl(`/generator/inemstuinternship/${!this.dataForm.id ? 'save' : 'update'}`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id || undefined,
              'stuId': this.dataForm.stuId,
              'internshipType': this.dataForm.internshipType,
              'internshipUnit': this.dataForm.internshipUnit,
              'internshipSalary': this.dataForm.internshipSalary,
              'internshipPost': this.dataForm.internshipPost,
              'internshipLeaveDate': this.dataForm.internshipLeaveDate,
              'expectedEndDate': this.dataForm.expectedEndDate,
              'actualEndDate': this.dataForm.actualEndDate,
              'internshipResults': this.dataForm.internshipResults,
              'isSatisfied': this.dataForm.isSatisfied,
              'leadTeacher': this.dataForm.leadTeacher
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
<style scoped>
  el-form-item{
    width: 40px;
  }
</style>

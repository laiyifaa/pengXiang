<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="" prop="academyId">
      <el-input v-model="dataForm.academyId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="changeDate">
      <el-input v-model="dataForm.changeDate" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="系部" prop="dept">
      <el-input v-model="dataForm.dept" placeholder="系部"></el-input>
    </el-form-item>
    <el-form-item label="专业" prop="major">
      <el-input v-model="dataForm.major" placeholder="专业"></el-input>
    </el-form-item>
    <el-form-item label="" prop="grade">
      <el-input v-model="dataForm.grade" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="班级" prop="class">
      <el-input v-model="dataForm.class" placeholder="班级"></el-input>
    </el-form-item>
    <el-form-item label="班主任" prop="headTeacher">
      <el-input v-model="dataForm.headTeacher" placeholder="班主任"></el-input>
    </el-form-item>
    <el-form-item label="班主任电话" prop="phone">
      <el-input v-model="dataForm.phone" placeholder="班主任电话"></el-input>
    </el-form-item>
    <el-form-item label="" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="createBy">
      <el-input v-model="dataForm.createBy" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="updateBy">
      <el-input v-model="dataForm.updateBy" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder=""></el-input>
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
          academyId: '',
          changeDate: '',
          dept: '',
          major: '',
          grade: '',
          class: '',
          headTeacher: '',
          phone: '',
          createTime: '',
          updateTime: '',
          createBy: '',
          updateBy: '',
          isDeleted: ''
        },
        dataRule: {
          academyId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          changeDate: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          dept: [
            { required: true, message: '系部不能为空', trigger: 'blur' }
          ],
          major: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          grade: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          class: [
            { required: true, message: '班级不能为空', trigger: 'blur' }
          ],
          headTeacher: [
            { required: true, message: '班主任不能为空', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '班主任电话不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          updateBy: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          isDeleted: [
            { required: true, message: '不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/generator/stuclasschangeinfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.academyId = data.stuClassChangeInfo.academyId
                this.dataForm.changeDate = data.stuClassChangeInfo.changeDate
                this.dataForm.dept = data.stuClassChangeInfo.dept
                this.dataForm.major = data.stuClassChangeInfo.major
                this.dataForm.grade = data.stuClassChangeInfo.grade
                this.dataForm.class = data.stuClassChangeInfo.class
                this.dataForm.headTeacher = data.stuClassChangeInfo.headTeacher
                this.dataForm.phone = data.stuClassChangeInfo.phone
                this.dataForm.createTime = data.stuClassChangeInfo.createTime
                this.dataForm.updateTime = data.stuClassChangeInfo.updateTime
                this.dataForm.createBy = data.stuClassChangeInfo.createBy
                this.dataForm.updateBy = data.stuClassChangeInfo.updateBy
                this.dataForm.isDeleted = data.stuClassChangeInfo.isDeleted
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
              url: this.$http.adornUrl(`/generator/stuclasschangeinfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'academyId': this.dataForm.academyId,
                'changeDate': this.dataForm.changeDate,
                'dept': this.dataForm.dept,
                'major': this.dataForm.major,
                'grade': this.dataForm.grade,
                'class': this.dataForm.class,
                'headTeacher': this.dataForm.headTeacher,
                'phone': this.dataForm.phone,
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

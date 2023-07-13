<template>
  <el-dialog :title="!dataForm.stuId ? '分配班级' : '修改'" :close-on-click-modal="false" :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
      label-width="80px">
      <el-form-item label="院校信息:  ">
        {{departInfo}}
      </el-form-item>
      <el-form-item label="学号" prop="schoolNumber">
        <el-input v-model="dataForm.schoolNumber" placeholder="学号" readonly="readonly"></el-input>
      </el-form-item>
      <el-form-item label="学生姓名" prop="stuName">
      <el-input v-model="dataForm.stuName" placeholder="学生姓名" readonly="readonly"></el-input>
    </el-form-item>
      <el-form-item label="班级" prop="className">
        <el-select v-model="dataForm.classId" placeholder="请选择">
          <el-option v-for="item in classList" :key="item.value" :label="item.label" :value="item.value">
          </el-option>
        </el-select>
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
      departInfo: '',
      classList: [],
      visible: false,
      dataForm: {
        stuId: 0,
        classId: '',
        className: '',
        schoolNumber: '',
        stuName:'',
        gradeId:''
      },
      dataRule: {
        classId: [
          { required: true, message: '班级不能为空', trigger: 'blur' }
        ],

      }
    }
  },
  methods: {
    init(value) {
      console.log('value')
      console.log(value.academyInfo + ' ' + value.majorInfo + ' ' + value.gradeInfo)
      this.departInfo = value.academyInfo + ' ' + value.majorInfo + ' ' + value.gradeInfo
      //接口请求班级信息
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptsByPid/?pid=${value.gradeId}`),
        method: 'get'
      }).then(({ data }) => {
        console.log(value)
        this.classList = data.data
      }).then(()=>{
        this.dataForm.stuId = value.stuId || 0
        this.visible = true
        this.dataForm.schoolNumber = value.schoolNumber
        this.dataForm.gradeId = value.gradeId
        this.dataForm.stuName = value.stuName
        this.dataForm.classId = value.classId
        console.log(value)
      })
      // this.$nextTick(() => {
      //   this.$refs['dataForm'].resetFields()
      //   if (this.dataForm.stuId) {
      //     this.$http({
      //       url: this.$http.adornUrl(`/generator/stuclassinfo/info/${this.dataForm.stuId}`),
      //       method: 'get',
      //       params: this.$http.adornParams()
      //     }).then(({ data }) => {
      //       console.log(data)
      //       if (data && data.code === 0) {
      //         this.dataForm.schoolNumber = data.stuClassInfo.schoolNumber
      //       }
      //     })
      //   }
      // })
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.$http({
            url: this.$http.adornUrl(`/generator/stuclassinfo/${!this.dataForm.stuId ? 'save' : 'update'}`),
            method: 'post',
            data: this.$http.adornData({
              'stuId': this.dataForm.stuId,
              'classId': this.dataForm.classId
            })
          }).then(({ data }) => {
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
    },
    getClassList(id) {
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptsByPid/?pid=${id}`),
        method: 'get'
      }).then(({ data }) => {
        this.classList = data.classList
      })
    }
  }
}
</script>

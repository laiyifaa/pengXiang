<template>
  <el-dialog
    :title="!dataForm.deptId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="标志位：0-寝室，1-院系专业" prop="typeFlag">
      <el-input v-model="dataForm.typeFlag" placeholder="标志位：0-寝室，1-院系专业"></el-input>
    </el-form-item>
    <el-form-item label="上级部门" prop="pid">
      <el-input v-model="dataForm.pid" placeholder="上级部门"></el-input>
    </el-form-item>
    <el-form-item label="子部门数目" prop="subCount">
      <el-input v-model="dataForm.subCount" placeholder="子部门数目"></el-input>
    </el-form-item>
    <el-form-item label="名称" prop="name">
      <el-input v-model="dataForm.name" placeholder="名称"></el-input>
    </el-form-item>
    <el-form-item label="院系专业详细信息" prop="description">
      <el-input v-model="dataForm.description" placeholder="院系专业详细信息"></el-input>
    </el-form-item>
    <el-form-item label="排序" prop="deptSort">
      <el-input v-model="dataForm.deptSort" placeholder="排序"></el-input>
    </el-form-item>
    <el-form-item label="状态" prop="enabled">
      <el-input v-model="dataForm.enabled" placeholder="状态"></el-input>
    </el-form-item>
    <el-form-item label="创建者" prop="createBy">
      <el-input v-model="dataForm.createBy" placeholder="创建者"></el-input>
    </el-form-item>
    <el-form-item label="更新者" prop="updateBy">
      <el-input v-model="dataForm.updateBy" placeholder="更新者"></el-input>
    </el-form-item>
    <el-form-item label="创建日期" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建日期"></el-input>
    </el-form-item>
    <el-form-item label="更新时间" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder="更新时间"></el-input>
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
          deptId: 0,
          typeFlag: '',
          pid: '',
          subCount: '',
          name: '',
          description: '',
          deptSort: '',
          enabled: '',
          createBy: '',
          updateBy: '',
          createTime: '',
          updateTime: ''
        },
        dataRule: {
          typeFlag: [
            { required: true, message: '标志位：0-寝室，1-院系专业不能为空', trigger: 'blur' }
          ],
          pid: [
            { required: true, message: '上级部门不能为空', trigger: 'blur' }
          ],
          subCount: [
            { required: true, message: '子部门数目不能为空', trigger: 'blur' }
          ],
          name: [
            { required: true, message: '名称不能为空', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '院系专业详细信息不能为空', trigger: 'blur' }
          ],
          deptSort: [
            { required: true, message: '排序不能为空', trigger: 'blur' }
          ],
          enabled: [
            { required: true, message: '状态不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '创建者不能为空', trigger: 'blur' }
          ],
          updateBy: [
            { required: true, message: '更新者不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建日期不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '更新时间不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.deptId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.deptId) {
            this.$http({
              url: this.$http.adornUrl(`/generator/sysdept/info/${this.dataForm.deptId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.typeFlag = data.sysDept.typeFlag
                this.dataForm.pid = data.sysDept.pid
                this.dataForm.subCount = data.sysDept.subCount
                this.dataForm.name = data.sysDept.name
                this.dataForm.description = data.sysDept.description
                this.dataForm.deptSort = data.sysDept.deptSort
                this.dataForm.enabled = data.sysDept.enabled
                this.dataForm.createBy = data.sysDept.createBy
                this.dataForm.updateBy = data.sysDept.updateBy
                this.dataForm.createTime = data.sysDept.createTime
                this.dataForm.updateTime = data.sysDept.updateTime
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
              url: this.$http.adornUrl(`/generator/sysdept/${!this.dataForm.deptId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'deptId': this.dataForm.deptId || undefined,
                'typeFlag': this.dataForm.typeFlag,
                'pid': this.dataForm.pid,
                'subCount': this.dataForm.subCount,
                'name': this.dataForm.name,
                'description': this.dataForm.description,
                'deptSort': this.dataForm.deptSort,
                'enabled': this.dataForm.enabled,
                'createBy': this.dataForm.createBy,
                'updateBy': this.dataForm.updateBy,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime
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

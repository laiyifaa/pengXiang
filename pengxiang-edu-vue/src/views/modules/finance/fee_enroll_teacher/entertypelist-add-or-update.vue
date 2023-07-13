<template>
  <el-dialog
    :title="!dataForm.typeId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="招生方式" prop="enterTypeName">
      <el-input v-model="dataForm.enterTypeName" placeholder="招生方式名称"></el-input>
    </el-form-item>
      <el-form-item label="所属学院" v-show="isAcademy">
        <el-select v-model="dataForm.academyId" placeholder="请选择">
          <el-option
            v-for="item in academyOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="回扣金额" prop="get">
        <el-input v-model="dataForm.couldGet" placeholder="回扣金额"></el-input>
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
        academyOptions: [],
        isAcademy: false,
        visible: false,
        dataForm: {
          typeId: 0,
          enterTypeName: '',
          couldGet: '',
          academyId: null
        },
        dataRule: {
          enterTypeName: [
            { required: true, message: '招生方式名称不能为空', trigger: 'blur' }
          ],
          couldGet: [
            { required: true, message: '回扣金额不能为空', trigger: 'blur' }
          ],
          academyId: [
            { required: true, message: '学院信息不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    mounted() {
      this.getAcademyList();
    },
    methods: {
      init (id) {
        this.dataForm.typeId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.typeId) {
            this.$http({
              url: this.$http.adornUrl(`/generator/entertypelist/info/${this.dataForm.typeId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.enterTypeName = data.enterTypeList.enterTypeName
                this.dataForm.couldGet = data.enterTypeList.couldGet
                this.dataForm.academyId = data.enterTypeList.academyId
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
              url: this.$http.adornUrl(`/generator/entertypelist/${!this.dataForm.typeId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'typeId': this.dataForm.typeId || undefined,
                'enterTypeName': this.dataForm.enterTypeName,
                'couldGet': this.dataForm.couldGet,
                'academyId': this.dataForm.academyId,

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
      },
      getAcademyList () {
        // console.log('getAcademyList')
        this.$http({
          url: this.$http.adornUrl('/generator/sysdept/academyList'),
          method: 'get'
        }).then(({data}) => {
          // console.log(data)
          this.academyOptions = data.data
          console.log(this.academyOptions)
        })
        console.log(this.$store.state.user)
        if (this.$store.state.user.academyId === -1) {
          this.isAcademy = true
        } else {
          this.isAcademy = false
        }
      },
    }
  }
</script>

<template>
  <el-dialog
    :title="!dataForm.deptId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm"  ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="上级部门" prop="pid">
        <el-popover
          ref="deptListPopover"
          placement="bottom-start"
          trigger="click">
          <el-tree
            :data="treeList"
            node-key="id"
            @current-change="deptListTreeCurrentChangeHandle"
            :highlight-current="true"
            :default-expanded-keys="[]"
            :default-checked-keys="[]"
            :props="defaultProps"
          ></el-tree>
        </el-popover>
      <el-input v-model="parentDeptName" v-popover:deptListPopover :readonly="true" placeholder="选择上级部门" class="menu-list__input"></el-input>
    </el-form-item>
    <el-form-item label="名称" prop="name">
      <el-input v-model="dataForm.name" placeholder="名称"></el-input>
    </el-form-item>
    <el-form-item label="部门类型" prop="status">
      <el-select v-model="dataForm.deptType" placeholder="请选择">
        <el-option
          v-for="item in typeOptions"
          :key="item.value"
          :label="item.label"
          :value="item.value">
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
    created () {
      this.getDeptTreeList()
    },
    data () {
      return {
        typeOptions: [{
          value: 1,
          label: '专业/系部'
        }, {
          value: 2,
          label: '年级'
        }, {
          value: 3,
          label: '班级'
        }],
        deptTypeArray: ['院校/学校', '专业/系部', '年级', '班级'],
        treeList: [],
        visible: false,
        parentDeptName: '',
        dataForm: {
          deptId: 0,
          typeFlag: '',
          pid: '',
          name: '',
          description: '',
          deptType: '',
          enabled: '',
          createBy: '',
          updateBy: '',
          createTime: '',
          updateTime: ''
        },
        defaultProps: {
          children: 'children',
          label: 'label'
        },
        dataRule: {
          typeFlag: [
            { required: true, message: '标志位：0-寝室，1-院系专业不能为空', trigger: 'blur' }
          ],
          pid: [
            { required: true, message: '上级部门不能为空', trigger: 'blur' }
          ],
          name: [
            { required: true, message: '名称不能为空', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '院系专业详细信息不能为空', trigger: 'blur' }
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
      getParentDeptName (pid) {
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getParentDeptName/${pid}`),
          method: 'get'
        }).then(({data}) => {
          if (data && data.code === 0) {
            if (data.data != null) {
              this.parentDeptName = data.data
            } else {
              this.parentDeptName = '无上级单位，若要修改请重新选择'
            }
          }
        })
      },
      deptListTreeCurrentChangeHandle (data, node) {
        this.dataForm.pid = data.id
        this.parentDeptName = data.label
      },
      getDeptTreeList () {
        this.$http({
          url: this.$http.adornUrl('/generator/sysdept/getDeptTreeList'),
          method: 'get'
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.treeList = data.data
          }
        })
      },
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
                this.dataForm.name = data.sysDept.name
                this.dataForm.description = data.sysDept.description
                this.dataForm.deptType = this.deptTypeArray[data.sysDept.deptType]
                this.dataForm.enabled = data.sysDept.enabled
                this.dataForm.createBy = data.sysDept.createBy
                this.dataForm.updateBy = data.sysDept.updateBy
                this.dataForm.createTime = data.sysDept.createTime
                this.dataForm.updateTime = data.sysDept.updateTime
              }
              this.getParentDeptName(data.sysDept.pid)
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        if (this.dataForm.pid === null || this.dataForm.pid <= 0) {
          this.$message.error('上级部门不能为空')
          return
        }
        if (this.dataForm.name === null || this.dataForm.name === '') {
          this.$message.error('部门名称不能为空')
          return
        }
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
                'deptType': this.dataForm.deptType,
                'enabled': this.dataForm.enabled,
                'createBy': this.dataForm.createBy,
                'updateBy': this.dataForm.updateBy,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.getDeptTreeList()
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

<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="学生id" prop="stuId">
      <el-input v-model="dataForm.stuId" placeholder="学生id"></el-input>
    </el-form-item>
    <el-form-item label="院校id" prop="academyId">
      <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>
    </el-form-item>
    <el-form-item label="" prop="deptId">
      <el-input v-model="dataForm.deptId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="培训类别" prop="trainType">
      <el-input v-model="dataForm.trainType" placeholder="培训类别"></el-input>
    </el-form-item>
    <el-form-item label="证书名称" prop="certificateName">
      <el-input v-model="dataForm.certificateName" placeholder="证书名称"></el-input>
    </el-form-item>
    <el-form-item label="证书等级" prop="certificateLevel">
      <el-input v-model="dataForm.certificateLevel" placeholder="证书等级"></el-input>
    </el-form-item>
    <el-form-item label="应收金额" prop="needFeeNum">
      <el-input v-model="dataForm.needFeeNum" placeholder="应收金额"></el-input>
    </el-form-item>
    <el-form-item label="实收金额" prop="factFeeNum">
      <el-input v-model="dataForm.factFeeNum" placeholder="实收金额"></el-input>
    </el-form-item>
    <el-form-item label="减免金额" prop="derateFeeNum">
      <el-input v-model="dataForm.derateFeeNum" placeholder="减免金额"></el-input>
    </el-form-item>
    <el-form-item label="招生老师" prop="teacher">
      <el-input v-model="dataForm.teacher" placeholder="招生老师"></el-input>
    </el-form-item>
    <el-form-item label="招生老师电话" prop="teacherPhone">
      <el-input v-model="dataForm.teacherPhone" placeholder="招生老师电话"></el-input>
    </el-form-item>
    <el-form-item label="返费时间" prop="returnFeeTime">
      <el-input v-model="dataForm.returnFeeTime" placeholder="返费时间"></el-input>
    </el-form-item>
    <el-form-item label="应返费总额" prop="needReturnFeeNum">
      <el-input v-model="dataForm.needReturnFeeNum" placeholder="应返费总额"></el-input>
    </el-form-item>
    <el-form-item label="返费金额" prop="factReturnFeeNum">
      <el-input v-model="dataForm.factReturnFeeNum" placeholder="返费金额"></el-input>
    </el-form-item>
    <el-form-item label="返费账户" prop="returnAccount">
      <el-input v-model="dataForm.returnAccount" placeholder="返费账户"></el-input>
    </el-form-item>
    <el-form-item label="返费账号" prop="returnAccountNumber">
      <el-input v-model="dataForm.returnAccountNumber" placeholder="返费账号"></el-input>
    </el-form-item>
    <el-form-item label="退费时间" prop="backFeeTime">
      <el-input v-model="dataForm.backFeeTime" placeholder="退费时间"></el-input>
    </el-form-item>
    <el-form-item label="退费金额" prop="backFeeNum">
      <el-input v-model="dataForm.backFeeNum" placeholder="退费金额"></el-input>
    </el-form-item>
    <el-form-item label="退费账户" prop="backAccount">
      <el-input v-model="dataForm.backAccount" placeholder="退费账户"></el-input>
    </el-form-item>
    <el-form-item label="退费账号" prop="backAccountNumber">
      <el-input v-model="dataForm.backAccountNumber" placeholder="退费账号"></el-input>
    </el-form-item>
    <el-form-item label="创建(缴费)时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建(缴费)时间"></el-input>
    </el-form-item>
    <el-form-item label="更新时间" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder="更新时间"></el-input>
    </el-form-item>
    <el-form-item label="创建人" prop="createUser">
      <el-input v-model="dataForm.createUser" placeholder="创建人"></el-input>
    </el-form-item>
    <el-form-item label="修改人" prop="updateUser">
      <el-input v-model="dataForm.updateUser" placeholder="修改人"></el-input>
    </el-form-item>
    <el-form-item label="是否删除" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder="是否删除"></el-input>
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
          trainType: '',
          certificateName: '',
          certificateLevel: '',
          needFeeNum: '',
          factFeeNum: '',
          derateFeeNum: '',
          teacher: '',
          teacherPhone: '',
          returnFeeTime: '',
          needReturnFeeNum: '',
          factReturnFeeNum: '',
          returnAccount: '',
          returnAccountNumber: '',
          backFeeTime: '',
          backFeeNum: '',
          backAccount: '',
          backAccountNumber: '',
          createTime: '',
          updateTime: '',
          createUser: '',
          updateUser: '',
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
          trainType: [
            { required: true, message: '培训类别不能为空', trigger: 'blur' }
          ],
          certificateName: [
            { required: true, message: '证书名称不能为空', trigger: 'blur' }
          ],
          certificateLevel: [
            { required: true, message: '证书等级不能为空', trigger: 'blur' }
          ],
          needFeeNum: [
            { required: true, message: '应收金额不能为空', trigger: 'blur' }
          ],
          factFeeNum: [
            { required: true, message: '实收金额不能为空', trigger: 'blur' }
          ],
          derateFeeNum: [
            { required: true, message: '减免金额不能为空', trigger: 'blur' }
          ],
          teacher: [
            { required: true, message: '招生老师不能为空', trigger: 'blur' }
          ],
          teacherPhone: [
            { required: true, message: '招生老师电话不能为空', trigger: 'blur' }
          ],
          returnFeeTime: [
            { required: true, message: '返费时间不能为空', trigger: 'blur' }
          ],
          needReturnFeeNum: [
            { required: true, message: '应返费总额不能为空', trigger: 'blur' }
          ],
          factReturnFeeNum: [
            { required: true, message: '返费金额不能为空', trigger: 'blur' }
          ],
          returnAccount: [
            { required: true, message: '返费账户不能为空', trigger: 'blur' }
          ],
          returnAccountNumber: [
            { required: true, message: '返费账号不能为空', trigger: 'blur' }
          ],
          backFeeTime: [
            { required: true, message: '退费时间不能为空', trigger: 'blur' }
          ],
          backFeeNum: [
            { required: true, message: '退费金额不能为空', trigger: 'blur' }
          ],
          backAccount: [
            { required: true, message: '退费账户不能为空', trigger: 'blur' }
          ],
          backAccountNumber: [
            { required: true, message: '退费账号不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建(缴费)时间不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '更新时间不能为空', trigger: 'blur' }
          ],
          createUser: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          updateUser: [
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
              url: this.$http.adornUrl(`/generator/feetraininout/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuId = data.feeTrainInOut.stuId
                this.dataForm.academyId = data.feeTrainInOut.academyId
                this.dataForm.deptId = data.feeTrainInOut.deptId
                this.dataForm.trainType = data.feeTrainInOut.trainType
                this.dataForm.certificateName = data.feeTrainInOut.certificateName
                this.dataForm.certificateLevel = data.feeTrainInOut.certificateLevel
                this.dataForm.needFeeNum = data.feeTrainInOut.needFeeNum
                this.dataForm.factFeeNum = data.feeTrainInOut.factFeeNum
                this.dataForm.derateFeeNum = data.feeTrainInOut.derateFeeNum
                this.dataForm.teacher = data.feeTrainInOut.teacher
                this.dataForm.teacherPhone = data.feeTrainInOut.teacherPhone
                this.dataForm.returnFeeTime = data.feeTrainInOut.returnFeeTime
                this.dataForm.needReturnFeeNum = data.feeTrainInOut.needReturnFeeNum
                this.dataForm.factReturnFeeNum = data.feeTrainInOut.factReturnFeeNum
                this.dataForm.returnAccount = data.feeTrainInOut.returnAccount
                this.dataForm.returnAccountNumber = data.feeTrainInOut.returnAccountNumber
                this.dataForm.backFeeTime = data.feeTrainInOut.backFeeTime
                this.dataForm.backFeeNum = data.feeTrainInOut.backFeeNum
                this.dataForm.backAccount = data.feeTrainInOut.backAccount
                this.dataForm.backAccountNumber = data.feeTrainInOut.backAccountNumber
                this.dataForm.createTime = data.feeTrainInOut.createTime
                this.dataForm.updateTime = data.feeTrainInOut.updateTime
                this.dataForm.createUser = data.feeTrainInOut.createUser
                this.dataForm.updateUser = data.feeTrainInOut.updateUser
                this.dataForm.isDeleted = data.feeTrainInOut.isDeleted
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
              url: this.$http.adornUrl(`/generator/feetraininout/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuId': this.dataForm.stuId,
                'academyId': this.dataForm.academyId,
                'deptId': this.dataForm.deptId,
                'trainType': this.dataForm.trainType,
                'certificateName': this.dataForm.certificateName,
                'certificateLevel': this.dataForm.certificateLevel,
                'needFeeNum': this.dataForm.needFeeNum,
                'factFeeNum': this.dataForm.factFeeNum,
                'derateFeeNum': this.dataForm.derateFeeNum,
                'teacher': this.dataForm.teacher,
                'teacherPhone': this.dataForm.teacherPhone,
                'returnFeeTime': this.dataForm.returnFeeTime,
                'needReturnFeeNum': this.dataForm.needReturnFeeNum,
                'factReturnFeeNum': this.dataForm.factReturnFeeNum,
                'returnAccount': this.dataForm.returnAccount,
                'returnAccountNumber': this.dataForm.returnAccountNumber,
                'backFeeTime': this.dataForm.backFeeTime,
                'backFeeNum': this.dataForm.backFeeNum,
                'backAccount': this.dataForm.backAccount,
                'backAccountNumber': this.dataForm.backAccountNumber,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime,
                'createUser': this.dataForm.createUser,
                'updateUser': this.dataForm.updateUser,
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

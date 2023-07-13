<template>
  <el-dialog
    :title="!dataForm.wa ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="" prop="stuId">
      <el-input v-model="dataForm.stuId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="deptId">
      <el-input v-model="dataForm.deptId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="是否在岗(1在岗，0不在岗)" prop="isWork">
      <el-input v-model="dataForm.isWork" placeholder="是否在岗(1在岗，0不在岗)"></el-input>
    </el-form-item>
    <el-form-item label="是否对岗位满意" prop="isSatisfied">
      <el-input v-model="dataForm.isSatisfied" placeholder="是否对岗位满意"></el-input>
    </el-form-item>
    <el-form-item label="学生就业工作情况(升职、降职、加薪、降薪、其他)" prop="empStatus">
      <el-input v-model="dataForm.empStatus" placeholder="学生就业工作情况(升职、降职、加薪、降薪、其他)"></el-input>
    </el-form-item>
    <el-form-item label="离职原因(辞职、辞退)" prop="leaveReason">
      <el-input v-model="dataForm.leaveReason" placeholder="离职原因(辞职、辞退)"></el-input>
    </el-form-item>
    <el-form-item label="转正薪酬" prop="regularizeSalary">
      <el-input v-model="dataForm.regularizeSalary" placeholder="转正薪酬"></el-input>
    </el-form-item>
    <el-form-item label="试用期限(二次就业分配填写)" prop="trialPeriod">
      <el-input v-model="dataForm.trialPeriod" placeholder="试用期限(二次就业分配填写)"></el-input>
    </el-form-item>
    <el-form-item label="就业岗位(二次就业分配填写)" prop="reworkJob">
      <el-input v-model="dataForm.reworkJob" placeholder="就业岗位(二次就业分配填写)"></el-input>
    </el-form-item>
    <el-form-item label="岗位负责人" prop="workLeader">
      <el-input v-model="dataForm.workLeader" placeholder="岗位负责人"></el-input>
    </el-form-item>
    <el-form-item label="是否需要二次就业(0需要，1不需要)" prop="isNeedReemp">
      <el-input v-model="dataForm.isNeedReemp" placeholder="是否需要二次就业(0需要，1不需要)"></el-input>
    </el-form-item>
    <el-form-item label="二次就业分配时间(二次就业分配填写)" prop="reempAllocateTime">
      <el-input v-model="dataForm.reempAllocateTime" placeholder="二次就业分配时间(二次就业分配填写)"></el-input>
    </el-form-item>
    <el-form-item label="就业单位(二次就业分配填写)" prop="reworkIn">
      <el-input v-model="dataForm.reworkIn" placeholder="就业单位(二次就业分配填写)"></el-input>
    </el-form-item>
    <el-form-item label="试用期薪酬" prop="probationSalary">
      <el-input v-model="dataForm.probationSalary" placeholder="试用期薪酬"></el-input>
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
          wa: 0,
          stuId: '',
          deptId: '',
          isWork: '',
          isSatisfied: '',
          empStatus: '',
          leaveReason: '',
          regularizeSalary: '',
          trialPeriod: '',
          reworkJob: '',
          workLeader: '',
          isNeedReemp: '',
          reempAllocateTime: '',
          reworkIn: '',
          probationSalary: '',
          createTime: '',
          updateTime: '',
          createBy: '',
          updateBy: '',
          isDeleted: ''
        },
        dataRule: {
          stuId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          deptId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          isWork: [
            { required: true, message: '是否在岗(1在岗，0不在岗)不能为空', trigger: 'blur' }
          ],
          isSatisfied: [
            { required: true, message: '是否对岗位满意不能为空', trigger: 'blur' }
          ],
          empStatus: [
            { required: true, message: '学生就业工作情况(升职、降职、加薪、降薪、其他)不能为空', trigger: 'blur' }
          ],
          leaveReason: [
            { required: true, message: '离职原因(辞职、辞退)不能为空', trigger: 'blur' }
          ],
          regularizeSalary: [
            { required: true, message: '转正薪酬不能为空', trigger: 'blur' }
          ],
          trialPeriod: [
            { required: true, message: '试用期限(二次就业分配填写)不能为空', trigger: 'blur' }
          ],
          reworkJob: [
            { required: true, message: '就业岗位(二次就业分配填写)不能为空', trigger: 'blur' }
          ],
          workLeader: [
            { required: true, message: '岗位负责人不能为空', trigger: 'blur' }
          ],
          isNeedReemp: [
            { required: true, message: '是否需要二次就业(0需要，1不需要)不能为空', trigger: 'blur' }
          ],
          reempAllocateTime: [
            { required: true, message: '二次就业分配时间(二次就业分配填写)不能为空', trigger: 'blur' }
          ],
          reworkIn: [
            { required: true, message: '就业单位(二次就业分配填写)不能为空', trigger: 'blur' }
          ],
          probationSalary: [
            { required: true, message: '试用期薪酬不能为空', trigger: 'blur' }
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
        this.dataForm.wa = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.wa) {
            this.$http({
              url: this.$http.adornUrl(`/generator/inememprevisit/info/${this.dataForm.wa}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.stuId = data.inemEmpRevisit.stuId
                this.dataForm.deptId = data.inemEmpRevisit.deptId
                this.dataForm.isWork = data.inemEmpRevisit.isWork
                this.dataForm.isSatisfied = data.inemEmpRevisit.isSatisfied
                this.dataForm.empStatus = data.inemEmpRevisit.empStatus
                this.dataForm.leaveReason = data.inemEmpRevisit.leaveReason
                this.dataForm.regularizeSalary = data.inemEmpRevisit.regularizeSalary
                this.dataForm.trialPeriod = data.inemEmpRevisit.trialPeriod
                this.dataForm.reworkJob = data.inemEmpRevisit.reworkJob
                this.dataForm.workLeader = data.inemEmpRevisit.workLeader
                this.dataForm.isNeedReemp = data.inemEmpRevisit.isNeedReemp
                this.dataForm.reempAllocateTime = data.inemEmpRevisit.reempAllocateTime
                this.dataForm.reworkIn = data.inemEmpRevisit.reworkIn
                this.dataForm.probationSalary = data.inemEmpRevisit.probationSalary
                this.dataForm.createTime = data.inemEmpRevisit.createTime
                this.dataForm.updateTime = data.inemEmpRevisit.updateTime
                this.dataForm.createBy = data.inemEmpRevisit.createBy
                this.dataForm.updateBy = data.inemEmpRevisit.updateBy
                this.dataForm.isDeleted = data.inemEmpRevisit.isDeleted
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
              url: this.$http.adornUrl(`/generator/inememprevisit/${!this.dataForm.wa ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'wa': this.dataForm.wa || undefined,
                'stuId': this.dataForm.stuId,
                'deptId': this.dataForm.deptId,
                'isWork': this.dataForm.isWork,
                'isSatisfied': this.dataForm.isSatisfied,
                'empStatus': this.dataForm.empStatus,
                'leaveReason': this.dataForm.leaveReason,
                'regularizeSalary': this.dataForm.regularizeSalary,
                'trialPeriod': this.dataForm.trialPeriod,
                'reworkJob': this.dataForm.reworkJob,
                'workLeader': this.dataForm.workLeader,
                'isNeedReemp': this.dataForm.isNeedReemp,
                'reempAllocateTime': this.dataForm.reempAllocateTime,
                'reworkIn': this.dataForm.reworkIn,
                'probationSalary': this.dataForm.probationSalary,
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

<template>
  <el-dialog
    :title="!dataForm.stuId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="培养层次" prop="eduLevel">
      <el-input v-model="dataForm.eduLevel" placeholder="培养层次"></el-input>
    </el-form-item>
    <el-form-item label="入学前技能水平" prop="skillBeforeAdmission">
      <el-input v-model="dataForm.skillBeforeAdmission" placeholder="入学前技能水平"></el-input>
    </el-form-item>
    <el-form-item label="入学学历" prop="entranceQual">
      <el-input v-model="dataForm.entranceQual" placeholder="入学学历"></el-input>
    </el-form-item>
    <el-form-item label="毕业学校" prop="graduatedSchool">
      <el-input v-model="dataForm.graduatedSchool" placeholder="毕业学校"></el-input>
    </el-form-item>
    <el-form-item label="户口性质" prop="registeredResidence">
      <el-input v-model="dataForm.registeredResidence" placeholder="户口性质"></el-input>
    </el-form-item>
    <el-form-item label="是否家庭困难" prop="isDifficulty">
      <el-input v-model="dataForm.isDifficulty" placeholder="是否家庭困难"></el-input>
    </el-form-item>
    <el-form-item label="(家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他" prop="difficultyType">
      <el-input v-model="dataForm.difficultyType" placeholder="(家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他"></el-input>
    </el-form-item>
    <el-form-item label="资助申请类型" prop="supportType">
      <el-input v-model="dataForm.supportType" placeholder="资助申请类型"></el-input>
    </el-form-item>
    <el-form-item label="家庭年总收入（元）" prop="totalIncome">
      <el-input v-model="dataForm.totalIncome" placeholder="家庭年总收入（元）"></el-input>
    </el-form-item>
    <el-form-item label="家庭人均收入（元）" prop="aveIncome">
      <el-input v-model="dataForm.aveIncome" placeholder="家庭人均收入（元）"></el-input>
    </el-form-item>
    <el-form-item label="" prop="incomeSource">
      <el-input v-model="dataForm.incomeSource" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="firstSemesterLevel">
      <el-input v-model="dataForm.firstSemesterLevel" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="secendSemesterLevel">
      <el-input v-model="dataForm.secendSemesterLevel" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="thirdSemesterLevel">
      <el-input v-model="dataForm.thirdSemesterLevel" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="fourthSemesterLevel">
      <el-input v-model="dataForm.fourthSemesterLevel" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="fifthSemesterLevel">
      <el-input v-model="dataForm.fifthSemesterLevel" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="sixthSemesterLevel">
      <el-input v-model="dataForm.sixthSemesterLevel" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="银行账户" prop="bankAccount">
      <el-input v-model="dataForm.bankAccount" placeholder="银行账户"></el-input>
    </el-form-item>
    <el-form-item label="银行卡帐号" prop="bankCardNum">
      <el-input v-model="dataForm.bankCardNum" placeholder="银行卡帐号"></el-input>
    </el-form-item>
    <el-form-item label="开户行" prop="deposit">
      <el-input v-model="dataForm.deposit" placeholder="开户行"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="更新时间" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder="更新时间"></el-input>
    </el-form-item>
    <el-form-item label="创建人" prop="createBy">
      <el-input v-model="dataForm.createBy" placeholder="创建人"></el-input>
    </el-form-item>
    <el-form-item label="修改人" prop="updateBy">
      <el-input v-model="dataForm.updateBy" placeholder="修改人"></el-input>
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
          stuId: 0,
          eduLevel: '',
          skillBeforeAdmission: '',
          entranceQual: '',
          graduatedSchool: '',
          registeredResidence: '',
          isDifficulty: '',
          difficultyType: '',
          supportType: '',
          totalIncome: '',
          aveIncome: '',
          incomeSource: '',
          firstSemesterLevel: '',
          secendSemesterLevel: '',
          thirdSemesterLevel: '',
          fourthSemesterLevel: '',
          fifthSemesterLevel: '',
          sixthSemesterLevel: '',
          bankAccount: '',
          bankCardNum: '',
          deposit: '',
          createTime: '',
          updateTime: '',
          createBy: '',
          updateBy: '',
          isDeleted: ''
        },
        dataRule: {
          eduLevel: [
            { required: true, message: '培养层次不能为空', trigger: 'blur' }
          ],
          skillBeforeAdmission: [
            { required: true, message: '入学前技能水平不能为空', trigger: 'blur' }
          ],
          entranceQual: [
            { required: true, message: '入学学历不能为空', trigger: 'blur' }
          ],
          graduatedSchool: [
            { required: true, message: '毕业学校不能为空', trigger: 'blur' }
          ],
          registeredResidence: [
            { required: true, message: '户口性质不能为空', trigger: 'blur' }
          ],
          isDifficulty: [
            { required: true, message: '是否家庭困难不能为空', trigger: 'blur' }
          ],
          difficultyType: [
            { required: true, message: '(家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他不能为空', trigger: 'blur' }
          ],
          supportType: [
            { required: true, message: '资助申请类型不能为空', trigger: 'blur' }
          ],
          totalIncome: [
            { required: true, message: '家庭年总收入（元）不能为空', trigger: 'blur' }
          ],
          aveIncome: [
            { required: true, message: '家庭人均收入（元）不能为空', trigger: 'blur' }
          ],
          incomeSource: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          firstSemesterLevel: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          secendSemesterLevel: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          thirdSemesterLevel: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          fourthSemesterLevel: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          fifthSemesterLevel: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          sixthSemesterLevel: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          bankAccount: [
            { required: true, message: '银行账户不能为空', trigger: 'blur' }
          ],
          bankCardNum: [
            { required: true, message: '银行卡帐号不能为空', trigger: 'blur' }
          ],
          deposit: [
            { required: true, message: '开户行不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '更新时间不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          updateBy: [
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
        this.dataForm.stuId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.stuId) {
            this.$http({
              url: this.$http.adornUrl(`/generator/studetailinfo/info/${this.dataForm.stuId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.eduLevel = data.stuDetailInfo.eduLevel
                this.dataForm.skillBeforeAdmission = data.stuDetailInfo.skillBeforeAdmission
                this.dataForm.entranceQual = data.stuDetailInfo.entranceQual
                this.dataForm.graduatedSchool = data.stuDetailInfo.graduatedSchool
                this.dataForm.registeredResidence = data.stuDetailInfo.registeredResidence
                this.dataForm.isDifficulty = data.stuDetailInfo.isDifficulty
                this.dataForm.difficultyType = data.stuDetailInfo.difficultyType
                this.dataForm.supportType = data.stuDetailInfo.supportType
                this.dataForm.totalIncome = data.stuDetailInfo.totalIncome
                this.dataForm.aveIncome = data.stuDetailInfo.aveIncome
                this.dataForm.incomeSource = data.stuDetailInfo.incomeSource
                this.dataForm.firstSemesterLevel = data.stuDetailInfo.firstSemesterLevel
                this.dataForm.secendSemesterLevel = data.stuDetailInfo.secendSemesterLevel
                this.dataForm.thirdSemesterLevel = data.stuDetailInfo.thirdSemesterLevel
                this.dataForm.fourthSemesterLevel = data.stuDetailInfo.fourthSemesterLevel
                this.dataForm.fifthSemesterLevel = data.stuDetailInfo.fifthSemesterLevel
                this.dataForm.sixthSemesterLevel = data.stuDetailInfo.sixthSemesterLevel
                this.dataForm.bankAccount = data.stuDetailInfo.bankAccount
                this.dataForm.bankCardNum = data.stuDetailInfo.bankCardNum
                this.dataForm.deposit = data.stuDetailInfo.deposit
                this.dataForm.createTime = data.stuDetailInfo.createTime
                this.dataForm.updateTime = data.stuDetailInfo.updateTime
                this.dataForm.createBy = data.stuDetailInfo.createBy
                this.dataForm.updateBy = data.stuDetailInfo.updateBy
                this.dataForm.isDeleted = data.stuDetailInfo.isDeleted
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
              url: this.$http.adornUrl(`/generator/studetailinfo/${!this.dataForm.stuId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'stuId': this.dataForm.stuId || undefined,
                'eduLevel': this.dataForm.eduLevel,
                'skillBeforeAdmission': this.dataForm.skillBeforeAdmission,
                'entranceQual': this.dataForm.entranceQual,
                'graduatedSchool': this.dataForm.graduatedSchool,
                'registeredResidence': this.dataForm.registeredResidence,
                'isDifficulty': this.dataForm.isDifficulty,
                'difficultyType': this.dataForm.difficultyType,
                'supportType': this.dataForm.supportType,
                'totalIncome': this.dataForm.totalIncome,
                'aveIncome': this.dataForm.aveIncome,
                'incomeSource': this.dataForm.incomeSource,
                'firstSemesterLevel': this.dataForm.firstSemesterLevel,
                'secendSemesterLevel': this.dataForm.secendSemesterLevel,
                'thirdSemesterLevel': this.dataForm.thirdSemesterLevel,
                'fourthSemesterLevel': this.dataForm.fourthSemesterLevel,
                'fifthSemesterLevel': this.dataForm.fifthSemesterLevel,
                'sixthSemesterLevel': this.dataForm.sixthSemesterLevel,
                'bankAccount': this.dataForm.bankAccount,
                'bankCardNum': this.dataForm.bankCardNum,
                'deposit': this.dataForm.deposit,
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

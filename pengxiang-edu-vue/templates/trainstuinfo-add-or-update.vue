<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="姓名" prop="name">
      <el-input v-model="dataForm.name" placeholder="姓名"></el-input>
    </el-form-item>
    <el-form-item label="性别(男 or 女)" prop="gender">
      <el-input v-model="dataForm.gender" placeholder="性别(男 or 女)"></el-input>
    </el-form-item>
    <el-form-item label="年龄" prop="age">
      <el-input v-model="dataForm.age" placeholder="年龄"></el-input>
    </el-form-item>
    <el-form-item label="学历" prop="educationBackground">
      <el-input v-model="dataForm.educationBackground" placeholder="学历"></el-input>
    </el-form-item>
    <el-form-item label="身份证号" prop="idNumber">
      <el-input v-model="dataForm.idNumber" placeholder="身份证号"></el-input>
    </el-form-item>
    <el-form-item label="户籍地
户籍地" prop="nativePlace">
      <el-input v-model="dataForm.nativePlace" placeholder="户籍地
户籍地"></el-input>
    </el-form-item>
    <el-form-item label="联系方式" prop="phone">
      <el-input v-model="dataForm.phone" placeholder="联系方式"></el-input>
    </el-form-item>
    <el-form-item label="现住址" prop="addres">
      <el-input v-model="dataForm.addres" placeholder="现住址"></el-input>
    </el-form-item>
    <el-form-item label="从事工作" prop="work">
      <el-input v-model="dataForm.work" placeholder="从事工作"></el-input>
    </el-form-item>
    <el-form-item label="培训类别" prop="trainCategory">
      <el-input v-model="dataForm.trainCategory" placeholder="培训类别"></el-input>
    </el-form-item>
    <el-form-item label="证书名称" prop="certificate">
      <el-input v-model="dataForm.certificate" placeholder="证书名称"></el-input>
    </el-form-item>
    <el-form-item label="证书等级" prop="certificateLevel">
      <el-input v-model="dataForm.certificateLevel" placeholder="证书等级"></el-input>
    </el-form-item>
    <el-form-item label="有无社保（有无）" prop="isSocialSecurity">
      <el-input v-model="dataForm.isSocialSecurity" placeholder="有无社保（有无）"></el-input>
    </el-form-item>
    <el-form-item label="缴费金额" prop="paymentAmount">
      <el-input v-model="dataForm.paymentAmount" placeholder="缴费金额"></el-input>
    </el-form-item>
    <el-form-item label="缴费日期" prop="paymentDate">
      <el-input v-model="dataForm.paymentDate" placeholder="缴费日期"></el-input>
    </el-form-item>
    <el-form-item label="培训开始日期" prop="trainStartDate">
      <el-input v-model="dataForm.trainStartDate" placeholder="培训开始日期"></el-input>
    </el-form-item>
    <el-form-item label="培训结束日期" prop="trainEndDate">
      <el-input v-model="dataForm.trainEndDate" placeholder="培训结束日期"></el-input>
    </el-form-item>
    <el-form-item label="总学时" prop="periodSum">
      <el-input v-model="dataForm.periodSum" placeholder="总学时"></el-input>
    </el-form-item>
    <el-form-item label="理论学时" prop="period">
      <el-input v-model="dataForm.period" placeholder="理论学时"></el-input>
    </el-form-item>
    <el-form-item label="理论教师" prop="teacher">
      <el-input v-model="dataForm.teacher" placeholder="理论教师"></el-input>
    </el-form-item>
    <el-form-item label="学习形式" prop="studyMode">
      <el-input v-model="dataForm.studyMode" placeholder="学习形式"></el-input>
    </el-form-item>
    <el-form-item label="培训场所" prop="trainPlace">
      <el-input v-model="dataForm.trainPlace" placeholder="培训场所"></el-input>
    </el-form-item>
    <el-form-item label="实践学时" prop="practicePeriod">
      <el-input v-model="dataForm.practicePeriod" placeholder="实践学时"></el-input>
    </el-form-item>
    <el-form-item label="报名信息来源（微信 熟人介绍 抖音）" prop="infoSource">
      <el-input v-model="dataForm.infoSource" placeholder="报名信息来源（微信 熟人介绍 抖音）"></el-input>
    </el-form-item>
    <el-form-item label="招生老师" prop="admissionTeacher">
      <el-input v-model="dataForm.admissionTeacher" placeholder="招生老师"></el-input>
    </el-form-item>
    <el-form-item label="招生老师电话" prop="admissionTeacherPhone">
      <el-input v-model="dataForm.admissionTeacherPhone" placeholder="招生老师电话"></el-input>
    </el-form-item>
    <el-form-item label="证书编号" prop="certificateNumber">
      <el-input v-model="dataForm.certificateNumber" placeholder="证书编号"></el-input>
    </el-form-item>
    <el-form-item label="签收日期" prop="lodgmentDate">
      <el-input v-model="dataForm.lodgmentDate" placeholder="签收日期"></el-input>
    </el-form-item>
    <el-form-item label="学员状态（在培、结业、退学）" prop="stuStatus">
      <el-input v-model="dataForm.stuStatus" placeholder="学员状态（在培、结业、退学）"></el-input>
    </el-form-item>
    <el-form-item label="" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="createUser">
      <el-input v-model="dataForm.createUser" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="updateUser">
      <el-input v-model="dataForm.updateUser" placeholder=""></el-input>
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
          name: '',
          gender: '',
          age: '',
          educationBackground: '',
          idNumber: '',
          nativePlace: '',
          phone: '',
          addres: '',
          work: '',
          trainCategory: '',
          certificate: '',
          certificateLevel: '',
          isSocialSecurity: '',
          paymentAmount: '',
          paymentDate: '',
          trainStartDate: '',
          trainEndDate: '',
          periodSum: '',
          period: '',
          teacher: '',
          studyMode: '',
          trainPlace: '',
          practicePeriod: '',
          infoSource: '',
          admissionTeacher: '',
          admissionTeacherPhone: '',
          certificateNumber: '',
          lodgmentDate: '',
          stuStatus: '',
          createTime: '',
          updateTime: '',
          createUser: '',
          updateUser: '',
          isDeleted: ''
        },
        dataRule: {
          name: [
            { required: true, message: '姓名不能为空', trigger: 'blur' }
          ],
          gender: [
            { required: true, message: '性别(男 or 女)不能为空', trigger: 'blur' }
          ],
          age: [
            { required: true, message: '年龄不能为空', trigger: 'blur' }
          ],
          educationBackground: [
            { required: true, message: '学历不能为空', trigger: 'blur' }
          ],
          idNumber: [
            { required: true, message: '身份证号不能为空', trigger: 'blur' }
          ],
          nativePlace: [
            { required: true, message: '户籍地
户籍地不能为空', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '联系方式不能为空', trigger: 'blur' }
          ],
          addres: [
            { required: true, message: '现住址不能为空', trigger: 'blur' }
          ],
          work: [
            { required: true, message: '从事工作不能为空', trigger: 'blur' }
          ],
          trainCategory: [
            { required: true, message: '培训类别不能为空', trigger: 'blur' }
          ],
          certificate: [
            { required: true, message: '证书名称不能为空', trigger: 'blur' }
          ],
          certificateLevel: [
            { required: true, message: '证书等级不能为空', trigger: 'blur' }
          ],
          isSocialSecurity: [
            { required: true, message: '有无社保（有无）不能为空', trigger: 'blur' }
          ],
          paymentAmount: [
            { required: true, message: '缴费金额不能为空', trigger: 'blur' }
          ],
          paymentDate: [
            { required: true, message: '缴费日期不能为空', trigger: 'blur' }
          ],
          trainStartDate: [
            { required: true, message: '培训开始日期不能为空', trigger: 'blur' }
          ],
          trainEndDate: [
            { required: true, message: '培训结束日期不能为空', trigger: 'blur' }
          ],
          periodSum: [
            { required: true, message: '总学时不能为空', trigger: 'blur' }
          ],
          period: [
            { required: true, message: '理论学时不能为空', trigger: 'blur' }
          ],
          teacher: [
            { required: true, message: '理论教师不能为空', trigger: 'blur' }
          ],
          studyMode: [
            { required: true, message: '学习形式不能为空', trigger: 'blur' }
          ],
          trainPlace: [
            { required: true, message: '培训场所不能为空', trigger: 'blur' }
          ],
          practicePeriod: [
            { required: true, message: '实践学时不能为空', trigger: 'blur' }
          ],
          infoSource: [
            { required: true, message: '报名信息来源（微信 熟人介绍 抖音）不能为空', trigger: 'blur' }
          ],
          admissionTeacher: [
            { required: true, message: '招生老师不能为空', trigger: 'blur' }
          ],
          admissionTeacherPhone: [
            { required: true, message: '招生老师电话不能为空', trigger: 'blur' }
          ],
          certificateNumber: [
            { required: true, message: '证书编号不能为空', trigger: 'blur' }
          ],
          lodgmentDate: [
            { required: true, message: '签收日期不能为空', trigger: 'blur' }
          ],
          stuStatus: [
            { required: true, message: '学员状态（在培、结业、退学）不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          createUser: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          updateUser: [
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
              url: this.$http.adornUrl(`/generator/trainstuinfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.name = data.trainStuInfo.name
                this.dataForm.gender = data.trainStuInfo.gender
                this.dataForm.age = data.trainStuInfo.age
                this.dataForm.educationBackground = data.trainStuInfo.educationBackground
                this.dataForm.idNumber = data.trainStuInfo.idNumber
                this.dataForm.nativePlace = data.trainStuInfo.nativePlace
                this.dataForm.phone = data.trainStuInfo.phone
                this.dataForm.addres = data.trainStuInfo.addres
                this.dataForm.work = data.trainStuInfo.work
                this.dataForm.trainCategory = data.trainStuInfo.trainCategory
                this.dataForm.certificate = data.trainStuInfo.certificate
                this.dataForm.certificateLevel = data.trainStuInfo.certificateLevel
                this.dataForm.isSocialSecurity = data.trainStuInfo.isSocialSecurity
                this.dataForm.paymentAmount = data.trainStuInfo.paymentAmount
                this.dataForm.paymentDate = data.trainStuInfo.paymentDate
                this.dataForm.trainStartDate = data.trainStuInfo.trainStartDate
                this.dataForm.trainEndDate = data.trainStuInfo.trainEndDate
                this.dataForm.periodSum = data.trainStuInfo.periodSum
                this.dataForm.period = data.trainStuInfo.period
                this.dataForm.teacher = data.trainStuInfo.teacher
                this.dataForm.studyMode = data.trainStuInfo.studyMode
                this.dataForm.trainPlace = data.trainStuInfo.trainPlace
                this.dataForm.practicePeriod = data.trainStuInfo.practicePeriod
                this.dataForm.infoSource = data.trainStuInfo.infoSource
                this.dataForm.admissionTeacher = data.trainStuInfo.admissionTeacher
                this.dataForm.admissionTeacherPhone = data.trainStuInfo.admissionTeacherPhone
                this.dataForm.certificateNumber = data.trainStuInfo.certificateNumber
                this.dataForm.lodgmentDate = data.trainStuInfo.lodgmentDate
                this.dataForm.stuStatus = data.trainStuInfo.stuStatus
                this.dataForm.createTime = data.trainStuInfo.createTime
                this.dataForm.updateTime = data.trainStuInfo.updateTime
                this.dataForm.createUser = data.trainStuInfo.createUser
                this.dataForm.updateUser = data.trainStuInfo.updateUser
                this.dataForm.isDeleted = data.trainStuInfo.isDeleted
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
              url: this.$http.adornUrl(`/generator/trainstuinfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'name': this.dataForm.name,
                'gender': this.dataForm.gender,
                'age': this.dataForm.age,
                'educationBackground': this.dataForm.educationBackground,
                'idNumber': this.dataForm.idNumber,
                'nativePlace': this.dataForm.nativePlace,
                'phone': this.dataForm.phone,
                'addres': this.dataForm.addres,
                'work': this.dataForm.work,
                'trainCategory': this.dataForm.trainCategory,
                'certificate': this.dataForm.certificate,
                'certificateLevel': this.dataForm.certificateLevel,
                'isSocialSecurity': this.dataForm.isSocialSecurity,
                'paymentAmount': this.dataForm.paymentAmount,
                'paymentDate': this.dataForm.paymentDate,
                'trainStartDate': this.dataForm.trainStartDate,
                'trainEndDate': this.dataForm.trainEndDate,
                'periodSum': this.dataForm.periodSum,
                'period': this.dataForm.period,
                'teacher': this.dataForm.teacher,
                'studyMode': this.dataForm.studyMode,
                'trainPlace': this.dataForm.trainPlace,
                'practicePeriod': this.dataForm.practicePeriod,
                'infoSource': this.dataForm.infoSource,
                'admissionTeacher': this.dataForm.admissionTeacher,
                'admissionTeacherPhone': this.dataForm.admissionTeacherPhone,
                'certificateNumber': this.dataForm.certificateNumber,
                'lodgmentDate': this.dataForm.lodgmentDate,
                'stuStatus': this.dataForm.stuStatus,
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

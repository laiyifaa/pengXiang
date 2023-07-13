<template>
  <el-dialog
    :title="!dataForm.stuId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="院校id" prop="academyId">
      <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>
    </el-form-item>
    <el-form-item label="" prop="deptId">
      <el-input v-model="dataForm.deptId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="学号" prop="schoolNumber">
      <el-input v-model="dataForm.schoolNumber" placeholder="学号"></el-input>
    </el-form-item>
    <el-form-item label="姓名" prop="stuName">
      <el-input v-model="dataForm.stuName" placeholder="姓名"></el-input>
    </el-form-item>
    <el-form-item label="身份证号码" prop="idNumber">
      <el-input v-model="dataForm.idNumber" placeholder="身份证号码"></el-input>
    </el-form-item>
    <el-form-item label="出生日期" prop="birthday">
      <el-input v-model="dataForm.birthday" placeholder="出生日期"></el-input>
    </el-form-item>
    <el-form-item label="性别" prop="gender">
      <el-input v-model="dataForm.gender" placeholder="性别"></el-input>
    </el-form-item>
    <el-form-item label="民族" prop="nation">
      <el-input v-model="dataForm.nation" placeholder="民族"></el-input>
    </el-form-item>
    <el-form-item label="籍贯" prop="nativePlace">
      <el-input v-model="dataForm.nativePlace" placeholder="籍贯"></el-input>
    </el-form-item>
    <el-form-item label="政治面貌" prop="politicalStatus">
      <el-input v-model="dataForm.politicalStatus" placeholder="政治面貌"></el-input>
    </el-form-item>
    <el-form-item label="联系电话" prop="phone">
      <el-input v-model="dataForm.phone" placeholder="联系电话"></el-input>
    </el-form-item>
    <el-form-item label="年级" prop="grade">
      <el-input v-model="dataForm.grade" placeholder="年级"></el-input>
    </el-form-item>
    <el-form-item label="招生季" prop="admissionSeason">
      <el-input v-model="dataForm.admissionSeason" placeholder="招生季"></el-input>
    </el-form-item>
    <el-form-item label="入学日期" prop="admissionDate">
      <el-input v-model="dataForm.admissionDate" placeholder="入学日期"></el-input>
    </el-form-item>
    <el-form-item label="注册学籍日期" prop="registerDate">
      <el-input v-model="dataForm.registerDate" placeholder="注册学籍日期"></el-input>
    </el-form-item>
    <el-form-item label="是否提前入学" prop="isAdmissionEarly">
      <el-input v-model="dataForm.isAdmissionEarly" placeholder="是否提前入学"></el-input>
    </el-form-item>
    <el-form-item label="系部" prop="dept">
      <el-input v-model="dataForm.dept" placeholder="系部"></el-input>
    </el-form-item>
    <el-form-item label="专业" prop="major">
      <el-input v-model="dataForm.major" placeholder="专业"></el-input>
    </el-form-item>
    <el-form-item label="班型" prop="classType">
      <el-input v-model="dataForm.classType" placeholder="班型"></el-input>
    </el-form-item>
    <el-form-item label="班级" prop="class">
      <el-input v-model="dataForm.class" placeholder="班级"></el-input>
    </el-form-item>
    <el-form-item label="班主任" prop="headTeacher">
      <el-input v-model="dataForm.headTeacher" placeholder="班主任"></el-input>
    </el-form-item>
    <el-form-item label="班主任电话" prop="headTeacherPhone">
      <el-input v-model="dataForm.headTeacherPhone" placeholder="班主任电话"></el-input>
    </el-form-item>
    <el-form-item label="现就读学校" prop="studyIn">
      <el-input v-model="dataForm.studyIn" placeholder="现就读学校"></el-input>
    </el-form-item>
    <el-form-item label="现学籍学校" prop="statusSchool">
      <el-input v-model="dataForm.statusSchool" placeholder="现学籍学校"></el-input>
    </el-form-item>
    <el-form-item label="学制" prop="schoolingLength">
      <el-input v-model="dataForm.schoolingLength" placeholder="学制"></el-input>
    </el-form-item>
    <el-form-item label="身份证地址" prop="idCardAddr">
      <el-input v-model="dataForm.idCardAddr" placeholder="身份证地址"></el-input>
    </el-form-item>
    <el-form-item label="家庭联系人" prop="familyMemberName">
      <el-input v-model="dataForm.familyMemberName" placeholder="家庭联系人"></el-input>
    </el-form-item>
    <el-form-item label="邮编" prop="postCode">
      <el-input v-model="dataForm.postCode" placeholder="邮编"></el-input>
    </el-form-item>
    <el-form-item label="家庭住址" prop="familyAddr">
      <el-input v-model="dataForm.familyAddr" placeholder="家庭住址"></el-input>
    </el-form-item>
    <el-form-item label="" prop="familyPhone">
      <el-input v-model="dataForm.familyPhone" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="当前状态" prop="currentStatus">
      <el-input v-model="dataForm.currentStatus" placeholder="当前状态"></el-input>
    </el-form-item>
    <el-form-item label="" prop="dormNum">
      <el-input v-model="dataForm.dormNum" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="roomNum">
      <el-input v-model="dataForm.roomNum" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="bedNum">
      <el-input v-model="dataForm.bedNum" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="入住日期" prop="checkIn">
      <el-input v-model="dataForm.checkIn" placeholder="入住日期"></el-input>
    </el-form-item>
    <el-form-item label="离宿日期" prop="leaveDate">
      <el-input v-model="dataForm.leaveDate" placeholder="离宿日期"></el-input>
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
          stuId: 0,
          academyId: '',
          deptId: '',
          schoolNumber: '',
          stuName: '',
          idNumber: '',
          birthday: '',
          gender: '',
          nation: '',
          nativePlace: '',
          politicalStatus: '',
          phone: '',
          grade: '',
          admissionSeason: '',
          admissionDate: '',
          registerDate: '',
          isAdmissionEarly: '',
          dept: '',
          major: '',
          classType: '',
          class: '',
          headTeacher: '',
          headTeacherPhone: '',
          studyIn: '',
          statusSchool: '',
          schoolingLength: '',
          idCardAddr: '',
          familyMemberName: '',
          postCode: '',
          familyAddr: '',
          familyPhone: '',
          currentStatus: '',
          dormNum: '',
          roomNum: '',
          bedNum: '',
          checkIn: '',
          leaveDate: '',
          createTime: '',
          updateTime: '',
          createBy: '',
          updateBy: '',
          isDeleted: ''
        },
        dataRule: {
          academyId: [
            { required: true, message: '院校id不能为空', trigger: 'blur' }
          ],
          deptId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          schoolNumber: [
            { required: true, message: '学号不能为空', trigger: 'blur' }
          ],
          stuName: [
            { required: true, message: '姓名不能为空', trigger: 'blur' }
          ],
          idNumber: [
            { required: true, message: '身份证号码不能为空', trigger: 'blur' }
          ],
          birthday: [
            { required: true, message: '出生日期不能为空', trigger: 'blur' }
          ],
          gender: [
            { required: true, message: '性别不能为空', trigger: 'blur' }
          ],
          nation: [
            { required: true, message: '民族不能为空', trigger: 'blur' }
          ],
          nativePlace: [
            { required: true, message: '籍贯不能为空', trigger: 'blur' }
          ],
          politicalStatus: [
            { required: true, message: '政治面貌不能为空', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '联系电话不能为空', trigger: 'blur' }
          ],
          grade: [
            { required: true, message: '年级不能为空', trigger: 'blur' }
          ],
          admissionSeason: [
            { required: true, message: '招生季不能为空', trigger: 'blur' }
          ],
          admissionDate: [
            { required: true, message: '入学日期不能为空', trigger: 'blur' }
          ],
          registerDate: [
            { required: true, message: '注册学籍日期不能为空', trigger: 'blur' }
          ],
          isAdmissionEarly: [
            { required: true, message: '是否提前入学不能为空', trigger: 'blur' }
          ],
          dept: [
            { required: true, message: '系部不能为空', trigger: 'blur' }
          ],
          major: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          classType: [
            { required: true, message: '班型不能为空', trigger: 'blur' }
          ],
          class: [
            { required: true, message: '班级不能为空', trigger: 'blur' }
          ],
          headTeacher: [
            { required: true, message: '班主任不能为空', trigger: 'blur' }
          ],
          headTeacherPhone: [
            { required: true, message: '班主任电话不能为空', trigger: 'blur' }
          ],
          studyIn: [
            { required: true, message: '现就读学校不能为空', trigger: 'blur' }
          ],
          statusSchool: [
            { required: true, message: '现学籍学校不能为空', trigger: 'blur' }
          ],
          schoolingLength: [
            { required: true, message: '学制不能为空', trigger: 'blur' }
          ],
          idCardAddr: [
            { required: true, message: '身份证地址不能为空', trigger: 'blur' }
          ],
          familyMemberName: [
            { required: true, message: '家庭联系人不能为空', trigger: 'blur' }
          ],
          postCode: [
            { required: true, message: '邮编不能为空', trigger: 'blur' }
          ],
          familyAddr: [
            { required: true, message: '家庭住址不能为空', trigger: 'blur' }
          ],
          familyPhone: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          currentStatus: [
            { required: true, message: '当前状态不能为空', trigger: 'blur' }
          ],
          dormNum: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          roomNum: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          bedNum: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          checkIn: [
            { required: true, message: '入住日期不能为空', trigger: 'blur' }
          ],
          leaveDate: [
            { required: true, message: '离宿日期不能为空', trigger: 'blur' }
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
        this.dataForm.stuId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.stuId) {
            this.$http({
              url: this.$http.adornUrl(`/generator/stubaseinfo/info/${this.dataForm.stuId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.academyId = data.stuBaseInfo.academyId
                this.dataForm.deptId = data.stuBaseInfo.deptId
                this.dataForm.schoolNumber = data.stuBaseInfo.schoolNumber
                this.dataForm.stuName = data.stuBaseInfo.stuName
                this.dataForm.idNumber = data.stuBaseInfo.idNumber
                this.dataForm.birthday = data.stuBaseInfo.birthday
                this.dataForm.gender = data.stuBaseInfo.gender
                this.dataForm.nation = data.stuBaseInfo.nation
                this.dataForm.nativePlace = data.stuBaseInfo.nativePlace
                this.dataForm.politicalStatus = data.stuBaseInfo.politicalStatus
                this.dataForm.phone = data.stuBaseInfo.phone
                this.dataForm.grade = data.stuBaseInfo.grade
                this.dataForm.admissionSeason = data.stuBaseInfo.admissionSeason
                this.dataForm.admissionDate = data.stuBaseInfo.admissionDate
                this.dataForm.registerDate = data.stuBaseInfo.registerDate
                this.dataForm.isAdmissionEarly = data.stuBaseInfo.isAdmissionEarly
                this.dataForm.dept = data.stuBaseInfo.dept
                this.dataForm.major = data.stuBaseInfo.major
                this.dataForm.classType = data.stuBaseInfo.classType
                this.dataForm.class = data.stuBaseInfo.class
                this.dataForm.headTeacher = data.stuBaseInfo.headTeacher
                this.dataForm.headTeacherPhone = data.stuBaseInfo.headTeacherPhone
                this.dataForm.studyIn = data.stuBaseInfo.studyIn
                this.dataForm.statusSchool = data.stuBaseInfo.statusSchool
                this.dataForm.schoolingLength = data.stuBaseInfo.schoolingLength
                this.dataForm.idCardAddr = data.stuBaseInfo.idCardAddr
                this.dataForm.familyMemberName = data.stuBaseInfo.familyMemberName
                this.dataForm.postCode = data.stuBaseInfo.postCode
                this.dataForm.familyAddr = data.stuBaseInfo.familyAddr
                this.dataForm.familyPhone = data.stuBaseInfo.familyPhone
                this.dataForm.currentStatus = data.stuBaseInfo.currentStatus
                this.dataForm.dormNum = data.stuBaseInfo.dormNum
                this.dataForm.roomNum = data.stuBaseInfo.roomNum
                this.dataForm.bedNum = data.stuBaseInfo.bedNum
                this.dataForm.checkIn = data.stuBaseInfo.checkIn
                this.dataForm.leaveDate = data.stuBaseInfo.leaveDate
                this.dataForm.createTime = data.stuBaseInfo.createTime
                this.dataForm.updateTime = data.stuBaseInfo.updateTime
                this.dataForm.createBy = data.stuBaseInfo.createBy
                this.dataForm.updateBy = data.stuBaseInfo.updateBy
                this.dataForm.isDeleted = data.stuBaseInfo.isDeleted
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
              url: this.$http.adornUrl(`/generator/stubaseinfo/${!this.dataForm.stuId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'stuId': this.dataForm.stuId || undefined,
                'academyId': this.dataForm.academyId,
                'deptId': this.dataForm.deptId,
                'schoolNumber': this.dataForm.schoolNumber,
                'stuName': this.dataForm.stuName,
                'idNumber': this.dataForm.idNumber,
                'birthday': this.dataForm.birthday,
                'gender': this.dataForm.gender,
                'nation': this.dataForm.nation,
                'nativePlace': this.dataForm.nativePlace,
                'politicalStatus': this.dataForm.politicalStatus,
                'phone': this.dataForm.phone,
                'grade': this.dataForm.grade,
                'admissionSeason': this.dataForm.admissionSeason,
                'admissionDate': this.dataForm.admissionDate,
                'registerDate': this.dataForm.registerDate,
                'isAdmissionEarly': this.dataForm.isAdmissionEarly,
                'dept': this.dataForm.dept,
                'major': this.dataForm.major,
                'classType': this.dataForm.classType,
                'class': this.dataForm.class,
                'headTeacher': this.dataForm.headTeacher,
                'headTeacherPhone': this.dataForm.headTeacherPhone,
                'studyIn': this.dataForm.studyIn,
                'statusSchool': this.dataForm.statusSchool,
                'schoolingLength': this.dataForm.schoolingLength,
                'idCardAddr': this.dataForm.idCardAddr,
                'familyMemberName': this.dataForm.familyMemberName,
                'postCode': this.dataForm.postCode,
                'familyAddr': this.dataForm.familyAddr,
                'familyPhone': this.dataForm.familyPhone,
                'currentStatus': this.dataForm.currentStatus,
                'dormNum': this.dataForm.dormNum,
                'roomNum': this.dataForm.roomNum,
                'bedNum': this.dataForm.bedNum,
                'checkIn': this.dataForm.checkIn,
                'leaveDate': this.dataForm.leaveDate,
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

<template>
<!--  :title="!dataForm.stuId ? '新增' : '修改'"-->
  <el-dialog
    title="修改"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-tabs
      stretch
      type="border-card">
      <el-tab-pane label="学生基础信息">
        <el-form :model="dataForm" :rules="dataRule" ref="dataForm" label-width="150px" label-position="left" @keyup.enter.native="dataFormSubmit()">
<!--          <el-form-item label="学校" prop="academyId">-->
<!--            <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>-->
<!--          </el-form-item>-->
          <el-form-item label="学院" prop="academyId">
<!--            <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>-->
            <el-select v-model="dataForm.academyId" placeholder="请选择" @change="changeMajorList(dataForm.academyId)">
              <el-option
                v-for="item in academyList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="专业" prop="majorId" >
            <el-select v-model="dataForm.majorId" placeholder="请选择" @change="changeGradeList(dataForm.majorId)">
              <el-option
                v-for="item in majorList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="年级" prop="gradeId" >
            <el-select v-model="dataForm.gradeId" placeholder="请选择" @change="changeClassList(dataForm.gradeId)">
              <el-option
                v-for="item in gradeList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="班级" prop="classId">
<!--            <el-input v-model="dataForm.classId" placeholder="班级id"></el-input>-->
            <el-select v-model="dataForm.classId" placeholder="请选择">
              <el-option
                v-for="item in classList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="学号" prop="schoolNumber">
            <el-input v-model="dataForm.schoolNumber" placeholder="学号"></el-input>
          </el-form-item>
          <el-form-item label="姓名" prop="stuName">
            <el-input v-model="dataForm.stuName" placeholder="姓名"></el-input>
          </el-form-item>
          <el-form-item label="班型" prop="classType">
            <!--        <el-input v-model="dataForm.classType" placeholder="升学/就业"></el-input>-->
            <el-select v-model="dataForm.classType" placeholder="请选择">
              <el-option
                v-for="item in classTypeOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
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
          <el-form-item label="招生季" prop="admissionSeason">
            <el-input v-model="dataForm.admissionSeason" placeholder="招生季"></el-input>
          </el-form-item>
          <el-form-item label="入学日期" prop="admissionDate">
            <el-input v-model="dataForm.admissionDate" placeholder="入学日期"  type="date"></el-input>
          </el-form-item>
          <el-form-item label="注册学籍日期" prop="registerDate">
            <el-input v-model="dataForm.registerDate" placeholder="注册学籍日期" type="date"></el-input>
          </el-form-item>
          <el-form-item label="是否提前入学" prop="isAdmissionEarly">
<!--            <el-input v-model="dataForm.isAdmissionEarly" placeholder="是否提前入学"></el-input>-->
            <el-select v-model="dataForm.isAdmissionEarly" placeholder="请选择">
              <el-option
                v-for="item in admissionEarlyOption"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
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
          <el-form-item label="家庭电话" prop="familyPhone">
            <el-input v-model="dataForm.familyPhone" placeholder=""></el-input>
          </el-form-item>
          <el-form-item label="当前状态" prop="currentStatus">
            <el-select v-model="dataForm.currentStatus" placeholder="请选择">
              <el-option
                v-for="item in currentStatusOption"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="当前学年数" prop="currentSchoolYear">
            <el-input v-model="dataForm.currentSchoolYear" placeholder=""></el-input>
          </el-form-item>

          <el-form-item label="学籍状态" prop="schoolRollStatus">
            <el-select v-model="dataForm.schoolRollStatus" placeholder="请选择">
              <el-option
                v-for="item in schoolRollStatusOption"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="寝室楼号" prop="dormNum">
            <el-input v-model="dataForm.dormNum" placeholder=""></el-input>
          </el-form-item>
          <el-form-item label="寝室房间号" prop="roomNum">
            <el-input v-model="dataForm.roomNum" placeholder=""></el-input>
          </el-form-item>
          <el-form-item label="床号" prop="bedNum">
            <el-input v-model="dataForm.bedNum" placeholder=""></el-input>
          </el-form-item>
          <el-form-item label="入住日期" prop="checkIn">
            <el-input v-model="dataForm.checkIn" placeholder="入住日期" type="date"></el-input>
          </el-form-item>
          <el-form-item label="离宿日期" prop="leaveDate">
            <el-input v-model="dataForm.leaveDate" placeholder="离宿日期" type="date"></el-input>
          </el-form-item>
        </el-form>
      </el-tab-pane>
      <el-tab-pane label="学生详细信息">
        <el-form :model="detailInfoForm" :rules="detailRule" ref="dataForm" label-width="150px" label-position="left">
          <el-form-item label="学生id" prop="stuId">
            <el-input v-model="detailInfoForm.stuId" placeholder="学生id" disabled></el-input>
          </el-form-item>
          <el-form-item label="培养层次" prop="eduLevel">
            <el-input v-model="detailInfoForm.eduLevel" placeholder="培养层次"></el-input>
          </el-form-item>
          <el-form-item label="入学前技能水平" prop="skillBeforeAdmission">
            <el-input v-model="detailInfoForm.skillBeforeAdmission" placeholder="入学前技能水平"></el-input>
          </el-form-item>
          <el-form-item label="入学学历" prop="entranceQual">
            <el-input v-model="detailInfoForm.entranceQual" placeholder="入学学历"></el-input>
          </el-form-item>
          <el-form-item label="毕业学校" prop="graduatedSchool">
            <el-input v-model="detailInfoForm.graduatedSchool" placeholder="毕业学校"></el-input>
          </el-form-item>
          <el-form-item label="户口性质" prop="registeredResidence">
            <el-input v-model="detailInfoForm.registeredResidence" placeholder="户口性质"></el-input>
          </el-form-item>
          <el-form-item label="是否家庭困难" prop="isDifficulty">
<!--            <el-input v-model="detailInfoForm.isDifficulty" placeholder="是否家庭困难"></el-input>-->
            <el-select v-model="detailInfoForm.isDifficulty" placeholder="请选择">
              <el-option
                v-for="item in difficultyOption"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="助学金申请" prop="difficultyType" v-if="this.detailInfoForm.isDifficulty===true">
<!--            <el-input v-model="detailInfoForm.difficultyType" placeholder="助学金申请"></el-input>-->
            <el-select v-model="detailInfoForm.difficultyType" placeholder="请选择">
              <el-option
                v-for="item in difficultyTypeOption"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="免学费申请" prop="waiveType" v-if="this.detailInfoForm.isDifficulty===true">
<!--            <el-input v-model="detailInfoForm.waiveType" placeholder="免学费申请"></el-input>-->
            <el-select v-model="detailInfoForm.waiveType" placeholder="请选择">
              <el-option
              v-for="item in waiveTypeOption"
              :key="item.value"
              :label="item.label"
              :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="资助申请类型" prop="supportType">
            <el-input v-model="detailInfoForm.supportType" placeholder="资助申请类型"></el-input>
          </el-form-item>
          <el-form-item label="家庭年总收入(元)" prop="totalIncome">
            <el-input v-model="detailInfoForm.totalIncome" placeholder="家庭年总收入"></el-input>
          </el-form-item>
          <el-form-item label="家庭人均收入(元)" prop="aveIncome">
            <el-input v-model="detailInfoForm.aveIncome" placeholder="家庭人均收入"></el-input>
          </el-form-item>
          <el-form-item label="第一学期评优" prop="firstSemesterLevel">
            <el-input v-model="detailInfoForm.firstSemesterLevel" placeholder="第一学期评优"></el-input>
          </el-form-item>
          <el-form-item label="第二学期评优" prop="secondSemesterLevel">
            <el-input v-model="detailInfoForm.secondSemesterLevel" placeholder="第二学期评优"></el-input>
          </el-form-item>
          <el-form-item label="第三学期评优" prop="thirdSemesterLevel">
            <el-input v-model="detailInfoForm.thirdSemesterLevel" placeholder="第三学期评优"></el-input>
          </el-form-item>
          <el-form-item label="第四学期评优" prop="fourSemesterLevel">
            <el-input v-model="detailInfoForm.fourthSemesterLevel" placeholder="第四学期评优"></el-input>
          </el-form-item>
          <el-form-item label="第五学期评优" prop="fifthSemesterLevel">
            <el-input v-model="detailInfoForm.fifthSemesterLevel" placeholder="第五学期评优"></el-input>
          </el-form-item>
          <el-form-item label="第六学期评优" prop="sixthSemesterLevel">
            <el-input v-model="detailInfoForm.sixthSemesterLevel" placeholder="第六学期评优"></el-input>
          </el-form-item>
        </el-form>
      </el-tab-pane>
    </el-tabs>
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
        detailInfoForm:{
          stuId:0,
          eduLevel:'',
          skillBeforeAdmission:'',
          entranceQual:'',
          graduatedSchool:'',
          registeredResidence:'',
          isDifficulty:'',
          difficultyType:'',
          waiveType:'',
          supportType:'',
          totalIncome:'',
          aveIncome:'',
          incomeSource:'',
          firstSemesterLevel:'',
          secondSemesterLevel:'',
          thirdSemesterLevel:'',
          fourthSemesterLevel:'',
          fifthSemesterLevel:'',
          sixthSemesterLevel:'',
        },
        classTypeOptions:[{
          value: 0,
          label:'升学'
        },{
          value: 1,
          label: '就业'
        }],
        dataForm: {
          stuId: 0,
          academyId: '',
          classId: '',
          majorId:'',
          gradeId:'',
          schoolNumber: '',
          stuName: '',
          idNumber: '',
          birthday: '',
          gender: '',
          nation: '',
          nativePlace: '',
          politicalStatus: '',
          currentSchoolYear:'',
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
          schoolRollStatus:'',
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
        schoolRollStatusOption:[{
          value:0,
          label:'在册在籍'
        },{
          value:1,
          label:'在册不在籍'
        },{
          value:2,
          label:'在籍退学'
        },{
          value:3,
          label:'非在册非在籍'
        },{
          value:4,
          label:'提前入学'
        }],
        currentStatusOption:[{
          value:0,
          label:'在校'
        },{
          value:1,
          label:'实习'
        },{
          value:2,
          label:'就业'
        },{
          value:3,
          label:'请假'
        },{
          value:4,
          label:'休学'
        },{
          value:5,
          label:'退学'
        },{
          value:6,
          label:'毕业'
        }],
        academyList:[],
        majorList:[],
        gradeList:[],
        classList:[],
        admissionEarlyOption:[{
          value:true,
          label:'是'
        },{
          value:false,
          label:'否'
        }],
        difficultyOption:[{
          value:true,
          label:'是'
        },{
          value:false,
          label:'否'
        }],
        dataRule: {
          academyId: [
            { required: true, message: '院校id不能为空', trigger: 'blur' }
          ],
          majorId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          gradeId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          classId: [
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
          // registerDate: [
          //   { required: true, message: '注册学籍日期不能为空', trigger: 'blur' }
          // ],
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
          // dormNum: [
          //   { required: true, message: '不能为空', trigger: 'blur' }
          // ],
          // roomNum: [
          //   { required: true, message: '不能为空', trigger: 'blur' }
          // ],
          // bedNum: [
          //   { required: true, message: '不能为空', trigger: 'blur' }
          // ],
          // checkIn: [
          //   { required: true, message: '入住日期不能为空', trigger: 'blur' }
          // ],
          // leaveDate: [
          //   { required: true, message: '离宿日期不能为空', trigger: 'blur' }
          // ],
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
        },
        detailRule:{},
        difficultyTypeOption:[{
          value:1,
          label:'无困难'
        },{
          value:2,
          label:'22个县户籍'
        },{
          value:4,
          label:'涉农专业'
        }],
        waiveTypeOption:[{
          value:2,
          label:'无困难'
        },{
          value:3,
          label:'农村(含县镇)学生'
        }]
      }
    },
  mounted () {
      this.getGradeList(3)
    // this.test()
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
              console.log(data)
              if (data && data.code === 0) {
                this.detailInfoForm = data.data.detail
                this.dataForm = data.data.base
                this.getAcademyList()
                this.getMajorList(this.dataForm.academyId)
                this.getGradeList(this.dataForm.majorId)
                this.getClassList(this.dataForm.gradeId)
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        // console.log(this.dataForm,this.detailInfoForm)
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/generator/stubaseinfo/${!this.dataForm.stuId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({base:{
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
                'schoolRollStatus':this.dataForm.schoolRollStatus,
                'phone': this.dataForm.phone,
                'grade': this.dataForm.grade,
                'admissionSeason': this.dataForm.admissionSeason,
                'admissionDate': this.dataForm.admissionDate,
                'registerDate': this.dataForm.registerDate,
                'isAdmissionEarly': this.dataForm.isAdmissionEarly,
                'currentSchoolYear': this.dataForm.currentSchoolYear,
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
              },detail:{
                  'id':this.detailInfoForm.id,
                  'stuId':this.detailInfoForm.stuId,
                  'eduLevel':this.detailInfoForm.eduLevel,
                  'skillBeforeAdmission':this.detailInfoForm.skillBeforeAdmission,
                  'entranceQual':this.detailInfoForm.entranceQual,
                  'graduatedSchool':this.detailInfoForm.graduatedSchool,
                  'registeredResidence':this.detailInfoForm.registeredResidence,
                  'isDifficulty':this.detailInfoForm.isDifficulty,
                  'difficultyType':this.detailInfoForm.difficultyType,
                  'waiveType':this.detailInfoForm.waiveType,
                  'supportType':this.detailInfoForm.supportType,
                  'totalIncome':this.detailInfoForm.totalIncome,
                  'aveIncome':this.detailInfoForm.aveIncome,
                  'incomeSource':this.detailInfoForm.incomeSource,
                  'firstSemesterLevel':this.detailInfoForm.firstSemesterLevel,
                  'secondSemesterLevel':this.detailInfoForm.secondSemesterLevel,
                  'thirdSemesterLevel':this.detailInfoForm.thirdSemesterLevel,
                  'fourthSemesterLevel':this.detailInfoForm.fourthSemesterLevel,
                  'fifthSemesterLevel':this.detailInfoForm.fifthSemesterLevel,
                  'sixthSemesterLevel':this.detailInfoForm.sixthSemesterLevel
                }})
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
      // 获取academyList
      getAcademyList(){
        // console.log(window.SITE_CONFIG.baseUrl+`generator/sysdept/getDeptsByPid?pid=-1`)
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=-1`),
          method: 'get'
        }).then(({data}) => {
          this.academyList = data.data
        })
      },
      getMajorList (id) {
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=${id}`),
          method: 'get'
        }).then(({data}) => {
          this.majorList = data.data
        })
      },
      changeMajorList (id) {
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=${id}`),
          method: 'get'
        }).then(({data}) => {
          if(this.dataForm.majorId){
            this.dataForm.majorId = '',
            this.dataForm.gradeId = '',
            this.dataForm.classId = ''
          }

          this.detailInfoForm.difficultyType = this.detailInfoForm.waiveType = ''
          this.$http({
            url: this.$http.adornUrl(`/generator/reducelisteco/ecoListByAcademyId?academyId=${this.dataForm.academyId}`),
            method:'get'
          }).then(({data})=>{
            console.log('?????')
            // console.log(data)
            this.difficultyTypeOption = []
            data.data.forEach((item)=>{
              let obj = new Object()
              obj.value = item.id
              obj.label = item.typeName
              this.difficultyTypeOption.push(obj)
            })
            console.log(this.difficultyTypeOption)
          })
          this.$http({
            url: this.$http.adornUrl(`/generator/reduceliststipend/stipendListByAcademyId?academyId=${1}`),
            method: 'get'
          }).then(({data}) => {
            // console.log('test:::')
            // console.log(data)
            this.waiveTypeOption = []
            data.data.forEach((item)=>{
              let obj = new Object()
              obj.value = item.id
              obj.label = item.typeName
              this.waiveTypeOption.push(obj)
            })
          })

          this.majorList = data.data
        })
      },
      getGradeList (id){
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=${id}`),
          method: 'get'
        }).then(({data}) => {
          this.gradeList = data.data
        })
      },
      changeGradeList (id){
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=${id}`),
          method: 'get'
        }).then(({data}) => {
          if(this.dataForm.gradeId){
            this.dataForm.gradeId = '',
            this.dataForm.classId = ''
          }
          this.gradeList = data.data
        })
      },
      getClassList (id) {
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=${id}`),
          method: 'get'
        }).then(({data}) => {
          this.classList = data.data
        })
      },
      changeClassList (id) {
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getDeptsByPid?pid=${id}`),
          method: 'get'
        }).then(({data}) => {
          if(this.dataForm.classId){
            this.dataForm.classId = ''
          }
          // if(this.detailInfoForm.difficultyType && this.detailInfoForm.waiveType)
          //   this.detailInfoForm.difficultyType = this.detailInfoForm.waiveType = ''
          this.classList = data.data
        })
      },
    }

  }
</script>
<style scoped>

</style>

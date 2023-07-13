<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="150px" label-position="left">
      <el-form-item label="学生姓名" prop="stuName">
        <el-input v-model="dataForm.stuName" placeholder="学生姓名"></el-input>
      </el-form-item>
      <el-form-item label="身份证号" prop="stuIdNumber">
        <el-input v-model="dataForm.stuIdNumber" placeholder="学生身份证"></el-input>
      </el-form-item>


      <el-form-item label="院校" prop="academyId">
        <el-select v-model="dataForm.academyId" placeholder="请选择" @change="updateAcademy(dataForm.academyId)">
          <el-option
            v-for="item in academyList"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="报考专业" prop="expiredMajor">
        <el-select v-model="dataForm.expiredMajor" placeholder="请选择" @change="getGradeList(dataForm.expiredMajor)">
          <el-option
            v-for="item in majorList"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="年级" prop="gradeId">
        <el-select v-model="dataForm.gradeId" placeholder="请选择">
          <el-option
            v-for="item in gradeList"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
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


      <el-form-item label="学制" prop="schoolingLength">
        <el-input v-model="dataForm.schoolingLength" placeholder="2或3"></el-input>
      </el-form-item>

      <el-form-item label="家庭贫困类型" prop="economics">
        <el-select v-model="dataForm.economics" placeholder="请选择">
          <el-option
            v-for="item in ecoOptions"
            :key="item.id"
            :label="item.typeName"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="免学费申请类型" prop="stipend">
        <el-select v-model="dataForm.stipend" placeholder="请选择">
          <el-option
            v-for="item in stipendOptions"
            :key="item.id"
            :label="item.typeName"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>


      <el-form-item label="招生入学方式选择" prop="enterType">
        <el-select v-model="dataForm.enterType" placeholder="请选择">
          <el-option
            v-for="item in enterTypeOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>

      <!--    <el-form-item label="考生状态" prop="status">&lt;!&ndash;：0未参加面试，1通过面试，2未通过面试&ndash;&gt;-->
      <!--      <el-input v-model="dataForm.statusArray[dataForm.status]" placeholder="考生状态"></el-input>-->
      <!--    </el-form-item>-->

      <el-form-item label="考生状态" prop="status">
        <el-select v-model="dataForm.status" placeholder="请选择">
          <el-option
            v-for="item in statusOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>

      <!--    <el-form-item label="" prop="createTime">-->
      <!--      <el-input v-model="dataForm.createTime" placeholder=""></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="" prop="updateTime">-->
      <!--      <el-input v-model="dataForm.updateTime" placeholder=""></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="" prop="createBy">-->
      <!--      <el-input v-model="dataForm.createBy" placeholder=""></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="" prop="updateBy">-->
      <!--      <el-input v-model="dataForm.updateBy" placeholder=""></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="" prop="isDeleted">-->
      <!--      <el-input v-model="dataForm.isDeleted" placeholder=""></el-input>-->
      <!--    </el-form-item>-->
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
      academyList:[],
      majorList:[],
      gradeList:[],
      ecoOptions: [],
      stipendOptions: [],
      enterTypeOptions: [],
      statusOptions: [{
        value: 0,
        label: '未参加面试'
      }, {
        value: 1,
        label: '通过面试'
      }, {
        value: 2,
        label: '未通过面试'
      }],
      classTypeOptions:[{
        value: 0,
        label:'升学'
      },{
        value: 1,
        label: '就业'
        }],
      statusArray: ['未参加面试', '通过面试', '未通过面试'],
      visible: false,
      dataForm: {
        id: 0,
        stuName: '',
        stuIdNumber: '',
        academyId: '',
        academyName: '',
        expiredMajor: '',
        status: 0,
        economics: '',
        stipend: '',
        enterType:'',
        createTime: '',
        updateTime: '',
        createBy: '',
        updateBy: '',
        isDeleted: '',
        classType:'',
        gradeId:'',
        schoolingLength:''
      },
      dataRule: {
        stuName: [
          {required: true, message: '学生姓名不能为空', trigger: 'blur'}
        ],
        stuIdNumber: [
          {required: true, message: '学生身份证不能为空', trigger: 'blur'}
        ],
        expiredMajor: [
          {required: true, message: '期望进入的专业不能为空', trigger: 'blur'}
        ],
        status: [
          {required: true, message: '考生状态：0未参加面试，1通过面试，2未通过面试不能为空', trigger: 'blur'}
        ],
        createTime: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        updateTime: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        createBy: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        updateBy: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ],
        isDeleted: [
          {required: true, message: '不能为空', trigger: 'blur'}
        ]
      }
    }
  },
  props: ['academyIdStu'],
  watch: {
    academyIdStu(news, olds) {
      // console.log(news+'=============')
      this.dataForm.academyId = news
      // console.log(this.dataForm.academyId + '=======!!!======')
    }
  },
  mounted() {
    this.getAcademyList()
  },
  methods: {
    init(id) {
      this.dataForm.id = id || 0
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/generator/stutemp/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            console.log('============init===============')
            console.log(data)
            if (data && data.code === 0) {
              // console.log(data)
              this.dataForm.id = data.stuTemp.id
              this.dataForm.stuName = data.stuTemp.stuName
              this.dataForm.academyId = data.stuTemp.academyId
              this.dataForm.stuIdNumber = data.stuTemp.stuIdNumber
              this.dataForm.expiredMajor = data.stuTemp.expiredMajor
              this.dataForm.gradeId = data.stuTemp.gradeId
              this.dataForm.classType = data.stuTemp.classType
              this.dataForm.schoolingLength = data.stuTemp.schoolingLength
              this.dataForm.status = data.stuTemp.status
              this.dataForm.economics = data.stuTemp.economics
              this.dataForm.stipend = data.stuTemp.stipend
              this.dataForm.enterType = data.stuTemp.enterType
              this.dataForm.createTime = data.stuTemp.createTime
              this.dataForm.updateTime = data.stuTemp.updateTime
              this.dataForm.createBy = data.stuTemp.createBy
              this.dataForm.updateBy = data.stuTemp.updateBy
              this.dataForm.isDeleted = data.stuTemp.isDeleted
              this.getEcoList()
              this.getStipendList()
              this.getMajorList(this.dataForm.academyId)
              this.getGradeList(this.dataForm.expiredMajor)
              this.getEnterTypeList()

            }
          })
        }
      })
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if(this.dataForm.status != 1){
            this.$http({
              url: this.$http.adornUrl(`/generator/stutemp/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuName': this.dataForm.stuName,
                'stuIdNumber': this.dataForm.stuIdNumber,
                'academyId': this.dataForm.academyId,
                'expiredMajor': this.dataForm.expiredMajor,
                'gradeId': this.dataForm.gradeId,
                'status': this.dataForm.status,
                'classType': this.dataForm.classType,
                'schoolingLength': this.dataForm.schoolingLength,
                'economics': this.dataForm.economics,
                'enterType': this.dataForm.enterType,
                'stipend': this.dataForm.stipend,
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
          }else {
            //若状态为通过面试，为他建立基本的学生信息和缴费信息存档
            this.$http({
              url: this.$http.adornUrl(`/generator/stutemp/stuPass`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'stuName': this.dataForm.stuName,
                'stuIdNumber': this.dataForm.stuIdNumber,
                'academyId': this.dataForm.academyId,
                'expiredMajor': this.dataForm.expiredMajor,
                'gradeId': this.dataForm.gradeId,
                'classType': this.dataForm.classType,
                'schoolingLength': this.dataForm.schoolingLength,
                'status': this.dataForm.status,
                'economics': this.dataForm.economics,
                'stipend': this.dataForm.stipend,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime,
                'enterType': this.dataForm.enterType,
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
        }
      })
    },
    getAcademyList() {
      console.log('=========getAcademyList:================')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/academyList'),
        method: 'get'
      }).then(({data}) => {
        console.log(data)
        this.academyList = data.data

      })
    },

    getEcoList() {
      this.$http({
        url: this.$http.adornUrl(`generator/reducelisteco/ecoList?id=${this.dataForm.id}`),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        this.ecoOptions = data.data
      })
    },
    getStipendList() {
      this.$http({
        url: this.$http.adornUrl(`generator/reduceliststipend/stipendList?id=${this.dataForm.id}`),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        this.stipendOptions = data.data

      })
    },
    getMajorList (id) {
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptsByPid?pid=${id}`),
        method: 'get'
      }).then(({data}) => {
        this.majorList = data.data
      })
    },
    getGradeList (id){
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptsByPid?pid=${id}`),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        this.gradeList = data.data
      })
    },
    getEnterTypeList(){
      this.$http({
        url: this.$http.adornUrl(`generator/stutemp/getEnterTypeList?academyId=${this.dataForm.academyId}`),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        // console.log(data)
        this.enterTypeOptions = data.data
      })
    },
    changeSchool(){
      //根据选中的院校id，查询学院树形结构
      // console.log("current id" + this.dataForm.academyId)
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptsByPid?pid=${this.dataForm.academyId}`),
        method: 'get'
      }).then(({data}) => {
        this.majorOptions = data.data
        // console.log("--------------")
        // console.log(this.majorOptions)
      })
    },
    getEcoListByAcademyId() {
      this.$http({
        url: this.$http.adornUrl(`generator/reducelisteco/ecoListByAcademyId?academyId=${this.dataForm.academyId}`),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        this.ecoOptions = data.data
      })
    },
    getStipendListByAcademyId() {
      this.$http({
        url: this.$http.adornUrl(`generator/reduceliststipend/stipendListByAcademyId?academyId=${this.dataForm.academyId}`),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        this.stipendOptions = data.data
      })
    },
    updateAcademy(id){
      this.getEcoListByAcademyId()
      this.getStipendListByAcademyId()
      this.getEnterTypeList()
      this.getMajorList(id)
      this.dataForm.expiredMajor = ''
      this.dataForm.gradeId = ''
      this.dataForm.economics = ''
      this.dataForm.stipend = ''
    }

  }
}
</script>

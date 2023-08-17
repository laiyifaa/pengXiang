<template>
  <div>
    <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item label="姓名"  icon="*">
        <el-input
          v-model="info.stuName"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="证件类型" icon="*">
        <el-select v-model="info.idNumberType " placeholder="请选择证件类型">
          <el-option label="大陆居民身份证" value="大陆居民身份证" key="大陆居民身份证"></el-option>
          <el-option label="港澳台身份证" value="港澳台身份证" key="港澳台身份证"></el-option>
          <el-option label="其他" value="其他" key="其他"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="证件号码" icon="*">
        <el-input
          v-model="info.idNumber"
          clearable>
        </el-input>
      </e-desc-item>

      <e-desc-item label="出生日期" >
        <el-input
          v-model="info.birthday"
          clearable
        >
        </el-input>
      </e-desc-item>

      <e-desc-item label="性别">
        <el-select v-model="info.gender " placeholder="请选择性别" style="width: 100%">
          <el-option label="男" value="男" key="男"></el-option>
          <el-option label="女" value="女" key="女"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="民族">
        <el-input
          v-model="info.nation"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="籍贯" icon="*">
        <el-input
          v-model="info.nativePlace"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="政治面貌">
        <el-select v-model="info.politicalStatus " placeholder="请选择政治面貌" style="width: 100%">
          <el-option label="党员" value="党员" key="党员"></el-option>
          <el-option label="团员" value="团员" key="团员"></el-option>
          <el-option label="群众" value="群众" key="群众"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="联系电话">
        <el-input
          v-model="info.phone"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="电子邮件">
        <el-input
          v-model="info.email"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="入学前技能水平">
        <el-input
          v-model="info.skillBefore"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="入学学历">
        <el-select v-model="info.eduBefore " placeholder="请选择入学学历" style="width: 100%">
          <el-option  v-for="item in eduBeforeList" :label="item.label" :value='item.value' :key = 'item.value' ></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="毕业学校" icon="*">
        <el-input
          v-model="info.schoolBefore"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="户口性质" icon="*">
        <el-select v-model="info.residenceType" placeholder="请选择户口性质"  style="width: 100%">
          <el-option label="农业户口" :value='1' :key='1'></el-option>
          <el-option label="非农户口" :value='0' :key='0'></el-option>
        </el-select>
      </e-desc-item>

    </e-desc>
    <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>
    <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item label="招生季" icon="*">

        <el-select v-model="info.admissionSeason " placeholder="请选择招生季" style="width: 100%">
          <el-option label="春季" value="春季" key="春季"></el-option>
          <el-option label="秋季" value="秋季" key="秋季"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="考生状态">
        <el-select v-model="info.status " placeholder="请选择考生状态" style="width: 100%">
          <el-option label="未参加面试" :value="0" :key="0"></el-option>
          <el-option label="通过面试" :value="1" :key="1"></el-option>
          <el-option label="未通过面试" :value="2" :key="2"></el-option>
          <el-option label="状态未知" :value="3" :key="3" ></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="班型" icon="*">
        <el-select v-model="info.classType " placeholder="请选择班型" style="width: 100%">
          <el-option label="就业" :value="1" :key="1"></el-option>
          <el-option label="升学" :value="0" :key="0"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="院校" icon="*">
<!--        <el-input
          v-model="info.academyName"
          clearable>
        </el-input>-->
        <el-select v-model="info.academyId"  value-key="value" placeholder="请选择" @change="handleAcademyId" style="width: 100%">
          <el-option
            v-for="item in academyList"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="年级" icon="*">
        <!--        <el-input
                  v-model="info.gradeName"
                  clearable>
                </el-input>-->
        <el-select v-model="info.gradeId"  value-key="value" placeholder="请选择" @change="handleGradeId" style="width: 100%">
          <el-option
            v-for="item in gradeList"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="专业" icon="*">
<!--        <el-input
          v-model="info.majorName"
          clearable>
        </el-input>-->
        <el-select v-model="info.majorId"  value-key="value" placeholder="请选择" style="width: 100%;">
          <el-option
            v-for="item in majorList"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </e-desc-item>

      <e-desc-item label="学制" icon="*">
        <el-select v-model="info.schoolingLength " placeholder="请选择学制">
          <el-option label="二年" value="二年" key="二年"></el-option>
          <el-option label="三年" value="三年" key="三年"></el-option>
          <el-option label="四年" value="四年" key="四年"></el-option>
          <el-option label="五年" value="五年" key="五年"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="招生老师" icon="*">
        <el-input
          v-model="info.enrollTeacher"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="招生老师部门">
        <el-input
          v-model="info.enrollTeacherDept"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="招生老师电话">
        <el-input
          v-model="info.enrollTeacherPhone"
          clearable>
        </el-input>
      </e-desc-item>
    </e-desc>
    <el-row style="padding: 50px;text-align: center;">
      <el-button
        type="success"
        @click="save()">确认
      </el-button>
      <el-button type="info" @click="returnBack">返回</el-button>
    </el-row>
  </div>
</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'

export default {
  name: 'enrollStuEdit',
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      info: {
        id: 0,
        stuName: null,
        idNumber: null,
        idNumberType: null,
        status: null,
        schoolingLength: null,
        enrollTeacher: null,
        academyName: null,
        majorName: null,
        gradeName: null,
        phone: null,
        email: null,
        enrollTeacherPhone: null
      },
      eduBeforeList: [{
        value: '小学',
        label: '小学'
      }, {
        value: '初中',
        label: '初中'
      },
      {
        value: '高中',
        label: '高中'
      }, {
        value: '高中以上',
        label: '高中以上'
      }
      ],
      academyId: null,
      majorId: null,
      gradeId: null,
      academyList: [],
      majorList: [],
      gradeList: []
    }
  },
  methods: {
    handleAcademyId (item) {
      this.academyId = item
      this.majorList = []
      this.getGradeList()
    },
    handleGradeId (item) {
      this.gradeId = item
      this.getMajorList()
    },
    returnBack () {
      this.$router.go(-1)
    },
    getAcademyList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/academyList'),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.academyList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getMajorList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptsByPid'),
        params: this.$http.adornParams({
          'pid': this.gradeId
        }),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.majorList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getGradeList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptsByPid'),
        params: this.$http.adornParams({
          'pid': this.academyId
        }),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.gradeList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('stu/temp/info'),
        method: 'get',
        params: this.$http.adornParams({
          'id': this.info.id
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.info = data.info
          this.academyId = this.info.academyId
          this.majorId = this.info.majorId
          this.gradeId = this.info.gradeId
          this.getAcademyList()
          this.getMajorList()
          this.getGradeList()
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    save () {
      this.$confirm(`确定当前操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 验证身份证
        if (this.info.stuName === null || this.info.stuName === '') {
          this.$message.error('学生姓名为空')
          return
        }
        if (this.info.idNumberType === null || this.info.idNumberType === '') {
          this.$message.error('证件类型为空')
          return
        }
        if (this.info.idNumber === null || this.info.idNumber === '') {
          this.$message.error('证件号码为空')
          return
        }
        if (this.info.nativePlace === null || this.info.nativePlace === '') {
          this.$message.error('籍贯为空')
          return
        }
        if (this.info.schoolBefore === null || this.info.schoolBefore === '') {
          this.$message.error('毕业院校为空')
          return
        }
        if (this.info.residenceType === null || this.info.residenceType === '') {
          this.$message.error('户口性质为空')
          return
        }
        // if (this.info.status === null || this.info.status === '') {
        //   this.$message.error('考生状态为空')
        //   return
        // }
        if (this.info.admissionSeason === null || this.info.admissionSeason === '') {
          this.$message.error('招生季为空')
          return
        }
        if (this.info.classType === null || this.info.classType === '') {
          this.$message.error('班型为空')
          return
        }
        if (this.info.academyName === null || this.info.academyName === '') {
          this.$message.error('院校为空')
          return
        }
        if (this.info.gradeName === null || this.info.gradeName === '') {
          this.$message.error('年级为空')
          return
        }
        if (this.info.schoolingLength === null || this.info.schoolingLength === '') {
          this.$message.error('学制为空')
          return
        }
        if (this.info.enrollTeacher === null || this.info.enrollTeacher === '') {
          this.$message.error('招生老师为空')
          return
        }
        let regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/
        let IDRe18 = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
        let IDre15 = /^([1-6][1-9]|50)\d{4}\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}$/
        // let regphone = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
        let regnum = /^[0-9]*$/
        if (!(regnum.test(this.info.phone) || this.info.phone === null || this.info.phone === '')) {
          this.$message.error('联系电话校验错误')
          return
        }
        if (!(regnum.test(this.info.enrollTeacherPhone) || this.info.enrollTeacherPhone === null || this.info.enrollTeacherPhone === '')) {
          this.$message.error('招生老师电话校验错误')
          return
        }
        if ((this.info.email != null) && (this.info.email !== '')) {
          if (regEmail.test(this.info.email)) {
          } else {
            this.$message.error('邮箱校验错误')
            return
          }
        }
        this.info.idNumber = this.info.idNumber.replace(/\s*/g, '')
        if ((IDRe18.test(this.info.idNumber) || IDre15.test(this.info.idNumber))) {
          this.$http({
            url: this.$http.adornUrl('stu/temp/save'),
            method: 'post',
            data: this.info
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.returnBack()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        } else {
          this.$message.error('身份证号码校验失败')
        }
      })
    }
  },
  mounted () {
    if (this.$route.params.isEdit === true) {
      this.info.id = this.$route.params.stuId
      this.getData()
    } else {
      this.getAcademyList()
      this.info.id = 0
    }
  }
}
</script>

<style>
</style>

<template>
<div>
  <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
    <e-desc-item label="学号" >{{ Info.schoolNumber}}</e-desc-item>
    <e-desc-item label="姓名" >{{Info.name}}</e-desc-item>
    <e-desc-item label="身份证号码">{{ Info.idNumber }}</e-desc-item>
    <e-desc-item  label="年龄">{{ Info.age }}</e-desc-item>
    <e-desc-item label="性别">{{ Info.gender }}</e-desc-item>
    <e-desc-item label="民族">{{ Info.nation }}</e-desc-item>
    <e-desc-item label="籍贯">{{ Info.nativePlace }}</e-desc-item>
    <e-desc-item label="户口性质">{{ Info.residenceType === 0 ? '非农户口' : '农业户口' }}</e-desc-item>
    <e-desc-item label="政治面貌">{{ Info.politicalStatus }}</e-desc-item>
    <e-desc-item label="联系电话">{{ Info.phone }}</e-desc-item>
    <e-desc-item label="系部">{{ Info.deptName }}</e-desc-item>
    <e-desc-item label="专业">{{ Info.majorName }}</e-desc-item>
    <e-desc-item label="班型">{{ Info.classType }}</e-desc-item>
    <e-desc-item label="班级">{{ Info.className }}</e-desc-item>
    <e-desc-item label="班主任">{{ Info.headTeacher }}</e-desc-item>
    <e-desc-item label="班主任电话">{{ Info.headTeacherPhone }}</e-desc-item>
    <e-desc-item label="电子邮件">{{ Info.email }}</e-desc-item>
  </e-desc>

  <el-collapse  @change="handleChange" v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业详情</span>
      </template>
      <e-desc margin='0 12px' label-width='100px'>
        <e-desc-item label="离校日期" ><el-input v-model="Info.leaveDate" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="离校原因" ><el-input v-model="Info.leaveReason" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="就业单位"><el-input v-model="Info.employOrg" @change="handleInputChange"/></e-desc-item>
        <e-desc-item  label="就业岗位"><el-input v-model="Info.employPost" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="试用期薪酬"><el-input v-model="Info.probationIncome" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="转正薪酬"><el-input v-model="Info.formalIncome" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="岗位负责人"><el-input v-model="Info.postLeader" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="修改提交">
            <el-button  type="primary" @click="submitInfoForm">提交</el-button>
        </e-desc-item>
      </e-desc>
    </el-collapse-item>
  </el-collapse>

  <el-collapse v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业回访</span>
      </template>
      <el-tabs v-model="selectedTab" type="card" :active-name="selectedTab" :key="dialogVisible">
        <el-tab-pane v-for="(item, index) in visit" :key="index" :label="`第${index + 1}次回访记录`" :name="index"  >
          <e-desc margin='0 12px' label-width='140px' column="3" >
            <e-desc-item label="回访日期"><el-date-picker
              v-model="item.visitDate"
              type="datetime"
              placeholder="选择日期"
              value-format="yyyy-MM-dd HH:mm:ss"
              :default-time="['00:00:00', '23:59:59']" @change="handleInputChange2" ></el-date-picker> </e-desc-item>
            <e-desc-item label="是否在岗" ><el-input v-model="item.isPost === 1 ? '是' : '否'" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="是否对岗位满意"><el-input v-model="item.isSatisfied === 1 ? '是' : '否'" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item  label="学生就业工作情况"><el-input v-model="item.workSituation" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="离职原因"><el-input v-model="item.departReason" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="是否需要二次就业"><el-input v-model="item.isSecondEmploy === 1 ? '是' : '否'" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="二次就业分配时间"><el-input v-model="item.secondEmployDate" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="就业单位" ><el-input v-model="item.employOrg" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="就业岗位" ><el-input v-model="item.employPost" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="试用期限"><el-input v-model="item.probationPeriod" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item  label="试用期薪酬"><el-input v-model="item.probationIncome" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="转正薪酬"><el-input v-model="item.formalIncome" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="岗位负责人"><el-input v-model="item.postLeader" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="修改提交">
              <el-button  type="primary" @click="submitVisitForm(item)">提交</el-button>
            </e-desc-item>
          </e-desc>
        </el-tab-pane>
        <el-tab-pane :name="addTabs.name" :closable = "addTabs.closeable">
          <div style="width: 100%; height: 100%;" slot="label"  @click="addTab">{{addTabs.title}}</div>
        </el-tab-pane>
      </el-tabs>
    </el-collapse-item>
  </el-collapse>

  <el-dialog :visible.sync="dialogVisible" title="新增回访记录">
    <e-desc margin='0 12px' label-width='140px' column="2">
      <e-desc-item label="回访日期">
        <el-date-picker v-model="item.visitDate"
                        type="datetime"
                        placeholder="选择日期"
                        value-format="yyyy-MM-dd HH:mm:ss"
                        :default-time="['00:00:00', '23:59:59']"  ></el-date-picker>
      </e-desc-item>
      <e-desc-item label="是否在岗">
        <el-input v-model="item.isPost === 1 ? '否' : '是'"  />
      </e-desc-item>
      <e-desc-item label="是否对岗位满意"><el-input v-model="item.isSatisfied === 1 ? '是' : '否'"  /></e-desc-item>
      <e-desc-item  label="学生就业工作情况"><el-input v-model="item.workSituation" /></e-desc-item>
      <e-desc-item label="离职原因"><el-input v-model="item.departReason"  /></e-desc-item>
      <e-desc-item label="是否需要二次就业"><el-input v-model="item.isSecondEmploy === 1 ? '是' : '否'"  /></e-desc-item>
      <e-desc-item label="二次就业分配时间"><el-input v-model="item.secondEmployDate"  /></e-desc-item>
      <e-desc-item label="就业单位" ><el-input v-model="item.employOrg" /></e-desc-item>
      <e-desc-item label="就业岗位" ><el-input v-model="item.employPost"  /></e-desc-item>
      <e-desc-item label="试用期限"><el-input v-model="item.probationPeriod"  /></e-desc-item>
      <e-desc-item  label="试用期薪酬"><el-input v-model="item.probationIncome" /></e-desc-item>
      <e-desc-item label="转正薪酬"><el-input v-model="item.formalIncome" /></e-desc-item>
      <e-desc-item label="岗位负责人"><el-input v-model="item.postLeader"  /></e-desc-item>
    </e-desc>
    <div slot="footer">
      <el-button @click="canceldialogVisible">取消</el-button>
      <el-button type="primary" @click="submitForm">确定</el-button>
    </div>
  </el-dialog>


  <div class="footer-container">
    <el-button type="primary" class="custom-button" @click="returnBack">返回</el-button>
  </div>
</div>

</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'

export default {
  tabIndex: 2,
  name: 'employModify',
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      dialogVisible: false,
      isFormModified2: false,
      isFormModified: false,
      selectedTab: 0,
      savedTab: 0,
      activeCollapse: ['1'],
      tabIndex: 2,
      Info: null,
      visit: null,
      addTabs: {
        title: '+',
        name: '+',
        closeable: false
      },
      item: {
        visitDate: '',
        isPost: '',
        isSatisfied: '',
        workSituation: '',
        departReason: '',
        isSecondEmploy: '',
        secondEmployDate: '',
        employOrg: '',
        probationPeriod: '',
        formalIncome: '',
        postLeader: '',
        schoolNumber: this.$route.params.schoolNumber
      }
    }
  },
  created () {
    this.$http({
      url: this.$http.adornUrl('/stu/getEmployList'),
      method: 'get'
    }).then(response => {
      this.Info = response.data.listDto.find(item => item.schoolNumber === this.$route.params.schoolNumber)
    })
      .catch(error => {
        console.error(error)
      })
    this.$http({
      url: this.$http.adornUrl('/stu/getVisitList'),
      method: 'get'
    }).then(
      response => {
        console.log(response.data)
        this.visit = response.data.visitList.filter(item => item.schoolNumber === this.$route.params.schoolNumber)
        console.log(this.visit)
        // this.visit = this.visit.map((item, index) => {
        //   item.label = `第${index + 1}次回访记录`;
        //   return item;
        // })
      }).catch(error => {
        console.error(error)
      })
  },
  methods: {
    canceldialogVisible () {
      this.selectedTab = this.savedTab
      this.dialogVisible = false
      this.resetForm()
    },
    resetForm () {
      // 重置表单数据
      this.item = {
        visitDate: '',
        isPost: '',
        isSatisfied: '',
        workSituation: '',
        departReason: '',
        isSecondEmploy: '',
        secondEmployDate: '',
        employOrg: '',
        probationPeriod: '',
        formalIncome: '',
        postLeader: ''
      }
    },
    submitForm () {
      this.selectedTab = this.savedTab

      this.$confirm('确认提交吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/stu/addVisitDetail'),
          method: 'post',
          data: this.item
        }).then(response => {
          console.log(response.data)
        })
          .catch(error => {
            console.error(error)
          })
        this.visit.push(this.item)
        this.dialogVisible = false
        this.resetForm()
      }).catch(() => {

      })
    },
    handleInputChange2 () {
      this.isFormModified2 = true
    },
    submitVisitForm (item) {
      if (this.isFormModified2) {
        this.$confirm('确认提交吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/stu/changeVisitDetail'),
            method: 'post',
            data: item
          }).then(response => {
            console.log(response.data)
          })
            .catch(error => {
              console.error(error)
            })
          this.isFormModified2 = false
        }).catch(() => {
          // 取消提交
        })
      } else {
        this.$alert('您还未作出任何修改！', '警告', {
          confirmButtonText: '确定',
          type: 'warning'
        })
      }
    },
    handleInputChange () {
      this.isFormModified = true
    },
    submitInfoForm () {
      if (this.isFormModified) {
        this.$confirm('确认提交吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/stu/changeEmployDetail'),
            method: 'post',
            data: this.Info
          }).then(response => {
            console.log(response.data)
          })
            .catch(error => {
              console.error(error)
            })
          this.isFormModified = false
        }).catch(() => {
          // 取消提交
        })
      } else {
        this.$alert('您还未作出任何修改！', '警告', {
          confirmButtonText: '确定',
          type: 'warning'
        })
      }
    },
    returnBack () {
      this.$router.go(-1)
    },
    addTab () {
      this.dialogVisible = true
      this.savedTab = this.selectedTab
      console.log(this.dialogVisible)
    }
  }
}
</script>

<style scoped>
.footer-container {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}
</style>

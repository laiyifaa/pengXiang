<template>
<div>
  <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
    <e-desc-item label="学号" >{{ Info.schoolNumber}}</e-desc-item>
    <e-desc-item label="姓名" >{{Info.name}}</e-desc-item>
    <e-desc-item label="证件类型">身份证</e-desc-item>
    <e-desc-item label="证件号码">{{ Info.idNumber }}</e-desc-item>
    <e-desc-item  label="年龄">{{ Info.age }}</e-desc-item>
    <e-desc-item label="性别">{{ Info.gender }}</e-desc-item>
    <e-desc-item label="民族">{{ Info.nation }}</e-desc-item>
    <e-desc-item label="籍贯">{{ Info.nativePlace }}</e-desc-item>
    <e-desc-item label="户口性质">{{ Info.residenceType=== 0 ? '城市' : Info.residenceType === 1 ? '农村': Info.residenceType === 2 ? '县城' : '县镇' }}</e-desc-item>
    <e-desc-item label="政治面貌">{{ Info.politicalStatus }}</e-desc-item>
    <e-desc-item label="联系电话">{{ Info.phone }}</e-desc-item>
    <e-desc-item label="系部">{{ Info.deptName }}</e-desc-item>
    <e-desc-item label="专业">{{ Info.majorName }}</e-desc-item>
    <e-desc-item label="班型">{{ Info.classType === 1?'就业':'升学' }}</e-desc-item>
    <e-desc-item label="班级">{{ Info.className }}</e-desc-item>
    <e-desc-item label="班主任">{{ Info.headTeacher }}</e-desc-item>
    <e-desc-item label="班主任电话">{{ Info.headTeacherPhone }}</e-desc-item>
    <e-desc-item label="电子邮件">{{ Info.email }}</e-desc-item>
  </e-desc>

  <el-collapse v-show="idNumberIsNull"  @change="handleChange" v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业详情</span>
      </template>
      <e-desc margin='0 12px' label-width='100px'>
        <e-desc-item icon="*" label="离校日期" ><el-date-picker v-model="Info.leaveDate" value-format="yyyy-MM-dd" @change="handleInputChange" placeholder="请选择离开日期" ></el-date-picker></e-desc-item>
        <e-desc-item label="离校原因" ><el-input v-model="Info.leaveReason" @change="handleInputChange"/></e-desc-item>
        <e-desc-item icon="*" label="就业单位">
          <el-input v-model="Info.employOrg" placeholder="请填写就业单位" @change="handleInputChange"></el-input>
        </e-desc-item>
        <e-desc-item  label="就业岗位"><el-input v-model="Info.employPost" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="试用期薪酬"><el-input v-model="Info.probationIncome" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="转正薪酬"><el-input v-model="Info.formalIncome" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="岗位负责人"><el-input v-model="Info.postLeader" @change="handleInputChange"/></e-desc-item>
        <e-desc-item label="修改提交">
            <el-button  type="primary" @click="submitInfoForm">修改</el-button>
        </e-desc-item>
      </e-desc>
    </el-collapse-item>
  </el-collapse>

  <el-collapse v-show="idNumberIsNull" v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业回访</span>
      </template>
      <el-tabs v-model="selectedTab" type="card" :active-name="selectedTab" :key="dialogVisible">
        <el-tab-pane v-for="(item, index) in visit" :key="index" :label="`第${index + 1}次回访记录`" :name="index"  >
          <e-desc margin='0 12px' label-width='140px' column="3" >

            <e-desc-item label="回访日期" icon="*">
              <el-date-picker
              v-model="item.visitDate"
              value-format="yyyy-MM-dd"
              placeholder="选择日期"
               @change="handleInputChange2" ></el-date-picker> </e-desc-item>
            <e-desc-item label="就业单位" icon="*"><el-input v-model="item.employOrg" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="是否在岗" >
              <el-select v-model="item.isPost" @change="handleInputChange2">
                <el-option label="是" :value='1' :key='1'></el-option>
                <el-option label="否" :value='0' :key='0'></el-option>
              </el-select>
            </e-desc-item>
            <e-desc-item label="是否对岗位满意">
              <el-select v-model="item.isSatisfied" @change="handleInputChange2">
                <el-option label="是" :value='1' :key='1'></el-option>
                <el-option label="否" :value='0' :key='0'></el-option>
              </el-select>
            </e-desc-item>
            <e-desc-item  label="学生就业工作情况">
              <el-select v-model="item.workSituation" @change="handleInputChange2">
                <el-option label="优秀" value='优秀' ></el-option>
                <el-option label="良好" value='良好' ></el-option>
                <el-option label="及格" value='及格' ></el-option>
              </el-select>
            </e-desc-item>
            <e-desc-item label="离职原因"><el-input v-model="item.departReason" @change="handleInputChange2" /></e-desc-item>

            <e-desc-item label="是否需要二次就业">
              <el-select v-model="item.isSecondEmploy" @change="handleInputChange2">
                <el-option label="是" :value='1' :key='1'></el-option>
                <el-option label="否" :value='0' :key='0'></el-option>
              </el-select>
            </e-desc-item>
            <e-desc-item label="二次就业分配时间">
                <el-date-picker
                  v-model="item.secondEmployDate"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期"
                  @change="handleInputChange2" ></el-date-picker>
            </e-desc-item>
            <e-desc-item label="就业岗位" ><el-input v-model="item.employPost" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="试用期限"><el-input v-model="item.probationPeriod" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item  label="试用期薪酬"><el-input v-model="item.probationIncome" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="转正薪酬"><el-input v-model="item.formalIncome" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="岗位负责人"><el-input v-model="item.postLeader" @change="handleInputChange2" /></e-desc-item>
            <e-desc-item label="修改提交">
              <el-button  type="primary" @click="submitVisitForm(item)">操作</el-button>
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
      <e-desc-item label="回访日期" icon="*">
        <el-date-picker
          v-model="item.visitDate"
          value-format="yyyy-MM-dd"
          placeholder="选择日期"
          @change="handleInputChange2"  ></el-date-picker> </e-desc-item>
      <e-desc-item label="就业单位" icon="*"><el-input v-model="item.employOrg" @change="handleInputChange2" /></e-desc-item>
      <e-desc-item label="就业岗位" ><el-input v-model="item.employPost" @change="handleInputChange2" /></e-desc-item>
      <e-desc-item label="是否在岗" >
        <el-select v-model="item.isPost" @change="handleInputChange2">
          <el-option label="是" :value='1' :key='1'></el-option>
          <el-option label="否" :value='0' :key='0'></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="是否对岗位满意">
        <el-select v-model="item.isSatisfied" @change="handleInputChange2">
          <el-option label="是" :value='1' :key='1'></el-option>
          <el-option label="否" :value='0' :key='0'></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item  label="学生就业工作情况">
        <el-select v-model="item.workSituation" @change="handleInputChange2">
          <el-option label="优秀" value='优秀' ></el-option>
          <el-option label="良好" value='良好' ></el-option>
          <el-option label="及格" value='及格' ></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="离职原因"><el-input v-model="item.departReason" @change="handleInputChange2" /></e-desc-item>

      <e-desc-item label="是否需要二次就业">
        <el-select v-model="item.isSecondEmploy" @change="handleInputChange2">
          <el-option label="是" :value='1' :key='1'></el-option>
          <el-option label="否" :value='0' :key='0'></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item  label="二次就业分配时间">
        <el-date-picker
          :disabled="canSecond"
          v-model="item.secondEmployDate"
          value-format="yyyy-MM-dd"
          placeholder="选择日期"
          @change="handleInputChange2"
        ></el-date-picker>
      </e-desc-item>

      <e-desc-item label="试用期限"><el-input v-model="item.probationPeriod" @change="handleInputChange2" /></e-desc-item>
      <e-desc-item  label="试用期薪酬"><el-input v-model="item.probationIncome" @change="handleInputChange2" /></e-desc-item>
      <e-desc-item label="转正薪酬"><el-input v-model="item.formalIncome" @change="handleInputChange2" /></e-desc-item>
      <e-desc-item label="岗位负责人"><el-input v-model="item.postLeader" @change="handleInputChange2" /></e-desc-item>
    </e-desc>
    <div slot="footer">
      <el-button @click="canceldialogVisible">取消</el-button>
      <el-button type="primary" @click="submitForm">确定</el-button>
    </div>
  </el-dialog>



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
      idNumberIsNull: '',
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
        secondEmployDate: 0,
        employOrg: '',
        probationPeriod: '',
        formalIncome: '',
        postLeader: '',
        idNumber: this.$route.params.idNumber
      }
    }
  },
  computed: {
    canSecond () {
      return this.item.isSecondEmploy === 0 // 如果isSecondEmploy为0，则禁用二次就业分配时间的选择框
    }
  },
  created () {
    this.Info = JSON.parse(decodeURIComponent(this.$route.query.Info))
    if (this.$route.query.idNumber != null) {
      this.idNumberIsNull = true
      this.$http({
        url: this.$http.adornUrl('/stu/getVisitList'),
        method: 'get'
      }).then(
      response => {
        this.visit = response.data.visitList.filter(item => item.idNumber === this.$route.query.idNumber)
        this.visit.forEach(function (value, index, array) {
          if (array[index].secondEmployDate === null) {
            array[index].secondEmployDate = ''
          }
        })
      }).catch(error => {
        this.$message.error(error)
      })
    } else {
      this.idNumberIsNull = false
    }
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
        isSecondEmploy: 0,
        secondEmployDate: '',
        employOrg: '',
        probationPeriod: '',
        formalIncome: '',
        postLeader: ''
      }
    },
    submitForm () {
      if (this.item.visitDate != '' && this.item.employOrg != '') {
        console.log(this.item.secondEmployDate)
        this.item.visitDate = new Date(this.item.visitDate).toISOString().slice(0, 10) + ' 00:00:00'
        if (this.item.secondEmployDate != null && this.item.secondEmployDate != '') {
          this.item.secondEmployDate = new Date(this.item.secondEmployDate).toISOString().slice(0, 10) + ' 00:00:00'
        }
        this.selectedTab = this.savedTab
        this.$confirm('确定要为身份证为：' + this.$route.params.idNumber + '       的学生添加回访记录吗？', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/stu/addVisitDetail'),
            method: 'post',
            data: this.item
          }).then(response => {

          })
            .catch(error => {
              this.$message.error(error)
            })
          this.visit.push(this.item)
          this.dialogVisible = false
          this.resetForm()
        }).catch(() => {

        })
      } else {
        this.$message.error('请填入必填信息')
      }
    },
    handleInputChange2 () {
      this.isFormModified2 = true
    },
    submitVisitForm (item) {
      if (item.visitDate != '' && item.employOrg != '') {
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
            })
              .catch(error => {
                this.$message.error(error)
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
      } else {
        this.$message.error('请填入必填信息')
      }
    },
    handleInputChange () {
      this.isFormModified = true
    },
    submitInfoForm () {
      if (this.Info.leaveDate != '' && this.Info.leaveDate != null && this.Info.employOrg != '' && this.Info.employOrg != null) {
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

            })
              .catch(error => {
                this.$message.error(error)
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
      } else {
        this.$message.error('请填入必填信息')
      }
    },
    returnBack () {
      this.$router.go(-1)
    },
    addTab () {
      this.dialogVisible = true
      this.savedTab = this.selectedTab
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

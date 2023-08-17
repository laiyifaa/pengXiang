<template>
  <div >
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
      <e-desc-item label="班型">{{ Info.classType === 1?'就业':'升学' }}</e-desc-item>
      <e-desc-item label="班级">{{ Info.className }}</e-desc-item>
      <e-desc-item label="班主任">{{ Info.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话">{{ Info.headTeacherPhone }}</e-desc-item>
      <e-desc-item label="电子邮件">{{ Info.email }}</e-desc-item>
    </e-desc>

    <el-collapse v-show="schoolNumberIsNull" v-model="activeCollapse" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align:center; font-weight: bold;padding-left: 10px; font-size: 18px;">实习详情</span>
        </template>
        <el-tabs v-model="selectedTab" type="card" :active-name="selectedTab" :key="dialogVisible">
          <el-tab-pane v-for="(item, index) in workInfo" :key="index" :label="`第${index + 1}阶段实习`" :name="index">
            <e-desc margin='0 0px' label-width='140px' column="3">
              <e-desc-item icon="*" label="实习离校日期">
                <el-date-picker
                  v-model="item.leaveDate"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item icon="*" label="实习单位" ><el-input v-model="item.practiceOrg" ></el-input></e-desc-item>
              <e-desc-item label="实习报酬"><el-input v-model="item.practiceIncome" ></el-input></e-desc-item>
              <e-desc-item  label="实习岗位"><el-input v-model="item.practicePost" ></el-input></e-desc-item>
              <e-desc-item label="实习类别" >
                <el-select v-model="item.practiceType">
                  <el-option label="认识实习" value="1" :key="1"></el-option>
                  <el-option label="岗位实习" value="2" :key="2"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="预计实习结束日期">
                <el-date-picker v-model="item.expectEndDate"  placeholder="选择日期" value-format="yyyy-MM-dd" >
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="实际实习结束日期">
                <el-date-picker v-model="item.realEndDate"  placeholder="选择日期" value-format="yyyy-MM-dd" >
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="学生实习鉴定结果" >
                  <el-select v-model="item.practiceResult" @change="handleInputChange2">
                    <el-option label="优秀" value='优秀' ></el-option>
                    <el-option label="良好" value='良好' ></el-option>
                    <el-option label="及格" value='及格' ></el-option>
                  </el-select>
              </e-desc-item>
              <e-desc-item label="是否对岗位满意" >
                <el-select v-model="item.isSatisfied" @change="handleInputChange2">
                  <el-option label="是" value="1" :key="1"></el-option>
                  <el-option label="否" value="0" :key="0"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="带队教师"><el-input width="100px" v-model="item.postLeader" ></el-input></e-desc-item>
              <e-desc-item  label="带队教师电话"><el-input v-model="item.postLeaderPhone" ></el-input></e-desc-item>
              <e-desc-item label="修改提交">
                <el-button  type="primary" @click="submitPracticeForm(item)">修改</el-button>
              </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane :name="addTabs.name" :closable = "addTabs.closeable">
            <div style="width: 100%; height: 100%;" slot="label"  @click="addTab">{{addTabs.title}}</div>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>


    <el-dialog :visible.sync="dialogVisible" title="新增实习阶段"   :modal="false" >
      <e-desc margin='0 12px' label-width='140px' column="2">
        <e-desc-item icon="*" label="实习离校日期">
          <el-date-picker
            v-model="item.leaveDate"
            value-format="yyyy-MM-dd"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item icon="*" label="实习单位" ><el-input v-model="item.practiceOrg" ></el-input></e-desc-item>
        <e-desc-item label="实习类别" >
          <el-select v-model="item.practiceType" >
            <el-option label="认识实习" :value='1' :key='1'></el-option>
            <el-option label="岗位实习" :value='2' :key='2'></el-option>
          </el-select>
        </e-desc-item>

        <e-desc-item label="实习报酬"><el-input v-model="item.practiceIncome" ></el-input></e-desc-item>
        <e-desc-item  label="实习岗位"><el-input v-model="item.practicePost" ></el-input></e-desc-item>

        <e-desc-item label="预计实习结束日期">
          <el-date-picker v-model="item.expectEndDate"  placeholder="选择日期" value-format="yyyy-MM-dd" >
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="实际实习结束日期">
          <el-date-picker v-model="item.realEndDate"  placeholder="选择日期" value-format="yyyy-MM-dd" >
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="学生实习鉴定结果" >
          <el-select v-model="item.practiceResult" @change="handleInputChange2">
            <el-option label="优秀" value='优秀' ></el-option>
            <el-option label="良好" value='良好' ></el-option>
            <el-option label="及格" value='及格' ></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="是否对岗位满意" >
          <el-select v-model="item.isSatisfied" @change="handleInputChange2">
            <el-option label="是" :value='1' :key='1'></el-option>
            <el-option label="否" :value='0' :key='0'></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="带队教师"><el-input width="100px" v-model="item.postLeader" ></el-input></e-desc-item>
        <e-desc-item  label="带队教师电话"><el-input v-model="item.postLeaderPhone" ></el-input></e-desc-item>
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
  name: 'workModify',
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      activeCollapse: ['1'],
      workInfo: null,
      Info: null,
      dialogVisible: false,
      selectedTab: 0,
      savedTab: 0,
      addTabs: {
        title: '+',
        name: '+',
        closeable: false
      },
      item: {
        schoolNumberIsNull:'',
        practiceType: '',
        practiceOrg: '',
        practiceIncome: '',
        practicePost: '',
        leaveDate: '',
        expectEndDate: '',
        realEndDate: '',
        practiceResult: '',
        isSatisfied: '',
        postLeader: '',
        postLeaderPhone: '',
        schoolNumber: this.$route.params.schoolNumber
      }
    }
  },
  created () {
    this.Info = this.$route.params.Info
    if(this.$route.params.schoolNumber!=null){
      this.schoolNumberIsNull=true
      this.$http({
        url: this.$http.adornUrl('/stuWork/getPractice'),
        method: 'get'
      }).then(response => {
        this.workInfo = response.data.prEntities.filter(item => item.schoolNumber == this.$route.params.schoolNumber)
      })
        .catch(error => {
          this.$message.error(error)
        })
    }else {
      this.schoolNumberIsNull=false
    }


  },
  methods: {
    submitForm () {
      if (this.item.practiceOrg != '' && this.item.leaveDate != '' ) {
        this.item.leaveDate = new Date(this.item.leaveDate).toISOString().slice(0, 10) + ' 00:00:00'
        if(null != this.item.expectEndDate  && ''!= this.item.expectEndDate ){
          this.item.expectEndDate = new Date(this.item.expectEndDate).toISOString().slice(0, 10) + ' 00:00:00'
        }
        if(null != this.item.realEndDate  && ''!= this.item.realEndDate ){
          this.item.realEndDate = new Date(this.item.realEndDate).toISOString().slice(0, 10) + ' 00:00:00'
        }
        this.$confirm('确定要为学号为：'+    this.$route.params.schoolNumber   +'           的学生添加实习记录吗？', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/stuWork/addPractice'),
            data: this.item,
            method: 'post'
          }).then(response => {

          }).catch(error => {
            this.$message.error(error)
          })
          this.selectedTab = this.savedTab
          this.workInfo.push(this.item)
          this.resetItem()
          this.dialogVisible = false
        }).catch(() => {

        })
      } else {
        this.$message.error('请填入必填信息')
      }
    },
    canceldialogVisible () {
      this.selectedTab = this.savedTab
      this.dialogVisible = false
      this.resetItem()
    },
    resetItem () {
      this.item = {
        practiceType: '',
        practiceOrg: '',
        practiceIncome: '',
        practicePost: '',
        leaveDate: '',
        expectEndDate: '',
        realEndDate: '',
        practiceResult: '',
        isSatisfied: '',
        postLeader: '',
        postLeaderPhone: '',
        schoolNumber: this.$route.params.schoolNumber
      }
    },
    submitPracticeForm (item) {
      console.log(this.workInfo)
      if (item.practiceOrg != '' && item.leaveDate != '' ) {
        this.$confirm('确认提交吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/stuWork/changePractice'),
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
        this.$message.error('请填入必填信息')
      }
    },
    returnBack () {
      this.$router.go(-1)
    },
    addTab () {
      this.dialogVisible = true
      this.savedTab = this.selectedTab
    },
    confirmRemoveTab (targetName) {
      this.$confirm('确定要删除该标签页吗？', '确认删除', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.removeTab(targetName)
      }).catch(() => {
       // 用户取消删除操作
      })
    },
    removeTab (targetName) {
      const tabs = this.editableTabs
      const index = tabs.findIndex(tab => tab.name === targetName)
      if (index !== -1) {
        tabs.splice(index, 1)
      }
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

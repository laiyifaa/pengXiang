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
      <e-desc-item label="班型">{{ Info.classType }}</e-desc-item>
      <e-desc-item label="班级">{{ Info.className }}</e-desc-item>
      <e-desc-item label="班主任">{{ Info.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话">{{ Info.headTeacherPhone }}</e-desc-item>
      <e-desc-item label="电子邮件">{{ Info.email }}</e-desc-item>
    </e-desc>

    <el-collapse v-model="activeCollapse" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align:center; font-weight: bold;padding-left: 10px; font-size: 18px;">实习详情</span>
        </template>
        <el-tabs v-model="selectedTab" type="card" :active-name="selectedTab" :key="dialogVisible">
          <el-tab-pane v-for="(item, index) in workInfo" :key="index" :label="`第${index + 1}阶段实习`" :name="index">
            <e-desc margin='0 0px' label-width='140px' column="3">
              <e-desc-item label="实习类别" ><el-input v-model="item.practiceType === 1 ? '认识实习': '岗位实习'" ></el-input></e-desc-item>
              <e-desc-item label="实习单位" ><el-input v-model="item.practiceOrg" ></el-input></e-desc-item>
              <e-desc-item label="实习报酬"><el-input v-model="item.practiceIncome" ></el-input></e-desc-item>
              <e-desc-item  label="实习岗位"><el-input v-model="item.practicePost" ></el-input></e-desc-item>
              <e-desc-item label="实习离校日期">
                  <el-date-picker v-model="item.leaveDate" type="datetime" placeholder="选择日期" value-format="yyyy-MM-dd HH:mm:ss" :default-time="['00:00:00', '23:59:59']">
                  </el-date-picker>
              </e-desc-item>
              <e-desc-item label="预计实习结束日期">
                <el-date-picker v-model="item.expectEndDate" type="datetime" placeholder="选择日期" value-format="yyyy-MM-dd HH:mm:ss" :default-time="['00:00:00', '23:59:59']">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="实际实习结束日期">
                <el-date-picker v-model="item.realEndDate" type="datetime" placeholder="选择日期" value-format="yyyy-MM-dd HH:mm:ss" :default-time="['00:00:00', '23:59:59']">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="学生实习鉴定结果" ><el-input v-model="item.practiceResult" ></el-input></e-desc-item>
              <e-desc-item label="是否对岗位满意" ><el-input v-model="item.isSatisfied === 1?'满意':'不满意'" ></el-input></e-desc-item>
              <e-desc-item label="带队教师"><el-input width="100px" v-model="item.postLeader" ></el-input></e-desc-item>
              <e-desc-item  label="带队教师电话"><el-input v-model="item.postLeaderPhone" ></el-input></e-desc-item>
              <e-desc-item label="修改提交">
                <el-button  type="primary" @click="submitPracticeForm(item)">提交</el-button>
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
        <e-desc-item label="实习类别" ><el-input v-model="item.practiceType === 1 ? '认识实习': '岗位实习'" ></el-input></e-desc-item>
        <e-desc-item label="实习单位" ><el-input v-model="item.practiceOrg" ></el-input></e-desc-item>
        <e-desc-item label="实习报酬"><el-input v-model="item.practiceIncome" ></el-input></e-desc-item>
        <e-desc-item  label="实习岗位"><el-input v-model="item.practicePost" ></el-input></e-desc-item>
        <e-desc-item label="实习离校日期">
          <el-date-picker v-model="item.leaveDate" type="datetime" placeholder="选择日期" value-format="yyyy-MM-dd HH:mm:ss" :default-time="['00:00:00', '23:59:59']" :picker-options="{ zIndex: 9999 }">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="预计实习结束日期">
          <el-date-picker v-model="item.expectEndDate" type="datetime" placeholder="选择日期" value-format="yyyy-MM-dd HH:mm:ss" :default-time="['00:00:00', '23:59:59']" :picker-options="{ zIndex: 9999 }">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="实际实习结束日期">
          <el-date-picker v-model="item.realEndDate" type="datetime" placeholder="选择日期" value-format="yyyy-MM-dd HH:mm:ss" :default-time="['00:00:00', '23:59:59']" :picker-options="{ zIndex: 9999 }">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="学生实习鉴定结果" ><el-input v-model="item.practiceResult" ></el-input></e-desc-item>
        <e-desc-item label="是否对岗位满意" ><el-input v-model="item.isSatisfied === 1?'满意':'不满意'" ></el-input></e-desc-item>
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
      workInfo:null,
      Info: null,
      dialogVisible:false,
      selectedTab:0,
      savedTab:0,
      addTabs: {
        title: '+',
        name: '+',
        closeable: false
      },
      item:{
          practiceType:'',
          practiceOrg:'',
          practiceIncome:'',
          practicePost:'',
          leaveDate:'',
          expectEndDate:'',
          realEndDate:'',
          practiceResult:'',
          isSatisfied:'',
          postLeader:'',
          postLeaderPhone:'',
          schoolNumber:this.$route.params.schoolNumber
      }
    }
  },
  // created() {
  //   this.$http({
  //     url: this.$http.adornUrl('/stu/getEmployList'),
  //     method: 'get'
  //   }).then(response => {
  //     this.Info = response.data.listDto.find(item => item.schoolNumber === this.$route.params.schoolNumber)
  //   })
  //     .catch(error => {
  //       console.error(error)
  //     })
  //
  //    this.$http({
  //     url: this.$http.adornUrl('/stuWork/getPractice'),
  //     method: 'get'
  //   }).then(response => {
  //     this.workInfo = response.data.prEntities.filter(item => item.schoolNumber == this.$route.params.schoolNumber);
  //     console.log(this.workInfo)
  //   })
  //     .catch(error => {
  //       console.error(error)
  //     })
  // },
  methods: {
    submitForm(){
      this.$confirm('确认提交吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
         this.$http({
             url:this.$http.adornUrl("/stuWork/addPractice"),
             data:this.item,
             method:'post'
         }).then(response => {
           console.log(response.data)
         }).catch(error => {
           console.log(error)
         })
        this.selectedTab = this.savedTab
        this.resetItem()
        this.workInfo.push(this.item)
        this.dialogVisible = false
      }).catch(() => {

      })
    },
    canceldialogVisible(){
      this.selectedTab = this.savedTab
      this.dialogVisible=false
      this.resetItem()
    },
    resetItem(){
      this.item= {
        practiceType:'',
        practiceOrg:'',
        practiceIncome:'',
        practicePost:'',
        leaveDate:'',
        expectEndDate:'',
        realEndDate:'',
        practiceResult:'',
        isSatisfied:'',
        postLeader:'',
        postLeaderPhone:'',
        schoolNumber:this.$route.params.schoolNumber
      }
    },
    submitPracticeForm(item){
      this.$confirm('确认提交吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/stuWork/changePractice'),
          method: 'post',
          data:item
        }).then(response => {
          console.log(response.data)
        })
          .catch(error => {
            console.error(error)
          })
        this.isFormModified2=false
      }).catch(() => {
        // 取消提交
      });

    },
    returnBack () {
      this.$router.go(-1)
    },
    addTab () {
      this.dialogVisible=true
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

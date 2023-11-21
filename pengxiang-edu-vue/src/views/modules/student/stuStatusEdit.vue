<template>
  <div>
    <e-desc margin='0 12px' label-width='120px' title="学生基本信息">
      <e-desc-item label="姓名">{{baseInfo.stuName}}</e-desc-item>
      <e-desc-item label="出生年月">{{ baseInfo.birthday }}</e-desc-item>
      <e-desc-item label="性别">{{ baseInfo.gender}}</e-desc-item>
      <e-desc-item label="现就读学校" >{{ baseInfo.studyIn }}</e-desc-item>
      <e-desc-item label="现学籍学校">{{ baseInfo.statusSchool }}</e-desc-item>
      <e-desc-item label="院校">{{ baseInfo.academyName }}</e-desc-item>
      <e-desc-item label="年级">{{ baseInfo.gradeName }}</e-desc-item>
      <e-desc-item label="专业">{{ baseInfo.majorName }}</e-desc-item>
      <e-desc-item label="班级">{{ baseInfo.className }}</e-desc-item>
      <e-desc-item label="班型">{{ baseInfo.classType === 1?'就业':'升学'}}</e-desc-item>
      <e-desc-item label="班主任" >{{ baseInfo.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话" >{{ baseInfo.headTeacherPhone }}</e-desc-item>
      <e-desc-item label="身份证号码">{{ baseInfo.idNumber }}</e-desc-item>
      <e-desc-item label="学号">{{ baseInfo.schoolNumber }}</e-desc-item>
      <e-desc-item label="当前状态">{{ getCurrentStatusText(baseInfo.currentStatus) }}</e-desc-item>
      <e-desc-item label="学籍状态">{{ getSchoolStatusText(baseInfo.schoolRollStatus) }}</e-desc-item>

    </e-desc>

    <el-collapse  v-model="activeCollapse" >
      <el-collapse-item name="1" >
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学籍变更记录</span>
        </template>
        <el-tabs type="border-card" key>
          <el-tab-pane v-for="(item, index) in changeList" :key="index" :label="`${item.updateTime}变更`">
            <e-desc margin='0 12px' label-width='160px' column="3" >
              <e-desc-item label="变更前的当前状态">
                <el-select v-model="item.oldCurrentStatus" placeholder="请选择变更前的当前状态"  >
                  <el-option label="在校" :value="0"></el-option>
                  <el-option label="退学" :value="1"></el-option>
                  <el-option label="实习" :value="2"></el-option>
                  <el-option label="就业" :value="3"></el-option>
                  <el-option label="请假" :value="4"></el-option>
                  <el-option label="休学" :value="5"></el-option>
                  <el-option label="毕业" :value="6"></el-option>
                  <el-option label="未报到" :value="7"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="变更后的当前状态">
                <el-select v-model="item.newCurrentStatus" placeholder="请选择变更后的当前状态" >
                  <el-option label="在校" :value="0"></el-option>
                  <el-option label="退学" :value="1"></el-option>
                  <el-option label="实习" :value="2"></el-option>
                  <el-option label="就业" :value="3"></el-option>
                  <el-option label="请假" :value="4"></el-option>
                  <el-option label="休学" :value="5"></el-option>
                  <el-option label="毕业" :value="6"></el-option>
                  <el-option label="未报到" :value="7"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="变更前的学籍状态">
                <el-select v-model="item.oldSchoolRollStatus" placeholder="请选择学籍状态" >
                  <el-option label="已注册" :value="0"></el-option>
                  <el-option label="未注册" :value="1"></el-option>
                  <el-option label="注册前退学" :value="2"></el-option>
                  <el-option label="注册后退学" :value="3"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="变更后的学籍状态">
                <el-select v-model="item.newSchoolRollStatus" placeholder="请选择学籍状态" >
                  <el-option label="已注册" :value="0"></el-option>
                  <el-option label="未注册" :value="1"></el-option>
                  <el-option label="注册前退学" :value="2"></el-option>
                  <el-option label="注册后退学" :value="3"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="学籍变更时间">
                <el-date-picker
                  v-model="item.updateTime"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="离校日期">
                <el-date-picker
                  v-model="item.levelDate"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="结束日期">
                <el-date-picker
                  v-model="item.endDate"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
                </e-desc-item>
              <e-desc-item label="学籍变更原因">
                <el-input  style="width: 700px;" v-model="item.changeDetail"></el-input>
              </e-desc-item>
              <e-desc-item label="提交修改">
                <el-button  type="primary" @click="handleSubmit(item,false)" >操作</el-button>
              </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane :name="addTabs.name" :closable = "addTabs.closeable">
            <div style="width: 100%; height: 100%;" slot="label"  @click="addTab">{{addTabs.title}}</div>
          </el-tab-pane>
        </el-tabs>

      </el-collapse-item>
    </el-collapse>


    <el-dialog :visible.sync="dialogVisible" title="新增变更记录"   :modal="false" >
      <e-desc margin='0 12px' label-width='160px' column="2">
        <e-desc-item label="变更前的当前状态">
          <el-select v-model="addStatus.oldCurrentStatus" placeholder="请选择变更前的当前状态"  disabled>
            <el-option label="在校" :value="0"></el-option>
            <el-option label="退学" :value="1"></el-option>
            <el-option label="实习" :value="2"></el-option>
            <el-option label="就业" :value="3"></el-option>
            <el-option label="请假" :value="4"></el-option>
            <el-option label="休学" :value="5"></el-option>
            <el-option label="毕业" :value="6"></el-option>
            <el-option label="未报到" :value="7"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="变更后的当前状态">
          <el-select v-model="addStatus.newCurrentStatus" placeholder="请选择变更后的当前状态" >
            <el-option label="在校" :value="0"></el-option>
            <el-option label="退学" :value="1"></el-option>
            <el-option label="实习" :value="2"></el-option>
            <el-option label="就业" :value="3"></el-option>
            <el-option label="请假" :value="4"></el-option>
            <el-option label="休学" :value="5"></el-option>
            <el-option label="毕业" :value="6"></el-option>
            <el-option label="未报到" :value="7"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="变更前的学籍状态">
          <el-select v-model="addStatus.oldSchoolRollStatus" placeholder="请选择学籍状态" disabled>
            <el-option label="已注册" :value="0"></el-option>
            <el-option label="未注册" :value="1"></el-option>
            <el-option label="注册前退学" :value="2"></el-option>
            <el-option label="注册后退学" :value="3"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="变更后的学籍状态">
          <el-select v-model="addStatus.newSchoolRollStatus" placeholder="请选择学籍状态" >
            <el-option label="已注册" :value="0"></el-option>
            <el-option label="未注册" :value="1"></el-option>
            <el-option label="注册前退学" :value="2"></el-option>
            <el-option label="注册后退学" :value="3"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="学籍变更时间">
          <el-date-picker
            v-model="addStatus.updateTime"
            type="date"
            placeholder="选择日期"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="离校日期">
          <el-date-picker
            v-model="addStatus.levelDate"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="结束日期">
          <el-date-picker
            v-model="addStatus.endDate"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="学籍变更原因">
          <el-input  style="width: 700px;" v-model="addStatus.changeDetail"></el-input>
        </e-desc-item>
      </e-desc>
      <div slot="footer">
        <el-button @click="cancelDialog">取消</el-button>
        <el-button type="primary" @click="handleSubmit(addStatus,true)">确定</el-button>
      </div>
    </el-dialog>
  </div>

</template>


<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      dialogVisible: false,
      formLabelWidth: '50px',
      baseInfo: {
      },
      addStatus: {
        stuId: null,
        oldCurrentStatus: '',
        newCurrentStatus: '',
        oldSchoolRollStatus: '',
        newSchoolRollStatus: '',
        updateTime: '',
        levelDate: '',
        endDate: '',
        changeDetail: ''
      },
      activeCollapse: ['1'],
      changeList: [],
      addTabs: {
        title: '+',
        name: '+',
        closeable: false
      }
    }
  },
  created () {
    this.baseInfo = JSON.parse(decodeURIComponent(this.$route.query.stuBaseInfoEntity))
  },
  mounted () {
    this.getData()
  },
  methods: {
    getCurrentStatusText (status) {
      switch (status) {
        case 0:
          return '在校'
        case 1:
          return '实习'
        case 2:
          return '就业'
        case 3:
          return '请假'
        case 4:
          return '休学'
        case 5:
          return '退学'
        case 6:
          return '毕业'
        case 7:
          return '未报到'
        default:
          return ''
      }
    },
    getSchoolStatusText (status) {
      switch (status) {
        case 0:
          return '已注册'
        case 1:
          return '未注册'
        case 2:
          return '注册前退学'
        case 3:
          return '注册后退学'
        default:
          return ''
      }
    },
    addTab () {
      this.addStatus.oldCurrentStatus = this.baseInfo.currentStatus
      this.addStatus.newCurrentStatus = ''
      this.addStatus.oldSchoolRollStatus = this.baseInfo.schoolRollStatus
      this.addStatus.newSchoolRollStatus = ''
      var date = new Date()
      this.addStatus.updateTime = date
      this.addStatus.levelDate = ''
      this.addStatus.endDate = ''
      this.addStatus.changeDetail = ''
      this.dialogVisible = true
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('stu/change/info'),
        method: 'get',
        params: this.$http.adornParams({
          'stuId': this.baseInfo.stuId
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.changeList = data.changeList
        } else {
          this.$message.error(data.method)
        }
      })
    },
    returnBack () {
      this.$router.go(-1)
    },
    cancelDialog () {
      this.dialogVisible = false
    },
    handleSubmit (val, isAdd) {
      if (isAdd) {
        val.stuId = this.baseInfo.stuId
      }
      if (isAdd && (this.addStatus.stuId === null || this.addStatus.stuId === '')) {
        this.$message.error('请返回列表重新修改')
        return
      }
      this.$confirm('确认更改状态吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('stu/change/save'),
          data: val,
          method: 'post'
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.dialogVisible = false
              }
            })
            this.getData()
          } else {
            this.$message.error('操作失败，请联系管理员')
          }
        })
      }).catch(() => {
        this.$message.success('已取消')
      })
    }
  }
}
</script>
<style scoped>

.button-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 10vh;
}

.custom-button {
  padding: 10px 20px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.custom-button:hover {
  background-color: #45a049;
}

.custom-button:active {
  background-color: #3e8e41;
}
</style>

<template>
  <div>
    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
      <e-desc-item label="学号" >{{info.baseInfo.schoolNumber}}</e-desc-item>
      <e-desc-item label="姓名" >{{info.baseInfo.stuName}}</e-desc-item>
      <e-desc-item label="出生年月">{{ info.  baseInfo.birthday }}</e-desc-item>
      <e-desc-item label="性别">{{ info.baseInfo.sex }}</e-desc-item>
      <e-desc-item label="院校">{{ info.baseInfo.academyName }}</e-desc-item>
      <e-desc-item label="年级">{{ info.baseInfo.gradeName }}</e-desc-item>
      <e-desc-item label="专业">{{info.baseInfo.majorName }}</e-desc-item>
      <e-desc-item label="班级">{{ info.baseInfo.className }}</e-desc-item>
      <e-desc-item label="班型">{{ info.baseInfo.classType === 1?'就业':'升学'}}</e-desc-item>
      <e-desc-item label="班主任" >{{ info.baseInfo.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话" >{{ info.baseInfo.headTeacherPhone }}</e-desc-item>
    </e-desc>


    <el-collapse  v-model="necessary" >
      <el-collapse-item name="1" >
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">必考证书</span>
        </template>
        <el-tabs type="border-card" key>
          <el-tab-pane v-for="(item, index) in info.necessaryList" :key="index" :label="`证书${index+1}`">
            <e-desc margin='0 12px' label-width='140px' column="2" >
              <e-desc-item label="证书名称"  icon="*">
                <el-select v-model="item.certificateName" placeholder="请选择证书名称"  >
                  <el-option label="茶艺证" :value="茶艺证" key="茶艺证"></el-option>
                  <el-option label="礼仪证" :value="礼仪证" key="礼仪证"></el-option>
                  <el-option label="铁路客服证" :value="铁路客服证" key="铁路客服证"></el-option>
                  <el-option label="急救证" :value="急救证" key="急救证"></el-option>
                  <el-option label="普通话证" :value="普通话证" key="普通话证"></el-option>
                  <el-option label="教师资格证" :value="教师资格证" key="教师资格证"></el-option>
                  <el-option label="保育员证" :value="保育员证" key="保育员证"></el-option>
                  <el-option label="其他证书" :value="其他证书" key="其他证书"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="考证时间" >
                <el-date-picker
                  v-model="item.examTime"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="考证状态" icon="*">
                <el-select v-model="item.status" placeholder="请选择考证状态"  >
                  <el-option label="已考" :value="1"></el-option>
                  <el-option label="未考" :value="0"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item  label="发证日期">
                <el-date-picker
                  v-model="item.issueTime"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="错补证信息">
                <el-select v-model="item.information" placeholder="请选择错补证信息"  >
                  <el-option label="无" :value="0" ></el-option>
                  <el-option label="已补发" :value="1"></el-option>
                  <el-option label="未补发" :value="2"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="备注">
                <el-input
                  v-model="item.remarks"
                  clearable>
                </el-input>
              </e-desc-item>
              <e-desc-item label="操作">
                <el-button  type="primary" @click="handleSubmit(item,false)" >操作</el-button>
                <el-button  type="primary" @click="handleDelete(item.id)" >删除</el-button>
              </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane :name="addTabs.name" :closable = "addTabs.closeable">
            <div style="width: 100%; height: 100%;" slot="label"  @click="addTab(1)">{{addTabs.title}}</div>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="option" >
      <el-collapse-item name="1" >
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">选考证书</span>
        </template>
        <el-tabs type="border-card" key>
          <el-tab-pane v-for="(item, index) in info.optionList" :key="index" :label="`证书${index+1}`">
            <e-desc margin='0 12px' label-width='140px' column="2" >
              <e-desc-item label="证书名称"  icon="*">
                <el-select v-model="item.certificateName" placeholder="请选择证书名称"  >
                  <el-option label="茶艺证" :value="茶艺证" key="茶艺证"></el-option>
                  <el-option label="礼仪证" :value="礼仪证" key="礼仪证"></el-option>
                  <el-option label="铁路客服证" :value="铁路客服证" key="铁路客服证"></el-option>
                  <el-option label="急救证" :value="急救证" key="急救证"></el-option>
                  <el-option label="普通话证" :value="普通话证" key="普通话证"></el-option>
                  <el-option label="教师资格证" :value="教师资格证" key="教师资格证"></el-option>
                  <el-option label="保育员证" :value="保育员证" key="保育员证"></el-option>
                  <el-option label="其他证书" :value="其他证书" key="其他证书"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="考证时间" >
                <el-date-picker
                  v-model="item.examTime"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="考证状态" icon="*">
                <el-select v-model="item.status" placeholder="请选择考证状态"  >
                  <el-option label="已考" :value="1"></el-option>
                  <el-option label="未考" :value="0"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item  label="发证日期">
                <el-date-picker
                  v-model="item.issueTime"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="错补证信息">
                <el-select v-model="item.information" placeholder="请选择错补证信息"  >
                  <el-option label="无" :value="0" ></el-option>
                  <el-option label="已补发" :value="1"></el-option>
                  <el-option label="未补发" :value="2"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="备注">
                <el-input
                  v-model="item.remarks"
                  clearable>
                </el-input>
              </e-desc-item>

              <e-desc-item label="操作">
                <el-button  type="primary" @click="handleSubmit(item,false)" >操作</el-button>
                <el-button  type="primary" @click="handleDelete(item.id)" >删除</el-button>
              </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane :name="addTabs.name" :closable = "addTabs.closeable">
            <div style="width: 100%; height: 100%;" slot="label"  @click="addTab(0)">{{addTabs.title}}</div>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>
    <el-dialog :visible.sync="dialogVisible" title="新增证书记录"   :modal="false" >
      <e-desc margin='0 12px' label-width='160px' column="2">
        <e-desc-item label="证书名称" icon="*" >
          <el-select v-model="addCertificate.certificateName" placeholder="请选择证书名称"  >
            <el-option label="茶艺证" value="茶艺证" key="茶艺证"></el-option>
            <el-option label="礼仪证" value="礼仪证" key="礼仪证"></el-option>
            <el-option label="铁路客服证" value="铁路客服证" key="铁路客服证"></el-option>
            <el-option label="急救证" value="急救证" key="急救证"></el-option>
            <el-option label="普通话证" value="普通话证" key="普通话证"></el-option>
            <el-option label="教师资格证" value="教师资格证" key="教师资格证"></el-option>
            <el-option label="保育员证" value="保育员证" key="保育员证"></el-option>
            <el-option label="其他证书" value="其他证书" key="其他证书"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="证书类型">
          <el-select v-model="addCertificate.type" placeholder="请选择证书类型"  disabled>
            <el-option label="必考" :value="1" :key="1"></el-option>
            <el-option label="选考" :value="0" :key="1"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="考证时间" >
          <el-date-picker
            v-model="addCertificate.examTime"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="考证状态" icon="*">
          <el-select v-model="addCertificate.status" placeholder="请选择考证状态"  >
            <el-option label="已考" :value="1" :key="1"></el-option>
            <el-option label="未考" :value="0" :key="0"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item  label="发证日期">
          <el-date-picker
            v-model="addCertificate.issueTime"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="错补证信息">
          <el-select v-model="addCertificate.information" placeholder="请选择错补证信息"  >
            <el-option label="无" :value="0" :key="0"></el-option>
            <el-option label="已补发" :value="1" :key="1"></el-option>
            <el-option label="未补发" :value="2" :key="2"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="备注">
          <el-input
            v-model="addCertificate.remarks"
            clearable>
          </el-input>
        </e-desc-item>
      </e-desc>
      <div slot="footer">
        <el-button @click="cancelDialog">取消</el-button>
        <el-button type="primary" @click="handleSubmit(addCertificate,true)">确定</el-button>
      </div>

    </el-dialog>

<!--        <div class="footer-container">-->
<!--          <el-button type="primary" class="custom-button" @click="returnBack">返回</el-button>-->
<!--        </div>-->
  </div>
</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'

export default {
  name: 'certificateEdit',
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      dialogVisible: false,
      option: ['1'],
      necessary: ['1'],
      stuId: -1,
      addTabs: {
        title: '+',
        name: '+',
        closeable: false
      },
      info: {
        necessaryList: [],
        optionList: [],
        baseInfo: {
        }
      },
      addCertificate: {
        certificateName: '',
        information: '',
        remarks: '',
        type: -1,
        status: -1,
        examTime: '',
        issueTime: ''
      }
    }
  },
  created () {
    //this.stuId = this.$route.params.stuId
    this.stuId = this.$route.query.stuId

  },
  mounted () {
    this.getData()
  },
  methods: {
    cancelDialog () {
      this.dialogVisible = false
    },
    returnBack () {
      this.$router.go(-1)
    },
    handleDelete (id) {
      if (id === null || id < 0) {
        this.$message.error('删除失败')
      }
      var ids = [id]
      this.$confirm(`确定对该学生证书进行删除操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('edu/certificate/delete'),
          method: 'post',
          data: this.$http.adornData(ids, false)
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getData()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },
    handleSubmit (val, isAdd) {
      if (isAdd) {
        val.stuId = this.stuId
      }
      if (isAdd && (this.addCertificate.stuId === null || this.addCertificate.stuId === '')) {
        this.$message.error('请返回列表重新修改')
        return
      }
      if (this.addCertificate.certificateName === null || this.addCertificate.certificateName === '') {
        this.$message.error('证书名称为空')
        return
      }
      if (this.addCertificate.type === null || this.addCertificate.type === '') {
        this.$message.error('考证状态为空')
        return
      }
      this.$confirm('确认编辑/新增证书吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/edu/certificate/save'),
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
    },
    addTab (val) {
      this.addCertificate.certificateName = ''
      this.addCertificate.type = val
      this.addCertificate.examTime = ''
      this.addCertificate.remarks = ''
      this.addCertificate.issueTime = ''
      this.addCertificate.information = 0
      this.addCertificate.status = -1
      this.dialogVisible = true
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('edu/certificate/info'),
        method: 'get',
        params: this.$http.adornParams({
          'id': this.stuId
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.info = data.info
        } else {
          this.$message.error(data.method)
        }
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

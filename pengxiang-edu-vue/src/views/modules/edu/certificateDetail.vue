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
            <e-desc-item label="证书名称" >{{ item.certificateName}}</e-desc-item>
            <e-desc-item label="考证时间" >{{item.examTime}}</e-desc-item>
            <e-desc-item label="考证状态">{{ item.status === 1 ? '已考': item.status === 0 ? '未考':'无' }}</e-desc-item>
            <e-desc-item  label="发证日期">{{ item.issueTime }}</e-desc-item>
            <e-desc-item label="错补证信息">{{ item.information === 2 ? '2未补发' :item.information === 1?'1已补发':'无'}}</e-desc-item>
            <e-desc-item label="备注">{{ item.remarks}}</e-desc-item>
          </e-desc>
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
            <e-desc-item label="证书名称" >{{ item.certificateName}}</e-desc-item>
            <e-desc-item label="考证时间" >{{item.examTime}}</e-desc-item>
            <e-desc-item label="考证状态">{{ item.status === 1 ? '已考': item.status === 0 ? '未考':'无' }}</e-desc-item>
            <e-desc-item  label="发证日期">{{ item.issueTime }}</e-desc-item>
            <e-desc-item label="错补证信息">{{ item.information === 2 ? '2未补发' :item.information === 1?'1已补发':'无'}}</e-desc-item>
            <e-desc-item label="备注">{{ item.remarks}}</e-desc-item>
          </e-desc>
        </el-tab-pane>
      </el-tabs>

    </el-collapse-item>
  </el-collapse>

<!--  <div class="button-container">
    <button class="custom-button" @click="returnBack">返回</button>
  </div>-->
</div>
</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'

export default {
  name: 'certificateDetail',
  components: {
    EDesc, EDescItem
  },

  data () {
    return {
      option: ['1'],
      necessary: ['1'],
      stuId: -1,
      info: {
        necessaryList: [],
        optionList: [],
        baseInfo: {
        }
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
    returnBack () {
      this.$router.go(-1)
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('/edu/certificate/info'),
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

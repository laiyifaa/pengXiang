<template>
<div>
  <e-desc margin='0 12px' label-width='130px' title="学生基本信息" >
    <e-desc-item label="学号" > <el-input v-model="perInfo.wx" ></el-input></e-desc-item>
    <e-desc-item label="姓名" ><el-input v-model="perInfo.name" ></el-input></e-desc-item>
    <e-desc-item label="身份证号码"><el-input v-model="perInfo.perNum" ></el-input></e-desc-item>
    <e-desc-item  label="年龄"><el-input v-model="perInfo.age" ></el-input></e-desc-item>
    <e-desc-item label="性别"><el-input v-model="perInfo.sex" ></el-input></e-desc-item>
    <e-desc-item label="民族"><el-input v-model="perInfo.race" ></el-input></e-desc-item>
    <e-desc-item label="籍贯"><el-input v-model="perInfo.place" ></el-input></e-desc-item>
    <e-desc-item label="户口性质"><el-input v-model="perInfo.house" ></el-input></e-desc-item>
    <e-desc-item label="政治面貌"><el-input v-model="perInfo.politic" ></el-input></e-desc-item>
    <e-desc-item label="联系电话"><el-input v-model="perInfo.phone" ></el-input></e-desc-item>
    <e-desc-item label="系部"><el-input v-model="perInfo.department" ></el-input></e-desc-item>
    <e-desc-item label="专业"><el-input v-model="perInfo.major" ></el-input></e-desc-item>
    <e-desc-item label="班型"><el-input v-model="perInfo.classType" ></el-input></e-desc-item>
    <e-desc-item label="班级"><el-input v-model="perInfo.class" ></el-input></e-desc-item>
    <e-desc-item label="班主任"><el-input v-model="perInfo.hobby" ></el-input></e-desc-item>
    <e-desc-item label="班主任电话"><el-input v-model="perInfo.teacherPhone" ></el-input></e-desc-item>
    <e-desc-item label="电子邮件"><el-input v-model="perInfo.email" ></el-input></e-desc-item>
  </e-desc>

  <el-collapse  @change="handleChange" v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业详情</span>
      </template>
      <e-desc margin='0 12px' label-width='100px' >
        <e-desc-item label="离校日期" ><el-input v-model="empInfo.leaveDate"/></e-desc-item>
        <e-desc-item label="离校原因" ><el-input v-model="empInfo.leaveReason"/></e-desc-item>
        <e-desc-item label="就业单位"><el-input v-model="empInfo.empcpl"/></e-desc-item>
        <e-desc-item  label=" 就业岗位"><el-input v-model="empInfo.empjob"/></e-desc-item>
        <e-desc-item label="试用期薪酬"><el-input v-model="empInfo.befmon"/></e-desc-item>
        <e-desc-item label="转正薪酬"><el-input v-model="empInfo.aftmon"/></e-desc-item>
        <e-desc-item label="岗位负责人"><el-input v-model="empInfo.resp"/></e-desc-item>
      </e-desc>
    </el-collapse-item>
  </el-collapse>

  <el-collapse v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业回访</span>
      </template>
      <div style="margin-bottom:10px;padding-left: 10px">
        <el-button
          size="middle"
          @click="addTab(editableTabsValue)">
          添加
        </el-button>
      </div>
      <el-tabs  v-model="selectedTab" type="card" closable @tab-remove="confirmRemoveTab" :active-name="selectedTab">
        <el-tab-pane  v-for="(item, index) in editableTabs"
                      :key="item.name"
                      :name="item.name"
                      :label="item.title">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="回访日期" ><el-input v-model="callBack.prop1"/></e-desc-item>
            <e-desc-item label="是否在岗" ><el-input v-model="callBack.prop2"/></e-desc-item>
            <e-desc-item label="是否对岗位满意"><el-input v-model="callBack.prop3"/></e-desc-item>
            <e-desc-item  label="学生就业工作情况"><el-input v-model="callBack.prop4"/></e-desc-item>
            <e-desc-item label="离职原因"><el-input v-model="callBack.prop5"/></e-desc-item>
            <e-desc-item label="是否需要二次就业"><el-input v-model="callBack.prop6"/></e-desc-item>
            <e-desc-item label="二次就业分配时间"><el-input v-model="callBack.prop7"/></e-desc-item>
            <e-desc-item label="就业单位" ><el-input v-model="callBack.prop8"/></e-desc-item>
            <e-desc-item label="就业岗位" ><el-input v-model="callBack.prop9"/></e-desc-item>
            <e-desc-item label="试用期限"><el-input v-model="callBack.prop10"/></e-desc-item>
            <e-desc-item  label="试用期薪酬"><el-input v-model="callBack.prop11"/></e-desc-item>
            <e-desc-item label="转正薪酬"><el-input v-model="callBack.prop12"/></e-desc-item>
            <e-desc-item label="岗位负责人"><el-input v-model="callBack.prop13"/></e-desc-item>
          </e-desc>
        </el-tab-pane>
      </el-tabs>
    </el-collapse-item>
  </el-collapse>
  <div class="footer-container">
    <el-button type="primary" @click="handleSubmit">提交</el-button>
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
      selectedTab: '2',
      activeCollapse: ['1'],
      tabIndex: 2,
      perInfo: {
        name: 'Jerry',
        age: 26,
        sex: '男',
        perNum: '362425200002063611',
        race: '汉',
        politic: '党员',
        department: '计算机系',
        classType: '就业班',
        class: '计嵌192',
        house: '农村',
        place: '江西吉安',
        major: '铁路专业',
        address: '四川省成都市',
        hobby: '朱博伦',
        phone: 33030419980953011,
        wx: '202230603042',
        qq: 332983810,
        teacherPhone: '15979636744',
        email: '@qq.com'
      },
      empInfo: {
        leaveDate: '2023-07-02',
        leaveReason: '毕业',
        empcpl: '字节跳动',
        empjob: '开发',
        befmon: 7000,
        aftmon: 10000,
        resp: '朱博伦'
      },
      callBack: {
        prop1: '2023-1-1',
        prop2: '是',
        prop3: '是',
        prop4: '已就业',
        prop5: '无',
        prop6: '不需要',
        prop7: '---',
        prop8: '字节跳动',
        prop9: '开发',
        prop10: '2024-06',
        prop11: '7000',
        prop12: '10000',
        prop13: '王德发'
      },
      editableTabs: [
        {
          title: '124',
          name: '1',
          content: this.callBack
        }, {
          title: '第二次回访记录',
          name: '2',
          content: this.callBack
        }, {
          title: '+',
          name: '3',
          content: this.callBack
        }
      ]
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    },
    handleSubmit () {
      // 提交操作逻辑
      // ...
    },
    addTab (targetName) {
      this.editableTabs.push({
        title: '新的回访界页',
        name: ++this.tabIndex,
        content: 'New Tab content'})
      console.log(this.editableTabs)
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

<template>
  <div >
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
    <el-collapse >
      <el-collapse-item >
        <template slot="title">
          <span style="text-align:center; font-weight: bold;padding-left: 10px; font-size: 18px;">实习详情</span>
        </template>
        <div style="margin-bottom:10px;padding-left: 10px">
          <el-button
            size="middle"
            @click="addTab(editableTabsValue)">
            添加
          </el-button>
        </div>
        <el-tabs  type="card" closable @tab-remove="confirmRemoveTab">
          <el-tab-pane  v-for="(item, index) in editableTabs"
                        :key="item.name"
                        :name="item.name"
                        :label="item.title">
            <e-desc margin='0 0px' label-width='140px' column="3">
              <e-desc-item label="实习类别" ><el-input v-model="empInfo.pro1" ></el-input></e-desc-item>
              <e-desc-item label="实习单位" ><el-input v-model="empInfo.pro2" ></el-input></e-desc-item>
              <e-desc-item label="实习报酬"><el-input v-model="empInfo.pro3" ></el-input></e-desc-item>
              <e-desc-item  label="实习岗位"><el-input v-model="empInfo.pro4" ></el-input></e-desc-item>
              <e-desc-item label="实习离校日期"><el-input v-model="empInfo.pro5" ></el-input></e-desc-item>
              <e-desc-item label="预计实习结束日期"><el-input v-model="empInfo.pro6" ></el-input></e-desc-item>
              <e-desc-item label="实际实习结束日期"><el-input v-model="empInfo.pro7" ></el-input></e-desc-item>
              <e-desc-item label="学生实习鉴定结果" ><el-input v-model="empInfo.pro8" ></el-input></e-desc-item>
              <e-desc-item label="是否对岗位满意" ><el-input v-model="empInfo.pro9" ></el-input></e-desc-item>
              <e-desc-item label="带队教师"><el-input width="100px" v-model="empInfo.pro10" ></el-input></e-desc-item>
              <e-desc-item  label="带队教师电话"><el-input v-model="empInfo.pro11" ></el-input></e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>
    <div class="footer-container">
      <el-button type="primary" @click="handleSubmit">提交</el-button>
    </div>
  </div>
</template>

<script>
import EDesc from "./EDesc";
import EDescItem from "./EDescItem";
export default {
  name: "workModify",
  components:{
    EDesc, EDescItem
  },
  data(){
    return{
      tabIndex:2,
      empInfo: {
        pro1: '短期实习',
        pro2: '字节跳动',
        pro3: '7000',
        pro4: '开发',
        pro5: '2023-02-06',
        pro6: '2023-08-06',
        pro7: '2023-08-06',
        pro8:'合格',
        pro9:'满意',
        pro10:'王德发',
        pro11:'15715166898'
      },
      editableTabsValue: '2',
      editableTabs:[
        {
          title: '第一阶段实习',
          name: '1',
          content: this.empInfo
        }, {
          title: '第二阶段实习',
          name: '2',
          content: this.empInfo
        }
      ],
      perInfo: {
        name: 'Jerry',
        age: 26,
        sex: '男',
        perNum:'362425200002063611',
        race:'汉',
        politic:'党员',
        department:'计算机系',
        classType:'就业班',
        class:'计嵌192',
        house:'农村',
        place: '江西吉安',
        major: '铁路专业',
        address: '四川省成都市',
        hobby: '朱博伦',
        phone: 33030419980953011,
        wx: '202230603042',
        qq: 332983810,
        teacherPhone:'15979636744',
        email:'@qq.com'
      },
    }
  },
 methods: {
   handleSubmit() {
     // 提交操作逻辑
     // ...
   },
   addTab(targetName) {
     let newTabName = ++this.tabIndex ;
     this.editableTabs.push({
         title: '新的实习界页',
         name: newTabName,
         content: 'New Tab content'})
     console.log(this.editableTabs)
   },
   confirmRemoveTab(targetName) {
     this.$confirm('确定要删除该标签页吗？', '确认删除', {
       confirmButtonText: '确定',
       cancelButtonText: '取消',
       type: 'warning'
     }).then(() => {
       this.removeTab(targetName);
     }).catch(() => {
       // 用户取消删除操作
     });
   },
   removeTab(targetName) {
     const tabs = this.editableTabs;
     const index = tabs.findIndex(tab => tab.name === targetName);
     if (index !== -1) {
       tabs.splice(index, 1);
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

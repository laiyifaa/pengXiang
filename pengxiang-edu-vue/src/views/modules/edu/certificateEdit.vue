<template>
  <div>
    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
      <e-desc-item label="学号" >{{perInfo.wx}}</e-desc-item>
      <e-desc-item label="姓名" >{{perInfo.name}}</e-desc-item>
      <e-desc-item label="身份证号码">{{ perInfo.phone }}</e-desc-item>
      <e-desc-item  label="年龄">{{ perInfo.age }}</e-desc-item>
      <e-desc-item label="性别">{{ perInfo.sex }}</e-desc-item>
      <e-desc-item label="民族">汉族</e-desc-item>
      <e-desc-item label="籍贯">浙江省杭州市</e-desc-item>
      <e-desc-item label="户口性质">农村</e-desc-item>
      <e-desc-item label="政治面貌">党员</e-desc-item>
      <e-desc-item label="联系电话">18333665566</e-desc-item>
      <e-desc-item label="系部">计算机系</e-desc-item>
      <e-desc-item label="专业">{{ perInfo.major }}</e-desc-item>
      <e-desc-item label="班型">就业班</e-desc-item>
      <e-desc-item label="班级">专业1班</e-desc-item>
      <e-desc-item label="班主任">{{ perInfo.hobby }}</e-desc-item>
      <e-desc-item label="班主任电话">18333665566</e-desc-item>
      <e-desc-item label="电子邮件">@.com</e-desc-item>
    </e-desc>

    <el-collapse  v-model="activeCollapse" >
      <el-collapse-item name="1" >
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">必考证书</span>
        </template>
<!--        <div style="margin-bottom:10px;padding-left: 10px">-->
<!--          <el-button-->
<!--            size="middle"-->
<!--            @click="addTab(editableTabsValue)">-->
<!--            添加-->
<!--          </el-button>-->
<!--        </div>-->
        <el-tabs v-model="selectedTab"  type="card" @tab-remove="confirmRemoveTab" :active-name="selectedTab">
          <el-tab-pane  v-for="(item, index) in editableTabs"
                        :key="item.name"
                        :name="item.name"
                        :label="item.title"
                        closable>
            <e-desc margin='0 0px' label-width='140px' column="3">
              <e-desc-item label="证书名称" ><el-input v-model="empInfo.pro1" ></el-input></e-desc-item>
              <e-desc-item label="考证时间" ><el-input v-model="empInfo.pro2" ></el-input></e-desc-item>
              <e-desc-item label="考证状态"><el-input v-model="empInfo.pro3" ></el-input></e-desc-item>
              <e-desc-item  label="发证日期"><el-input v-model="empInfo.pro4" ></el-input></e-desc-item>
              <e-desc-item label="错补证信息"><el-input v-model="empInfo.pro5" ></el-input></e-desc-item>
              <e-desc-item label="备注"><el-input v-model="empInfo.pro6" ></el-input></e-desc-item>

            </e-desc>
          </el-tab-pane>
          <el-tab-pane key="add" name="add" >
            <span slot="label" style="padding: 8px;font-size:20px;font-weight:bold;"
                  @click="addTab(editableTabsValue)">
              +
            </span>
          </el-tab-pane>

        </el-tabs>
      </el-collapse-item>
    </el-collapse>


        <el-collapse  v-model="activeCollapse2" >
          <el-collapse-item name="1" >
            <template slot="title">
              <span style="text-align: center; font-weight: bold; font-size: 16px;">选考证书</span>
            </template>
<!--            <div style="margin-bottom:10px;padding-left: 10px">-->
<!--              <el-button-->
<!--                size="middle"-->
<!--                @click="addTab2(editableTabsValue2)">-->
<!--                添加-->
<!--              </el-button>-->
<!--            </div>-->
            <el-tabs v-model="selectedTab2"  type="card" @tab-remove="confirmRemoveTab2" :active-name="selectedTab2">
              <el-tab-pane  v-for="(item, index) in editableTabs2"
                            :key="item.name"
                            :name="item.name"
                            :label="item.title"
                            closable>
                <e-desc margin='0 0px' label-width='140px' column="3">
                  <e-desc-item label="证书名称" ><el-input v-model="empInfo2.pro1" ></el-input></e-desc-item>
                  <e-desc-item label="考证时间" ><el-input v-model="empInfo2.pro2" ></el-input></e-desc-item>
                  <e-desc-item label="考证状态"><el-input v-model="empInfo2.pro3" ></el-input></e-desc-item>
                  <e-desc-item  label="发证日期"><el-input v-model="empInfo2.pro4" ></el-input></e-desc-item>
                  <e-desc-item label="错补证信息"><el-input v-model="empInfo2.pro5" ></el-input></e-desc-item>
                  <e-desc-item label="备注"><el-input v-model="empInfo2.pro6" ></el-input></e-desc-item>
                </e-desc>
              </el-tab-pane>
              <el-tab-pane key="add2" name="add2" >
              <span slot="label" style="padding: 8px;font-size:20px;font-weight:bold;"
                    @click="addTab2(editableTabsValue2)">
                +
              </span>
              </el-tab-pane>
            </el-tabs>
          </el-collapse-item>
        </el-collapse>
        <div class="footer-container">
          <el-button type="primary" class="custom-button" @click="returnBack">返回</el-button>
        </div>
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
      selectedTab: '1',
      activeCollapse: '1',
      tabIndex: '2',
      empInfo: {
        pro1: '计算机一级',
        pro2: '2023-02-06',
        pro3: '/',
        pro4: '2023-08-06',
        pro5: '无',
        pro6: '无'
      },
      selectedTab2: '1',
      activeCollapse2: '1',
      tabIndex2: '2',
      empInfo2: {
        pro1: '计算机二级',
        pro2: '2023-03-06',
        pro3: '/',
        pro4: '2023-09-06',
        pro5: '无',
        pro6: '无'
      },
      editableTabsValue: '1',
      editableTabs: [
        {
          title: '证书一',
          name: '1',
          content: this.empInfo
        }, {
          title: '证书二',
          name: '2',
          content: this.empInfo
        }
      ],
      editableTabsValue2: '1',
      editableTabs2: [
        {
          title: '证书三',
          name: '1',
          content: this.empInfo2
        }, {
          title: '证书四',
          name: '2',
          content: this.empInfo2
        }
      ],
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
      }
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
      let newTabName = ++this.tabIndex
      this.editableTabs.push({
        title: '新的证书',
        name: newTabName,
        content: 'New Tab content'})
      console.log(this.editableTabs)
    },
    addTab2 (targetName) {
      let newTabName = ++this.tabIndex2
      this.editableTabs2.push({
        title: '新的证书',
        name: newTabName,
        content: 'New Tab content'})
      console.log(this.editableTabs2)
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
    confirmRemoveTab2 (targetName) {
      this.$confirm('确定要删除该标签页吗？', '确认删除', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.removeTab2(targetName)
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
    },
    removeTab2 (targetName) {
      const tabs = this.editableTabs2
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

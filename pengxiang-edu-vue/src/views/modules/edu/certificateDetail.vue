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
      <el-tabs type="border-card" >
        <el-tab-pane label="证书一">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="证书名称" >{{ empInfo.pro1}}</e-desc-item>
            <e-desc-item label="考证时间" >{{empInfo.pro2}}</e-desc-item>
            <e-desc-item label="考证状态">{{ empInfo.pro3 }}</e-desc-item>
            <e-desc-item  label="发证日期">{{ empInfo.pro4 }}</e-desc-item>
            <e-desc-item label="错补证信息">{{ empInfo.pro5}}</e-desc-item>
            <e-desc-item label="备注">{{ empInfo.pro6}}</e-desc-item>
          </e-desc>
        </el-tab-pane>
        <el-tab-pane label="证书二">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="证书名称" >{{ empInfo.pro1}}</e-desc-item>
            <e-desc-item label="考证时间" >{{empInfo.pro2}}</e-desc-item>
            <e-desc-item label="考证状态">{{ empInfo.pro3 }}</e-desc-item>
            <e-desc-item  label="发证日期">{{ empInfo.pro4 }}</e-desc-item>
            <e-desc-item label="错补证信息">{{ empInfo.pro5}}</e-desc-item>
            <e-desc-item label="备注">{{ empInfo.pro6}}</e-desc-item>
          </e-desc>
        </el-tab-pane>
      </el-tabs>

    </el-collapse-item>
  </el-collapse>

  <el-collapse  v-model="activeCollapse" >
    <el-collapse-item name="1" >
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">选考证书</span>
      </template>
      <el-tabs type="border-card" >
        <el-tab-pane label="证书一">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="证书名称" >{{ empInfo.pro1}}</e-desc-item>
            <e-desc-item label="考证时间" >{{empInfo.pro2}}</e-desc-item>
            <e-desc-item label="考证状态">{{ empInfo.pro3 }}</e-desc-item>
            <e-desc-item  label="发证日期">{{ empInfo.pro4 }}</e-desc-item>
            <e-desc-item label="错补证信息">{{ empInfo.pro5}}</e-desc-item>
            <e-desc-item label="备注">{{ empInfo.pro6}}</e-desc-item>
          </e-desc>
        </el-tab-pane>
        <el-tab-pane label="证书二">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="证书名称" >{{ empInfo.pro1}}</e-desc-item>
            <e-desc-item label="考证时间" >{{empInfo.pro2}}</e-desc-item>
            <e-desc-item label="考证状态">{{ empInfo.pro3 }}</e-desc-item>
            <e-desc-item  label="发证日期">{{ empInfo.pro4 }}</e-desc-item>
            <e-desc-item label="错补证信息">{{ empInfo.pro5}}</e-desc-item>
            <e-desc-item label="备注">{{ empInfo.pro6}}</e-desc-item>
          </e-desc>
        </el-tab-pane>
      </el-tabs>

    </el-collapse-item>
  </el-collapse>





  <div class="button-container">
    <button class="custom-button" @click="returnBack">返回</button>
  </div>
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
      activeCollapse: ['1'],
      perInfo: {
        name: 'Jerry',
        age: 26,
        sex: '男',
        school: '廊坊学校',
        major: '铁路专业',
        address: '四川省成都市',
        hobby: '朱博伦',
        phone: 33030419980953011,
        wx: '202230603042',
        qq: 332983810
      },
      empInfo: {
        pro1: '计算机一级',
        pro2: '2023-02-06',
        pro3: '/',
        pro4: '2023-08-06',
        pro5: '无',
        pro6: '无'

      }
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
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

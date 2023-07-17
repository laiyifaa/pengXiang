<template>
<div>
    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
      <e-desc-item label="学号" >{{ perInfo.wx}}</e-desc-item>
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

  <el-collapse  @change="handleChange"  v-model="activeCollapse" >
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业详情</span>
      </template>
      <e-desc margin='0 12px' label-width='100px' >
        <e-desc-item label="离校日期" >{{ empInfo.leaveDate}}</e-desc-item>
        <e-desc-item label="离校原因" >{{empInfo.leaveReason}}</e-desc-item>
        <e-desc-item label="就业单位">{{ empInfo.empcpl }}</e-desc-item>
        <e-desc-item  label=" 就业岗位">{{ empInfo.empjob }}</e-desc-item>
        <e-desc-item label="试用期薪酬">{{ empInfo.befmon}}</e-desc-item>
        <e-desc-item label="转正薪酬">{{ empInfo.aftmon}}</e-desc-item>
        <e-desc-item label="岗位负责人">{{empInfo.resp}}</e-desc-item>

      </e-desc>
    </el-collapse-item>
  </el-collapse>
<!--
  <el-desc  margin='10 20px' label-width='130px' title="就业基本信息">
    <e-desc-item label="离校日期" >{{ empInfo.leaveDate}}</e-desc-item>
    <e-desc-item label="离校原因" >{{empInfo.leaveReason}}</e-desc-item>
    <e-desc-item label="就业单位">{{ empInfo.empcpl }}</e-desc-item>
    <e-desc-item  label=" 就业岗位">{{ empInfo.empjob }}</e-desc-item>
    <e-desc-item label="试用期薪酬">{{ empInfo.befmon}}</e-desc-item>
    <e-desc-item label="转正薪酬">{{ empInfo.aftmon}}</e-desc-item>
    <e-desc-item label="岗位负责人">{{empInfo.resp}}</e-desc-item>
  </el-desc>
-->
  <el-collapse  v-model="activeCollapse">
    <el-collapse-item name="1">
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">就业回访</span>
      </template>
      <el-tabs type="border-card">
        <el-tab-pane label="第一次回访">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="回访日期" >{{ callBack.prop1}}</e-desc-item>
            <e-desc-item label="是否在岗" >{{callBack.prop2}}</e-desc-item>
            <e-desc-item label="是否对岗位满意">{{callBack.prop3 }}</e-desc-item>
            <e-desc-item  label="学生就业工作情况">{{ callBack.prop4 }}</e-desc-item>
            <e-desc-item label="离职原因">{{ callBack.prop5 }}</e-desc-item>
            <e-desc-item label="是否需要二次就业">{{ callBack.prop6 }}</e-desc-item>
            <e-desc-item label="二次就业分配时间">{{callBack.prop7}}</e-desc-item>
            <e-desc-item label="就业单位" >{{ callBack.prop8 }}</e-desc-item>
            <e-desc-item label="就业岗位" >{{callBack.prop9}}</e-desc-item>
            <e-desc-item label="试用期限">{{ callBack.prop10 }}</e-desc-item>
            <e-desc-item  label="试用期薪酬">{{ callBack.prop11 }}</e-desc-item>
            <e-desc-item label="转正薪酬">{{ callBack.prop12}}</e-desc-item>
            <e-desc-item label="岗位负责人">{{ callBack.prop13}}</e-desc-item>
          </e-desc>
        </el-tab-pane>
        <el-tab-pane label="第二次回访">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="回访日期" >{{ callBack.prop1}}</e-desc-item>
            <e-desc-item label="是否在岗" >{{callBack.prop2}}</e-desc-item>
            <e-desc-item label="是否对岗位满意">{{callBack.prop3 }}</e-desc-item>
            <e-desc-item  label="学生就业工作情况">{{ callBack.prop4 }}</e-desc-item>
            <e-desc-item label="离职原因">{{ callBack.prop5 }}</e-desc-item>
            <e-desc-item label="是否需要二次就业">{{ callBack.prop6 }}</e-desc-item>
            <e-desc-item label="二次就业分配时间">{{callBack.prop7}}</e-desc-item>
            <e-desc-item label="就业单位" >{{ callBack.prop8 }}</e-desc-item>
            <e-desc-item label="就业岗位" >{{callBack.prop9}}</e-desc-item>
            <e-desc-item label="试用期限">{{ callBack.prop10 }}</e-desc-item>
            <e-desc-item  label="试用期薪酬">{{ callBack.prop11 }}</e-desc-item>
            <e-desc-item label="转正薪酬">{{ callBack.prop12}}</e-desc-item>
            <e-desc-item label="岗位负责人">{{ callBack.prop13}}</e-desc-item>
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
  name: 'employDetail',
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

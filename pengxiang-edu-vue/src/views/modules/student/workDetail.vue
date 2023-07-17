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
  <el-collapse  v-model="activeCollapse" >
    <el-collapse-item name="1" >
      <template slot="title">
        <span style="text-align: center; font-weight: bold; font-size: 16px;">实习详情</span>
      </template>
      <el-tabs type="border-card" >
        <el-tab-pane label="第一阶段实习">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="实习类别" >{{ empInfo.pro1}}</e-desc-item>
            <e-desc-item label="实习单位" >{{empInfo.pro2}}</e-desc-item>
            <e-desc-item label="实习报酬">{{ empInfo.pro3 }}</e-desc-item>
            <e-desc-item  label="实习岗位">{{ empInfo.pro4 }}</e-desc-item>
            <e-desc-item label="实习离校日期">{{ empInfo.pro5}}</e-desc-item>
            <e-desc-item label="预计实习结束日期">{{ empInfo.pro6}}</e-desc-item>
            <e-desc-item label="实际实习结束日期">{{empInfo.pro7}}</e-desc-item>
            <e-desc-item label="学生实习鉴定结果" >{{ empInfo.pro8}}</e-desc-item>
            <e-desc-item label="是否对岗位满意" >{{empInfo.pro9}}</e-desc-item>
            <e-desc-item label="带队教师">{{ empInfo.pro10 }}</e-desc-item>
            <e-desc-item  label="带队教师电话">{{ empInfo.pro11 }}</e-desc-item>
          </e-desc>
        </el-tab-pane>
        <el-tab-pane label="第一阶段实习">
          <e-desc margin='0 12px' label-width='140px' column="2" >
            <e-desc-item label="实习类别" >{{ empInfo.pro1}}</e-desc-item>
            <e-desc-item label="实习单位" >{{empInfo.pro2}}</e-desc-item>
            <e-desc-item label="实习报酬">{{ empInfo.pro3 }}</e-desc-item>
            <e-desc-item  label="实习岗位">{{ empInfo.pro4 }}</e-desc-item>
            <e-desc-item label="实习离校日期">{{ empInfo.pro5}}</e-desc-item>
            <e-desc-item label="预计实习结束日期">{{ empInfo.pro6}}</e-desc-item>
            <e-desc-item label="实际实习结束日期">{{empInfo.pro7}}</e-desc-item>
            <e-desc-item label="学生实习鉴定结果" >{{ empInfo.pro8}}</e-desc-item>
            <e-desc-item label="是否对岗位满意" >{{empInfo.pro9}}</e-desc-item>
            <e-desc-item label="带队教师">{{ empInfo.pro10 }}</e-desc-item>
            <e-desc-item  label="带队教师电话">{{ empInfo.pro11 }}</e-desc-item>
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
  name: 'workDetail',
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
        pro1: '短期实习',
        pro2: '字节跳动',
        pro3: '7000',
        pro4: '开发',
        pro5: '2023-02-06',
        pro6: '2023-08-06',
        pro7: '2023-08-06',
        pro8: '合格',
        pro9: '满意',
        pro10: '王德发',
        pro11: '15715166898'
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

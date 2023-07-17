<template>
    <div>
        <!-- 学生基本信息 -->

        <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item class="age" label="姓名" style="height: 100px">{{info.name}}</e-desc-item>
      <e-desc-item class="age" label="年龄" style="height: 100px">{{ info.age }}岁</e-desc-item>
      <e-desc-item label="性别">{{ info.sex }}</e-desc-item>
      <e-desc-item label="学校">{{ info.school }}</e-desc-item>
      <e-desc-item label="专业">{{ info.major }}</e-desc-item>
      <e-desc-item label="班主任">{{ info.hobby }}</e-desc-item>
      <e-desc-item label="宿舍楼号">2</e-desc-item>
      <e-desc-item label="房间号">132</e-desc-item>
      <e-desc-item label="床位号">2</e-desc-item>
      <e-desc-item label="入住日期">2023.6.5</e-desc-item>
      <e-desc-item label="离宿日期">2023.6.5</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item label="学号">{{ info.wx}}</e-desc-item>
      <e-desc-item label="籍贯">浙江省杭州市</e-desc-item>
      <e-desc-item label="民族">汉族</e-desc-item>
      <e-desc-item label="联系电话">18333665566</e-desc-item>
      <e-desc-item label="家庭联系人">18333665566</e-desc-item>
      <e-desc-item label="家庭住址">浙江杭州</e-desc-item>
      <e-desc-item label="家庭年总收入（元）">8000</e-desc-item>
      <e-desc-item label="家庭人均收入（元）">6000</e-desc-item>
      <e-desc-item label="家庭经济来源">务农</e-desc-item>
      <e-desc-item label="学制">4年制</e-desc-item>
      <e-desc-item label="招生季">春季</e-desc-item>
      <e-desc-item label="政治面貌">党员</e-desc-item>
      <e-desc-item label="入学日期">2022.6.1</e-desc-item>
      <e-desc-item label="注册学籍日期">2022.6.1</e-desc-item>
      <e-desc-item label="当前状态">在校</e-desc-item>
      <e-desc-item label="是否提前入学">是</e-desc-item>

    </e-desc>


       <!-- 学生欠费详情 -->
        <el-collapse v-model="money" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生欠费详情</span>
        </template>

      <e-desc margin='0 12px' label-width='120px' >

        <e-desc-item label="欠费学年度">2022年上半学年</e-desc-item>
        <e-desc-item label="欠培训费">200</e-desc-item>
        <e-desc-item label="欠服装费">20</e-desc-item>
        <e-desc-item label="欠教材费">344</e-desc-item>
        <e-desc-item label="欠住宿费">200</e-desc-item>
        <e-desc-item label="欠被褥费">100</e-desc-item>
        <e-desc-item label="欠保险费">200</e-desc-item>
        <e-desc-item label="欠公物押金费">2600</e-desc-item>
        <e-desc-item label="欠证书费">100</e-desc-item>
        <e-desc-item label="欠国防教育费">180</e-desc-item>
        <e-desc-item label="欠体检费">180</e-desc-item>
        <e-desc-item label="欠费合计">200</e-desc-item>
     </e-desc>

    </el-collapse-item>
    </el-collapse>

     <el-row style="padding: 40px;text-align: center;" >

     <el-button type="primary" @click="returnBack">返回</el-button>

     </el-row>
    </div>

  </template>


  <script>
  import EDesc from '../other/EDesc'
  import EDescItem from '../other/EDescItem'
  const cityOptions = ['学生详情', '贫困情况', '缴费信息', '评定信息', '就业信息', '实习信息']
  export default {
    components: {
      EDesc, EDescItem
    },
    data () {
      return {
        formLabelWidth: '50px',
        info: {
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
        checkAll: false,
        checkedCities: ['上海', '北京'],
        cities: cityOptions,
        isIndeterminate: true,
        activeNames: ['1'],
        f_activeNames: ['1'],
        f_workMessage: ['1'],
        f_tryWork: ['1'],
        money: ['1']
      }
    },
    methods: {
      returnBack () {
        this.$router.go(-1)
      },
      open () {
        this.$confirm('是否导出已选择的模块信息', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
          center: true
        }).then(() => {
          this.$message({
            type: 'success',
            message: '导出成功!'
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消导出'
          })
        })
      }
    }
  }
  </script>

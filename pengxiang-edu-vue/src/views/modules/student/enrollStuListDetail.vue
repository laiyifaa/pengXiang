<template>
  <div>
    <!-- 学生基本信息 -->

    <e-desc margin='0 12px' label-width='100px' title="学生基本信息">
      <e-desc-item label="姓名" style="height: 100px">{{info.name}}</e-desc-item>
      <e-desc-item label="身份证号" style="height: 100px">362326169465646</e-desc-item>
      <e-desc-item label="出生日期">1999.1202</e-desc-item>
      <e-desc-item label="性别">男</e-desc-item>
      <e-desc-item label="民族">汉</e-desc-item>
      <e-desc-item label="籍贯">浙江杭州</e-desc-item>
      <e-desc-item label="政治面貌">党员</e-desc-item>
      <e-desc-item label="联系电话">13226234646</e-desc-item>
      <e-desc-item label="入学前技能水平">2</e-desc-item>
      <e-desc-item label="入学学历">大专</e-desc-item>
      <e-desc-item label="毕业学校">理工</e-desc-item>
      <e-desc-item label="户口性质">农村</e-desc-item>
      <e-desc-item label="电子邮件">2154161@qq.com</e-desc-item>
      <e-desc-item label="证件类型">国内</e-desc-item>

    </e-desc>


    <!-- 学生招生详情 -->
    <el-collapse v-model="money" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生招生详情</span>
        </template>

        <e-desc margin='0 12px' label-width='120px' >

          <e-desc-item label="招生季">春季</e-desc-item>
          <e-desc-item label="专业">计算机</e-desc-item>
          <e-desc-item label="学制">4年制</e-desc-item>
          <e-desc-item label="招生老师">李四</e-desc-item>
          <e-desc-item label="招生老师部门">招生</e-desc-item>
          <e-desc-item label="招生老师电话">1015641365410</e-desc-item>
        </e-desc>

      </el-collapse-item>
    </el-collapse>

    <el-row style="padding: 40px;text-align: center;" >
      <router-link :to="{name:'enrollStuList'}">
        <el-button type="info" @click = "returnBack">返回</el-button>
      </router-link>
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


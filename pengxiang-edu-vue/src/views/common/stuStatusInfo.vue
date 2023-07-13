<template>
  <div>
    <e-desc margin='0 12px' label-width='120px' title="学籍状态详情">
      <e-desc-item label="姓名">{{info.name}}</e-desc-item>
      <e-desc-item label="年龄">{{ info.age }}岁</e-desc-item>
      <e-desc-item label="性别">{{ info.sex }}</e-desc-item>
      <e-desc-item label="现就读学校" >{{ info.school }}</e-desc-item>
      <e-desc-item label="现学籍学校">{{ info.school }}</e-desc-item>
      <e-desc-item label="专业">{{ info.major }}</e-desc-item>
      <e-desc-item label="系部">机电系</e-desc-item>
      <e-desc-item label="班型">就业班</e-desc-item>
      <e-desc-item label="班主任" >{{ info.hobby }}</e-desc-item>
      <e-desc-item label="班主任电话" >{{ 13085629187 }}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item label="学号">{{ info.wx}}</e-desc-item>
      <e-desc-item label="当前状态">在校</e-desc-item>
      <e-desc-item label="学籍状态">在籍在册</e-desc-item>
      <e-desc-item label="学籍变更时间">2023.07.01</e-desc-item>
      <e-desc-item label="结束日期">2023.07.03</e-desc-item>
      <e-desc-item label="学籍变更原因">请假</e-desc-item>
    </e-desc>
  </div>

</template>


<script>
import EDesc from './EDesc'
import EDescItem from './EDescItem'
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

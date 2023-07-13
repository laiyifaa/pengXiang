<template>
    <div>
        <span style="margin: 50px ;font-size: larger;font-weight: bolder;">欠费信息编辑</span>
        <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>
     <e-desc margin='0 12px' label-width='120px' >
        <e-desc-item class="age" label="姓名" >{{info.name}}</e-desc-item>
      <e-desc-item class="num" label="身份证号" >{{ info.numid }}岁</e-desc-item>
       
       <e-desc-item label="欠费学年度"> 
        <el-input
         placeholder="2020年春季"
         v-model="input"
         clearable>
        </el-input>
       </e-desc-item>
       <e-desc-item label="欠培训费">
        <el-input
         placeholder="200"
         v-model="input"
         clearable>
        </el-input>
       </e-desc-item>
       <e-desc-item label="欠服装费">
        <el-input
  placeholder="100"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
       <e-desc-item label="欠教材费">
        <el-input
  placeholder="100"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
       <e-desc-item label="欠住宿费">
        <el-input
  placeholder="100"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
       <e-desc-item label="欠被褥费"><el-input
  placeholder="50"
  v-model="input"
  clearable>
</el-input></e-desc-item>
       <e-desc-item label="欠保险费"><el-input
  placeholder="202"
  v-model="input"
  clearable>
</el-input></e-desc-item>
       <e-desc-item label="欠公物押金费"><el-input
  placeholder="111"
  v-model="input"
  clearable>
</el-input></e-desc-item>
       <e-desc-item label="欠证书费">
        <el-input
  placeholder="222"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
       <e-desc-item label="欠国防教育费">
        <el-input
  placeholder="22"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
       <e-desc-item label="欠体检费">
        <el-input
  placeholder="111"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
       <e-desc-item label="欠费合计">
        <el-input
  placeholder="111"
  v-model="input"
  clearable>
</el-input>
       </e-desc-item>
    </e-desc>


    <el-row style="padding: 50px;text-align: center;">
<router-link :to="{name:'qmoney'}"> 
  <el-button type="success" >确认</el-button>
</router-link>

<router-link :to="{name:'qmoney'}"> 
  <el-button type="info">返回</el-button>
</router-link> 
</el-row>

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
        input: '',
        formLabelWidth: '50px',
        info: {
          numid:435456576877,
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

<style>
</style>
<template>

<div>

      <e-desc margin='0 12px' label-width='100px' title="退费信息编辑">
        <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>
    <e-desc-item label="姓名" >{{info.name}}</e-desc-item>
    <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item label="学号">{{ info.wx}}</e-desc-item>
     <e-desc-item label="退费时间"> <el-input
         placeholder="2024.6.1"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费学年"><el-input
         placeholder="2023"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费金额"><el-input
         placeholder="2000"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退培训费"><el-input
         placeholder="200"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退服装费"><el-input
         placeholder="200"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退教材费"><el-input
         placeholder="2099"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退住宿费"><el-input
         placeholder="200"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退被褥费"><el-input
         placeholder="300"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退保险费"><el-input
         placeholder="200"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退公物押金"><el-input
         placeholder="2000"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退证书费"><el-input
         placeholder="20"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退国防教育费"><el-input
         placeholder="20"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退体检费"><el-input
         placeholder="2"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费账户"><el-input
         placeholder="王聪"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费账号"><el-input
         placeholder="205786878979"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费开户行"><el-input
         placeholder="中国农业银行"
         v-model="input"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="应收合计"><el-input
         placeholder="3300"
         v-model="input"
         clearable>
        </el-input></e-desc-item>

    </e-desc>
   <el-row style="padding: 50px;text-align: center;">

  <el-button type="success" @click="returnBack" >确认</el-button>


  <el-button type="info" @click = "returnBack">返回</el-button>

</el-row>
</div>

</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      imageUrl: '',
      dialogFormVisible: false,
      form: {
        account: '1',
        username: '1',
        id: '1'
      },
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
    handleChange () {

    },
    errorHandler () {
      return true
    },
    handleEdit () {
      this.dialogFormVisible = true
    },
    init (id) {

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
<style scoped>
.age{
  margin-top: 100px;
}

</style>

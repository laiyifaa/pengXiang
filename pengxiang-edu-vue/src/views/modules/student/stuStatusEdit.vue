<template>
  <div>
    <e-desc margin='0 12px' label-width='120px' title="学籍状态编辑">
      <e-desc-item label="姓名">{{info.name}}</e-desc-item>
      <e-desc-item label="年龄">{{ info.age }}岁</e-desc-item>
      <e-desc-item label="性别">{{ info.sex }}</e-desc-item>
      <e-desc-item label="现就读学校">{{ info.school }}</e-desc-item>
      <e-desc-item label="现学籍学校">{{ info.school }}</e-desc-item>
      <e-desc-item label="专业">{{ info.major }}</e-desc-item>
      <e-desc-item label="系部">机电系</e-desc-item>
      <e-desc-item label="班主任" >{{ info.hobby }}</e-desc-item>
      <e-desc-item label="班主任电话" >{{ 13085629187 }}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item label="学号">{{ info.wx}}</e-desc-item>
      <e-desc-item label="当前状态" >
        <el-select v-model="info.status" placeholder="请选择当前状态">
        <el-option label="在校" value="在校"></el-option>
        <el-option label="退学" value="退学"></el-option>
        <el-option label="实习" value="实习"></el-option>
        <el-option label="就业" value="就业"></el-option>
        <el-option label="请假" value="请假"></el-option>
        <el-option label="休学" value="休学"></el-option>
        <el-option label="毕业" value="毕业"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="学籍状态" >
        <el-select v-model="info.stuStatus" placeholder="请选择学籍状态">
          <el-option label="在册在籍" value="在册在籍"></el-option>
          <el-option label="在册不在籍" value="在册不在籍"></el-option>
          <el-option label="在籍退学" value="在籍退学"></el-option>
          <el-option label="非在册非在籍" value="非在册非在籍"></el-option>
          <el-option label="提前入学" value="提前入学"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="学籍变更时间" >
        {{ info.dateValue}}
      </e-desc-item>
      <e-desc-item label="结束日期" >
        <el-date-picker
        v-model="info.dateValue"
        type="date"
        placeholder="选择日期">
      </el-date-picker>
      </e-desc-item>
      <e-desc-item label="学籍变更原因" >
{{info.desc}}
      </e-desc-item>
    </e-desc>
    <div class="button-container">
      <button class="custom-button" @click="returnBack">返回</button>
    </div>
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
        qq: 332983810,
        status: '在校',
        stuStatus: '在册在籍',
        dateValue: '2023-07-07',
        desc: '我今天家里有事！我今天家里有事！我今天家里有事！我今天家里有事！我今天家里有事！'
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
    handleChange () {
      ;
    },
    handleEdit () {
      this.dialogFormVisible = true
    },
    open () {
      this.$confirm('此操作将修改学生数据，是否继续？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        this.$message({
          type: 'success',
          message: '修改成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消修改'
        })
      })
    },
    handleCheckAllChange (val) {
      this.checkedCities = val ? cityOptions : []
      this.isIndeterminate = false
    },
    handleCheckedCitiesChange (value) {
      let checkedCount = value.length
      this.checkAll = checkedCount === this.cities.length
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length
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

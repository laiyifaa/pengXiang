<template>
  <div>
    <el-row style="margin-top: 20px;">
      <el-col :span="9" style="text-align:left;margin-left: 20px">
        <el-button type="primary" icon="el-icon-refresh"></el-button>
        <el-button type="success" @click="deleteIf" style="background-color: lightgreen">新增</el-button>
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
        <el-button type="success" @click="deleteIf" style="background-color: red">删除</el-button>
      </el-col>
      <el-col :span="10" >
        <div style="display: flex; align-items: center; margin-left: -200px">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">

              <el-table-column
                type="selection"
                width="55">
              </el-table-column>
              <el-option label="姓名" value="name"></el-option>
              <el-option label="身份证号" value="idCard"></el-option>
              <el-option label="民族" value="ethnic"></el-option>
              <el-option label="籍贯" value="origin"></el-option>
              <el-option label="政治面貌" value="political"></el-option>
              <el-option label="班主任" value="headteacher"></el-option>
              <el-option label="专业" value="major"></el-option>
              <el-option label="班级" value="class"></el-option>
              <el-option label="班型" value="classType"></el-option>
              <el-option label="户口性质" value="account"></el-option>
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;"></el-input>
            <i class="el-icon-circle-close" type="danger" icon="el-icon-circle-close" @click="removeSearchCondition(index)" style="margin: 5px"></i>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row>
    <el-table :data="tableData"  border style="width: 100%; margin-top: 20px;">
      <el-table-column
        type="selection"
        width="50">
      </el-table-column>
      <el-table-column prop="schoolId" label="学号" width="115px"></el-table-column>
      <el-table-column prop="name" label="姓名" width="70px"></el-table-column>
      <el-table-column prop="idCard" label="身份证号" width="170px"></el-table-column>
      <el-table-column prop="birth" label="出生日期"></el-table-column>
      <el-table-column prop="sex" label="性别" width="50px"></el-table-column>
      <el-table-column prop="ethnic" label="民族" width="50px"></el-table-column>
      <el-table-column prop="origin" label="籍贯"></el-table-column>
      <el-table-column prop="political" label="政治面貌" ></el-table-column>
      <el-table-column prop="phone" label="联系电话"width="120px"></el-table-column>
      <el-table-column prop="department" label="系部"width="100px"></el-table-column>
      <el-table-column prop="major" label="专业"></el-table-column>
      <el-table-column prop="classType" label="班型"></el-table-column>
      <el-table-column prop="class" label="班级"></el-table-column>
      <el-table-column prop="headteacher" label="班主任"></el-table-column>
      <el-table-column prop="headteacherPhone" label="班主任电话" width="120px"></el-table-column>
<!--      <el-table-column prop="emil" label="电子邮件"></el-table-column>-->
      <el-table-column prop="account" label="户口性质"></el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button type="text" @click="handleDetail(scope.row)"style="margin-left: 1px">详情</el-button>
          <el-button type="text" @click="deleteIf" style="margin-left: 1px">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page="currentPage"
                   :page-sizes="[10, 20, 30, 40]"
                   :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total" style="text-align:right;margin-right: 60px"> </el-pagination>
  </div>
</template>


<script>
export default {
  mounted () {
    // 初始化时请求数据
    this.getData()
  },
  methods: {
    addSearchCondition () {
      this.searchConditions.push({
        option: '',
        value: ''
      })
      this.searchCount++
    },
    deleteIf () {
      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$message({
          type: 'success',
          message: '删除成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (row) {
      // 处理详情逻辑
      this.$router.push('student-studentDetail')
    },
    handleEdit (row) {
      // 处理修改逻辑
    },
    handleSearch () {
      console.log(this.searchConditions)
      // 处理搜索逻辑
    },
    handleImport () {
      // 处理导入逻辑
    },
    handleExport () {
      // 处理导出逻辑
    },
    handleSizeChange (size) {
      this.pageSize = size
      // 重新请求数据
      this.getData()
    },
    // 处理当前页码变化事件
    handleCurrentChange (page) {
      this.currentPage = page
      // 重新请求数据
      this.getData()
    },
    // 请求数据方法
    getData () {
      // 根据当前页码和每页显示条数发送请求获取数据

      // 更新表格数据和总条数
    }
  },
  data () {
    return {
      searchCount: 1,
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      currentPage: 1, // 当前页码
      pageSize: 10, // 每页显示条数
      total: 0, // 总条数
      searchText: '',
      tableData: [{
        schoolId: '20180302053',
        name: '张三三',
        idCard: '362425200002062231',
        birth: '1996.3.2',
        sex: '男',
        ethnic: '汉',
        origin: '浙江杭州',
        political: '党员',
        phone: '13623568336',
        department: '计算机学院',
        major: '人工智能',
        classType: '升学班',
        class: '3班',
        headteacher: '李四',
        headteacherPhone: '13655369865',
        emil: '1365444765@qq.com',
        account: '农村'
      }, {
        schoolId: '20180302053',
        name: '张三',
        idCard: '362425200002062231',
        birth: '1996.3.2',
        sex: '男',
        ethnic: '汉',
        origin: '浙江杭州',
        political: '党员',
        phone: '13623568336',
        department: '计算机学院',
        major: '人工智能',
        classType: '升学班',
        class: '3班',
        headteacher: '李四',
        headteacherPhone: '13655369865',
        emil: '1365444765@qq.com',
        account: '农村'
      }, {
        schoolId: '20180302053',
        name: '张三',
        idCard: '362425200002062231',
        birth: '1996.3.2',
        sex: '男',
        ethnic: '汉',
        origin: '浙江杭州',
        political: '党员',
        phone: '13623568336',
        department: '计算机学院',
        major: '人工智能',
        classType: '升学班',
        class: '3班',
        headteacher: '李四',
        headteacherPhone: '13655369865',
        emil: '1365444765@qq.com',
        account: '农村'
      }, {
        schoolId: '20180302053',
        name: '张三',
        idCard: '362425200002062231',
        birth: '1996.3.2',
        sex: '男',
        ethnic: '汉',
        origin: '浙江杭州',
        political: '党员',
        phone: '13623568336',
        department: '计算机学院',
        major: '人工智能',
        classType: '升学班',
        class: '3班',
        headteacher: '李四',
        headteacherPhone: '13655369865',
        emil: '1365444765@qq.com',
        account: '农村'
      }, {
        schoolId: '20180302053',
        name: '张三',
        idCard: '362425200002062231',
        birth: '1996.3.2',
        sex: '男',
        ethnic: '汉',
        origin: '浙江杭州',
        political: '党员',
        phone: '13623568336',
        department: '计算机学院',
        major: '人工智能',
        classType: '升学班',
        class: '3班',
        headteacher: '李四',
        headteacherPhone: '13655369865',
        emil: '1365444765@qq.com',
        account: '农村'
      }]
    }
  }
}
</script>
<style scoped>

</style>

<template>
  <div>
    <el-row style="margin-top: 20px;">
      <el-col :span="10" style="text-align:left;margin-left: 20px">
        <el-button type="primary" icon="el-icon-refresh"></el-button>
        <el-button type="success" @click="deleteIf" style="background-color: darkgreen" icon="el-icon-check">通过</el-button>
        <el-button type="success" @click="deleteIf" style="background-color: green">新增</el-button>
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
        <el-button type="success" @click="deleteIf" style="background-color: red">删除</el-button>
      </el-col>
      <el-col :span="10" >
        <div style="display: flex; align-items: center; margin-left: 0px">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">

              <el-table-column
                type="selection"
                width="55">
              </el-table-column>
              <el-option label="姓名" value="name"></el-option>
              <el-option label="性别" value="sex"></el-option>
              <el-option label="招生老师" value="enrollmentTeacher"></el-option>
              <el-option label="招生老师部门" value="admissionsDepartment"></el-option>
              <el-option label="招生老师电话" value="enrollmentTeacherPhone"></el-option>
              <el-option label="专业" value="major"></el-option>
              <el-option label="年级" value="grade"></el-option>
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
      <el-table-column prop="schoolId" label="序号" width="115px"></el-table-column>
      <el-table-column prop="name" label="姓名"></el-table-column>
      <el-table-column prop="sex" label="性别" width="50px"></el-table-column>
      <el-table-column prop="major" label="专业" width="50px"></el-table-column>
      <el-table-column prop="educationalSystem" label="学制"></el-table-column>
      <el-table-column prop="grade" label="年级" ></el-table-column>
      <el-table-column prop="enrollmentSeason" label="招生季"width="120px"></el-table-column>
      <el-table-column prop="enrollmentTeacher" label="招生老师"></el-table-column>
      <el-table-column prop="admissionsDepartment" label="招生老师部门"></el-table-column>
      <el-table-column prop="enrollmentTeacherPhone" label="招生老师电话"></el-table-column>
      <el-table-column prop="phone" label="联系电话"></el-table-column>
      <el-table-column prop="address" label="家庭住址"></el-table-column>
      <el-table-column label="操作" >
        <template slot-scope="scope">
          <el-button type="text" @click="handleDetail(scope.row)"style="margin-left: 1px">详情</el-button>
          <el-button type="text" @click="deleteIf" style="margin-left: 1px">删除</el-button>
          <label style="margin-left: 1px">
          <input type="checkbox" v-model="isPassed">
          </label>
          <span v-if="isPassed">已通过</span>
          <span v-else>未通过</span>
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
        });
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
      value2: true,
      searchCount: 1,
      isPassed: false,
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      currentPage: 1, // 当前页码
      pageSize: 10, // 每页显示条数
      total: 0,// 总条数
      searchText: '',
      tableData: [{
        schoolId: '20180302053',
        name: '张三',
        sex: '男',
        major: '人工智能',
        classType: '升学班',
        educationalSystem: '4年制',
        grade: '2年级',
        enrollmentSeason: '春季',
        enrollmentTeacher: '李四',
        admissionsDepartment: '学工处',
        enrollmentTeacherPhone: '13655369865',
        phone: '13655369865',
        address: '浙江省杭州市'
      }, {
        schoolId: '20180302053',
        name: '张三',
        sex: '男',
        major: '人工智能',
        classType: '升学班',
        educationalSystem: '4年制',
        grade: '2年级',
        enrollmentSeason: '春季',
        enrollmentTeacher: '李四',
        admissionsDepartment: '学工处',
        enrollmentTeacherPhone: '13655369865',
        phone: '13655369865',
        address: '浙江省杭州市'
      }, {
        schoolId: '20180302053',
        name: '张三',
        sex: '男',
        major: '人工智能',
        classType: '升学班',
        educationalSystem: '4年制',
        grade: '2年级',
        enrollmentSeason: '春季',
        enrollmentTeacher: '李四',
        admissionsDepartment: '学工处',
        enrollmentTeacherPhone: '13655369865',
        phone: '13655369865',
        address: '浙江省杭州市'
      }, {
        schoolId: '20180302053',
        name: '张三',
        sex: '男',
        major: '人工智能',
        classType: '升学班',
        educationalSystem: '4年制',
        grade: '2年级',
        enrollmentSeason: '春季',
        enrollmentTeacher: '李四',
        admissionsDepartment: '学工处',
        enrollmentTeacherPhone: '13655369865',
        phone: '13655369865',
        address: '浙江省杭州市'
      }, {
        schoolId: '20180302053',
        name: '张三',
        sex: '男',
        major: '人工智能',
        classType: '升学班',
        educationalSystem: '4年制',
        grade: '2年级',
        enrollmentSeason: '春季',
        enrollmentTeacher: '李四',
        admissionsDepartment: '学工处',
        enrollmentTeacherPhone: '13655369865',
        phone: '13655369865',
        address: '浙江省杭州市'
      }]
    }
  }
}
</script>
<style scoped>

</style>

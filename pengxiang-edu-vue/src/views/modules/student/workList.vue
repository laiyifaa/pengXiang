<template>
<div>
  <el-row style="margin-top: 20px;">
    <el-col :span="2" style="text-align:left;margin-right: 0px">
      <el-button type="success" @click="handleExport">导出</el-button>
    </el-col>
    <el-col :span="21" >
      <div style="display: flex; align-items: center;">
        <el-button type="primary" icon="el-icon-plus" style="width: 60px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询</el-button>
        <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 5px; display: flex; align-items: center; ">
          <el-select style="width: 92px;" v-model="condition.option" placeholder="条件">
            <el-option label="姓名" value="姓名"></el-option>
            <el-option label="年级" value="年级"></el-option>
            <el-option label="系部" value="系部"></el-option>
            <el-option label="专业" value="专业"></el-option>
            <el-option label="学号" value="学制"></el-option>
          </el-select>
          <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;margin-left: 5px"></el-input>
          <el-button type="danger" style=" margin-left: 5px;" icon="el-icon-delete" @click="removeSearchCondition(index) ">删除</el-button>
        </div>
        <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 2px;">搜索</el-button>
      </div>
    </el-col>
  </el-row>
<el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;">
  <el-table-column
    type="selection"
    width="50">
  </el-table-column>
  <el-table-column prop="serNum" width="50" label="序号" align="center"></el-table-column>
  <el-table-column prop="name" width="80" label="姓名" align="center"></el-table-column>
  <el-table-column prop="majorName" width="80" label="专业" align="center"></el-table-column>
  <el-table-column prop="schoolingLength" width="60" label="学制" align="center"></el-table-column>
  <el-table-column prop="gradeName" width="80" label="年级" align="center"></el-table-column>
  <el-table-column prop="deptName" width="80" label="系部" align="center"></el-table-column>
  <el-table-column prop="phone" width="120" label="联系电话" align="center"></el-table-column>
  <el-table-column prop="schoolNumber" width="120" label="学号" align="center"></el-table-column>
  <el-table-column prop="admissionDate"  width="420" label="入学日期" align="center"></el-table-column>
  <el-table-column prop="times" label="实习次数" width="100" align="center"></el-table-column>
  <el-table-column label="操作" align="center">
    <template slot-scope="scope">
      <div style="display: flex; justify-content: center;">
        <el-button type="text" @click="handleDetail(scope)">详情</el-button>
        <el-button type="text" @click="handleEdit(scope)">修改</el-button>
      </div>
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
  name: 'workList',

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
      tableData: []
    }
  },
  created () {
    this.$http({
      url: this.$http.adornUrl('/stuWork/getList'),
      method: 'get'
    }).then(response => {
      this.tableData = response.data.workDtos
      console.log(this.tableData)
    })
      .catch(error => {
        console.error(error)
      })
  },
  methods: {
    addSearchCondition () {
      this.searchConditions.push({
        option: '',
        value: ''
      })
      this.searchCount++
    },
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (scope) {
      this.$router.push({
        name: 'workDetail',
        params: {
          schoolNumber: scope.row.schoolNumber
        }
      })
    },
    handleEdit (scope) {
      this.$router.push({
        name: 'workModify',
        params: {
          schoolNumber: scope.row.schoolNumber
        }
      })
    },
    handleSearch () {
      console.log(this.searchConditions)
      // 处理搜索逻辑
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
  }
}
</script>

<style scoped>

</style>

<template>
  <div>
    <el-row style="margin-top: 20px;">
      <el-col :span="3" style="text-align:left;margin-left: 0px">
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
      </el-col>
      <el-col :span="21" >
        <div style="display: flex; align-items: center;">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-option label="姓名" value="姓名"></el-option>
              <el-option label="年级" value="年级"></el-option>
              <el-option label="系部" value="系部"></el-option>
              <el-option label="班主任" value="班主任"></el-option>
              <el-option label="专业" value="专业"></el-option>
              <el-option label="班型" value="班型"></el-option>
              <el-option label="学制" value="学制"></el-option>
              <el-option label="学号" value="学制"></el-option>
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;"></el-input>
            <el-button type="danger" icon="el-icon-delete" @click="removeSearchCondition(index)">删除</el-button>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row>
    <el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;">
      <el-table-column prop="col1" width="50" label="序号"></el-table-column>
      <el-table-column prop="col2" label="姓名"></el-table-column>
      <el-table-column prop="col3" label="专业"></el-table-column>
      <el-table-column prop="col4" label="学制"></el-table-column>
      <el-table-column prop="col5" label="年级"></el-table-column>
      <el-table-column prop="col6" label="系部"></el-table-column>
      <el-table-column prop="col7" label="班级"></el-table-column>
      <el-table-column prop="col8" label="班主任"></el-table-column>
      <el-table-column prop="col9" label="联系电话"></el-table-column>
      <el-table-column prop="col10" label="学号"></el-table-column>
      <el-table-column prop="col11" label="班主任电话"></el-table-column>
      <el-table-column prop="col12" label="就业单位"></el-table-column>
      <el-table-column prop="col13" label="就页岗位"></el-table-column>
      <el-table-column prop="col14" label="岗位负责人"></el-table-column>
      <el-table-column prop="col15" label="就业状态"></el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button type="text" @click="handleDetail">详情</el-button>
          <el-button type="text" @click="handleEdit">修改</el-button>
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
  name: 'employList',
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
        col1: '1',
        col2: '张三',
        col3: '计算机',
        col4: '四年',
        col5: '大三',
        col6: '计算机系',
        col7: '计嵌192',
        col8: '王凯彭',
        col9: '15979636744',
        col10: '205191323',
        col11: '15979636794',
        col12: '字节跳动',
        col13: '开发',
        col14: '王德发',
        col15: '已就业'
      }, {
        col1: '2',
        col2: '张三',
        col3: '计算机',
        col4: '四年',
        col5: '大三',
        col6: '计算机系',
        col7: '计嵌192',
        col8: '王凯彭',
        col9: '15979636744',
        col10: '205191323',
        col11: '15979636794',
        col12: '字节跳动',
        col13: '开发',
        col14: '王德发',
        col15: '已就业'
      }, {
        col1: '3',
        col2: '张三',
        col3: '计算机',
        col4: '四年',
        col5: '大三',
        col6: '计算机系',
        col7: '计嵌192',
        col8: '王凯彭',
        col9: '15979636744',
        col10: '205191323',
        col11: '15979636794',
        col12: '字节跳动',
        col13: '开发',
        col14: '王德发',
        col15: '已就业'
      }, {
        col1: '4',
        col2: '张三',
        col3: '计算机',
        col4: '四年',
        col5: '大三',
        col6: '计算机系',
        col7: '计嵌192',
        col8: '王凯彭',
        col9: '15979636744',
        col10: '205191323',
        col11: '15979636794',
        col12: '字节跳动',
        col13: '开发',
        col14: '王德发',
        col15: '已就业'
      }, {
        col1: '5',
        col2: '张三',
        col3: '计算机',
        col4: '四年',
        col5: '大三',
        col6: '计算机系',
        col7: '计嵌192',
        col8: '王凯彭',
        col9: '15979636744',
        col10: '205191323',
        col11: '15979636794',
        col12: '字节跳动',
        col13: '开发',
        col14: '王德发',
        col15: '已就业'
      }]
    }
  },
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
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail () {
      // 处理详情逻辑
      this.$router.push('/student-employDetail')
    },
    handleEdit () {
      this.$router.push('/student-employModify')
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
  }
}
</script>

<style scoped>

</style>

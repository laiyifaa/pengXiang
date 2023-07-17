<template>
  <div>
    <!-- <el-row style="margin-top: 20px;">
      <el-col :span="4" style="text-align:left;margin-left: 20px">
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
      </el-col>
      <el-col :span="20" >
        <div style="position: absolute;right: 30px;top:30px ;">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-option label="姓名" value="姓名"></el-option>
              <el-option label="身份证号" value="身份证号"></el-option>
              <el-option label="年级" value="年级"></el-option>
              <el-option label="入学日期" value="入学日期"></el-option>
              <el-option label="专业" value="专业"></el-option>
              <el-option label="班型" value="班型"></el-option>
              <el-option label="学制" value="学制"></el-option>
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;"></el-input>
            <el-button type="danger" icon="el-icon-delete" @click="removeSearchCondition(index)">删除</el-button>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row> -->


    <!-- 按钮 -->
    <el-row style="padding: 20px;" >
  <el-button type="primary">刷新</el-button>

  <el-button type="info">信息导入</el-button>
  <el-button type="warning">信息导出</el-button>
  <el-button  type="primary" icon="el-icon-plus"  @click="addRow()">新 增</el-button>
</el-row>
<HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>

<!-- 搜索框 -->
<el-select
    v-model="value"
    multiple
    filterable
    remote
    reserve-keyword
    placeholder="请输入关键词"
    :remote-method="remoteMethod"
    :loading="loading"
    style="position: absolute ;top: 20px;right:200px;">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
  <!-- 表格 -->
  <el-table 
   :data="tableData"  
   :header-cell-style="{'text-align':'center'}"
   :cell-style="{'text-align':'center'}"
  style="width: 100%; margin-top: 20px;">

      <el-table-column
      type="selection"
      width="50">
    </el-table-column>



    <el-table-column prop="col1" label="序号" width="50"></el-table-column>
    <el-table-column prop="col2" label="姓名" width="50"></el-table-column>
    <!-- <el-table-column prop="col3" label="身份证号"></el-table-column> -->
    <el-table-column prop="col4" label="年级" width="50"></el-table-column>
    <el-table-column prop="col5" label="招生季" width="80"></el-table-column>
    <el-table-column prop="col6" label="入学日期" width="100"></el-table-column>
    <el-table-column prop="col7" label="专业"></el-table-column>
    <!-- <el-table-column prop="col8" label="班型"></el-table-column>
    <el-table-column prop="col9" label="学制"></el-table-column> -->

    <el-table-column prop="col10" label="退费时间" width="100"></el-table-column>
    <el-table-column prop="col11" label="退费学年"></el-table-column>
    <el-table-column prop="col12" label="退费金额" width="100"></el-table-column>
   
    <el-table-column prop="col23" label="退费账户" width="100"></el-table-column>
    <el-table-column prop="col24" label="退费账号"></el-table-column>
    <el-table-column prop="col25" label="退费开户行"></el-table-column>
    <el-table-column prop="col26" label="退费合计" width="100"></el-table-column>

    <el-table-column label="操作" width="140px">
      <template slot-scope="scope">
        <!-- 编辑按钮 -->

          <el-button
            size="mini"
            type:="primary"
            @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <!-- 详情按钮 -->
          <router-link :to="{name:'remoneyDetail'}">
            <el-button
            size="mini"
            type="success"
            @click="handleDelete(scope.$index, scope.row)">详情</el-button>
            </router-link>
      </template>
    </el-table-column>
  </el-table>
    <!-- 分页 -->
    <el-pagination
  background
  layout="prev, pager, next"
  :total="1000"
  style="position: absolute;right: 200px;padding: 20px;">
</el-pagination> <!-- 分页 -->
<!--<remoney-edit v-if="showEdit" ref="edit"></remoney-edit>-->
    </div>
</template>


<script>
import RemoneyEdit from './remoneyEdit'
export default {
  components: {RemoneyEdit},
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
    handleDetail (row) {
      // 处理详情逻辑
    },
    handleEdit (row) {
      this.$router.push('finance-remoneyEdit')
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
      showEdit: false,
      showDetail: false,
      tableData: [{
        col1: '1',
        col2: '张三',
        col3: '362425200002062231',
        col4: '大一',
        col5: '春季',
        col6: '2023-9',
        col7: '计算机科学与技术',
        col8: '进阶班',
        col9: '四年制',
        col10: '2023.2.2',
        col11: '2022上半学年',
        col12: '2900',
        col13: '200',
        col14: '200',
        col15: '200',
        col16: '200',
        col17: '200',
        col18: '200',
        col19: '200',
        col20: '200',
        col21: '200',
        col22: '200',
        col23: '张三',
        col24: '37248329403939',
        col25: '中国农业银行银行',
        col26: '3800'

      }, {
        col1: '2',
        col2: '王聪',
        col3: '362425200002062231',
        col4: '大一',
        col5: '春季',
        col6: '2023-9',
        col7: '计算机科学与技术',
        col8: '进阶班',
        col9: '四年制',
        col10: '2023.2.2',
        col11: '2022上半学年',
        col12: '2900',
        col13: '200',
        col14: '200',
        col15: '200',
        col16: '200',
        col17: '200',
        col18: '200',
        col19: '200',
        col20: '200',
        col21: '200',
        col22: '200',
        col23: '张三',
        col24: '37248329403939',
        col25: '中国农业银行银行',
        col26: '3800'
      }, {
        col1: '3',
        col2: '李颖',
        col3: '362425200002062231',
        col4: '大一',
        col5: '春季',
        col6: '2023-9',
        col7: '计算机科学与技术',
        col8: '进阶班',
        col9: '四年制',
        col10: '2023.2.2',
        col11: '2022上半学年',
        col12: '2900',
        col13: '200',
        col14: '200',
        col15: '200',
        col16: '200',
        col17: '200',
        col18: '200',
        col19: '200',
        col20: '200',
        col21: '200',
        col22: '200',
        col23: '张三',
        col24: '37248329403939',
        col25: '中国农业银行银行',
        col26: '3800'
      }, {
        col1: '4',
        col2: '李亮',
        col3: '362425200002062231',
        col4: '大一',
        col5: '春季',
        col6: '2023-9',
        col7: '计算机科学与技术',
        col8: '进阶班',
        col9: '四年制',
        col10: '2023.2.2',
        col11: '2022上半学年',
        col12: '2900',
        col13: '200',
        col14: '200',
        col15: '200',
        col16: '200',
        col17: '200',
        col18: '200',
        col19: '200',
        col20: '200',
        col21: '200',
        col22: '200',
        col23: '张三',
        col24: '37248329403939',
        col25: '中国农业银行银行',
        col26: '3800'
      }, {
        col1: '5',
        col2: '赵兵',
        col3: '362425200002062231',
        col4: '大一',
        col5: '春季',
        col6: '2023-9',
        col7: '计算机科学与技术',
        col8: '进阶班',
        col9: '四年制',
        col10: '2023.2.2',
        col11: '2022上半学年',
        col12: '2900',
        col13: '200',
        col14: '200',
        col15: '200',
        col16: '200',
        col17: '200',
        col18: '200',
        col19: '200',
        col20: '200',
        col21: '200',
        col22: '200',
        col23: '张三',
        col24: '37248329403939',
        col25: '中国农业银行银行',
        col26: '3800'
      }]
    }
  }
}
</script>
<style scoped>

</style>

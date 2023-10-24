<template>
  <div>
    <el-row  :gutter="20">

      <el-col :span="3">
        <el-input
          placeholder="输入关键字进行过滤"
          style="padding-top: 20px;width:90%"
          v-model="filterText">
        </el-input>
        <el-tree
          class="filter-tree"
          style="padding-top: 20px;"
          highlight-current
          :data="treeList"
          node-key="id"
          :default-expanded-keys="[]"
          :default-checked-keys="[]"
          :props="defaultProps"
          :filter-node-method="filterNode"
          ref="tree"
          @node-click="(data, node, item)=>getDeptsByPid(data, node, item)"
        >
          <span slot-scope="{ node }" class="custom-tree-node">
            <span v-if="!filterText">{{ node.label }}</span>
            <span v-if="filterText" v-html="node.label.replace(new RegExp(filterText,'g'),`<font style='color:lightseagreen'>${filterText}</font>`)" />
        </span>


        </el-tree>
      </el-col>
      <el-col :span="21">
    <el-row style="margin-top: 20px;">
      <el-col :span="3" style="text-align:left;margin-left: 20px">
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
      </el-col>
      <el-col :span="20" >
        <div style="display: flex; align-items: center;">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-option label="姓名" value="姓名"></el-option>
              <el-option label="年级" value="年级"></el-option>
              <el-option label="退费学年" value="系部"></el-option>
              <el-option label="专业" value="专业"></el-option>
              <el-option label="退费账号" value="退费账号"></el-option>
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;"></el-input>
            <el-button type="danger" icon="el-icon-delete" @click="removeSearchCondition(index)">删除</el-button>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row>
  <!-- 表格 -->
  <el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;">
    <el-table-column
      type="selection"
      width="50">
    </el-table-column>



    <el-table-column prop="feeReturnEntity.id" label="序号" width="50" align="center"></el-table-column>
    <el-table-column prop="stuBaseInfoEntity.stuName" label="姓名" width="80" align="center"></el-table-column>

    <el-table-column prop="grade" label="年级" width="60" align="center"></el-table-column>
    <el-table-column prop="stuBaseInfoEntity.admissionSeason" label="招生季" width="80" align="center"></el-table-column>
    <el-table-column prop="stuBaseInfoEntity.admissionDate" label="入学日期" width="100" align="center"></el-table-column>
    <el-table-column prop="major" label="专业" width="90" align="center"></el-table-column>

    <el-table-column prop="realTime" label="退费时间" width="100" align="center"></el-table-column>
    <el-table-column prop="feeReturnEntity.returnSchoolYear" label="退费学年" align="center"></el-table-column>
    <el-table-column prop="feeReturnEntity.returnFeeNum" label="退费金额" width="100" align="center"></el-table-column>

    <el-table-column prop="feeReturnEntity.account" label="退费账户" width="100" align="center"></el-table-column>
    <el-table-column prop="feeReturnEntity.accountNumber" label="退费账号" align="center"></el-table-column>
    <el-table-column prop="feeReturnEntity.depositBank" label="退费开户行" align="center"></el-table-column>
    <el-table-column prop="col26" label="退费合计" width="100" align="center"></el-table-column>//什么是合计，没有这个字段

    <el-table-column label="操作" width="140px" align="center">
      <template slot-scope="scope">
        <!-- 详情按钮 -->
          <el-button
            type="text"
            @click="handleDetail(scope)">详情</el-button>


        <!-- 编辑按钮 -->

        <el-button type="text" @click="handleEdit(scope)">修改</el-button>


      </template>
    </el-table-column>
  </el-table>
    <!-- 分页 -->
    <el-pagination @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page="currentPage"
                   :page-sizes="[20, 50, 100, 200]"
                   :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total" style="text-align:right;margin-right: 60px">

    </el-pagination>
      </el-col>
    </el-row>

    </div>
</template>


<script>
import RemoneyEdit from './remoneyEdit'
export default {
  components: {RemoneyEdit},
  mounted () {
    // 初始化时请求数据
    this.getDataList()
    this.getDeptTreeList()
  },
  methods: {
    filterNode (value, data, node) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    getDeptTreeList () {
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptTreeList'),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.treeList = data.data
        }
      })
    },
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
      // 获取所点击行的学号属性
      this.selectedIdNumber = scope.row.schoolNumber
      this.$router.push({
        name: 'remoneyDetail',
        params: {
          schoolNumber: this.selectedIdNumber
        }
      })
    },
    handleEdit (scope) {
      this.selectedIdNumber = scope.row.schoolNumber
      this.$router.push({
        name: 'remoneyEdit',
        params: {
          schoolNumber: this.selectedIdNumber
        }
      })
    },
    handleSearch () {
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
      this.$http({
        url: this.$http.adornUrl('/generator/feereturn/getList'),
        method: 'get'
      }).then(response => {
        this.tableData = response.data.list
      })
        .catch(error => {
          console.error(error)
        })
    }
  },
  getDeptTreeList () {
    this.$http({
      url: this.$http.adornUrl('/generator/sysdept/getDeptTreeList'),
      method: 'get'
    }).then(({data}) => {
      if (data && data.code === 0) {
        this.treeList = data.data
      }
    })
  },
  // 获取数据列表
  getDataList () {
    this.dataListLoading = true
    this.$http({
      url: this.$http.adornUrl('/generator/feeschoolsundry/list'),
      method: 'get',
      params: this.$http.adornParams({
        'query': {
          'page': this.pageIndex,
          'limit': this.pageSize
        },
        'key': this.dataForm.key,
        'year': this.year,
        'depId': this.depId
      })
    }).then(({data}) => {
      if (data.code === 500) {
        this.$message.error(data.msg)
      }
      if (data && data.code === 0) {
        this.dataList = data.page.list
        this.totalPage = data.page.totalCount
      } else {
        this.dataList = []
        this.totalPage = 0
      }
      this.dataListLoading = false
    })
    this.getDeptTreeList()
  },
  data () {
    return {
      treeList: [],
      filterText: '',

      defaultProps: {
        children: 'children',
        label: 'label'
      },
      searchCount: 1,
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      currentPage: 1, // 当前页码
      pageSize: 20, // 每页显示条数
      total: 0, // 总条数
      searchText: '',
      showEdit: false,
      showDetail: false,
      tableData: []
    }
  }
}
</script>
<style scoped>

</style>

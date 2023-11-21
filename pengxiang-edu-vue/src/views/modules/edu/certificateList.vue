<template>
<div>
  <el-row  :gutter="20">

    <el-col :span="3">
<!--      <el-input-->
<!--        placeholder="输入关键字进行过滤"-->
<!--        style="padding-top: 20px;width:90%"-->
<!--        v-model="filterText">-->
<!--      </el-input>-->
      <el-tree
        class="filter-tree"
        style="padding-top: 80px;"
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
    <certificate-import v-if="importVisiable" ref="importDialog"></certificate-import>
<!--    <el-button type="success" @click="handleExport">导出</el-button>
    <certificate-out v-if="outVisiable" ref="outDialog"></certificate-out>-->
<!--    <el-button type="success" @click="handleImport">导入</el-button>-->
<!--    <el-button type="success" @click="handleExport">导出</el-button>-->
  </el-col>
  <el-col :span="20" >
    <div style="display: flex; align-items: center;">

      <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<2">查询条件</el-button>
      <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
        <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件" >
          <el-option label="姓名" value="stuName"></el-option>
          <el-option label="学号" value="schoolNumber"></el-option>
        </el-select>
        <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;" clearable></el-input>
        <el-button type="danger" icon="el-icon-delete" @click="removeSearchCondition(index)">删除</el-button>
      </div>
      <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
    </div>
  </el-col>
</el-row>
<el-table :data="tableData"  border style="width: 100%; margin-top: 20px;" v-loading="dataListLoading" >
  <el-table-column
    type="selection"
    width="50">
  </el-table-column>
  <el-table-column prop="stuId" width="50" label="序号" align="center" v-if="false"></el-table-column>
  <el-table-column prop="stuName" label="姓名" align="center"></el-table-column>
  <el-table-column prop="schoolNumber" label="学号" align="center"></el-table-column>
  <el-table-column prop="academyName" label="院校" align="center"></el-table-column>
  <el-table-column prop="gradeName" label="年级" align="center"></el-table-column>
  <el-table-column prop="majorName" label="专业" align="center"></el-table-column>
  <el-table-column prop="className" label="班级" align="center"></el-table-column>
  <el-table-column prop="schoolingLength" label="学制" align="center"></el-table-column>
  <el-table-column prop="necessaryCount" label="必考证书数量" align="center"></el-table-column>
  <el-table-column prop="optionCount" label="选考证书数量" align="center"></el-table-column>
  <el-table-column label="操作" align="center">
    <template slot-scope="scope">
      <el-button type="text" @click="handleDetail(scope.row.stuId)">详情</el-button>
      <el-button type="text" @click="handleEdit(scope.row.stuId)">修改</el-button>
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
    </el-col>
  </el-row>
</div>
</template>

<script>
import certificateImport from './certificateImport.vue'

export default {
  name: 'certificateList',
  components: { certificateImport},
  data () {
    return {
      importVisiable: false,
      outVisiable: false,
      dataListLoading: false,
      deptId: null,
      treeList: [],
      filterText: '',
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
  mounted () {
    // 初始化时请求数据
    this.getData()
    this.getDeptTreeList()
  },
  methods: {
    filterNode (value, data, node) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    getDeptsByPid (data) {
      this.deptId = data.id
      this.getData()
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
    handleDetail (val) {
      // eslint-disable-next-line no-template-curly-in-string
      window.open(`#/edu-certificateDetail?stuId=${val}`, '_blank');
    },
    handleEdit (val) {
      // this.$router.push({
      //   name: 'certificateEdit',
      //   params: {
      //     stuId: val
      //   }
      // })
      window.open(`#/edu-certificateEdit?stuId=${val}`, '_blank');
    },
    handleSearch () {
      this.getData()
    },
    handleImport () {
      this.importVisiable = true
      // 处理导入逻辑
      this.$nextTick(() => {
        this.$refs.importDialog.init()
      })
    },

    handleExport () {
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.currentPage = 1
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
      this.dataListLoading = true
      var stuNameOption = null
      var schoolNumberOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        schoolNumberOption = this.searchConditions.filter(condition => condition.option === 'schoolNumber')
      }
      this.$http({
        url: this.$http.adornUrl('edu/certificate/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.currentPage,
          'limit': this.pageSize,
          'deptId': this.deptId,
          'stuName': stuNameOption.length === 0 ? null : stuNameOption[0].value,
          'schoolNumber': schoolNumberOption.length === 0 ? null : schoolNumberOption[0].value
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.tableData = data.page.list
          this.total = data.page.totalCount
        } else {
          this.$message.error(data.msg)
          this.tableData = []
          this.total = 0
        }
      })
      this.dataListLoading = false
    }
  }
}
</script>

<style scoped>

</style>

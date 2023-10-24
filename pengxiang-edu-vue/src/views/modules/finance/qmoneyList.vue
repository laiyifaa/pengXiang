<template>
  <div >


<!--&lt;!&ndash; 按钮 &ndash;&gt;-->
<!--<el-row style="padding: 20px;" >-->
<!--  <el-button type="primary">刷新</el-button>-->

<!--  <el-button type="info">信息导入</el-button>-->
<!--  <el-button type="warning">信息导出</el-button>-->
<!--  <el-button  type="primary" icon="el-icon-plus"  @click="addRow()">新 增</el-button>-->
<!--</el-row>-->
<!--&lt;!&ndash; 搜索框 &ndash;&gt;-->
<!--<el-select-->
<!--    v-model="value"-->
<!--    multiple-->
<!--    filterable-->
<!--    remote-->
<!--    reserve-keyword-->
<!--    placeholder="请输入关键词"-->
<!--    :remote-method="remoteMethod"-->
<!--    :loading="loading"-->
<!--    style="position: absolute ;top: 20px;right:200px;">-->
<!--    <el-option-->
<!--      v-for="item in options"-->
<!--      :key="item.value"-->
<!--      :label="item.label"-->
<!--      :value="item.value">-->
<!--    </el-option>-->
<!--  </el-select>-->
<!--  <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>-->

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
              <el-option label="身份证号" value="身份证号"></el-option>
              <!--              <el-option label="系部" value="系部"></el-option>-->
<!--              <el-option label="专业" value="专业"></el-option>-->
<!--              <el-option label="退费账号" value="退费账号"></el-option>-->
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;"></el-input>
            <el-button type="danger" icon="el-icon-delete" @click="removeSearchCondition(index)">删除</el-button>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
      <el-col :span="6">
        <el-tree
          :data="treeList"
          node-key="id"
          :default-expanded-keys="[]"
          :default-checked-keys="[]"
          :props="defaultProps"
          @node-click="(data, node, item)=>getDeptsByPid(data, node, item)"
        >
        </el-tree>
      </el-col>

      <el-col :span="18">
   <!-- 表格 -->
   <el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;">
      <el-table-column
      type="selection"
      width="55">
    </el-table-column>
    <el-table-column
      prop="schoolNumber"
      label="学号"
      width="100" align="center">
    </el-table-column>
    <el-table-column
      prop="stuName"
      label="姓名"
      width="140" align="center">
    </el-table-column>
    <el-table-column
      prop="gender"
      label="性别"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="gradeName"
      label="年级"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="deptName"
      label="系部"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="majorName"
      label="专业"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="className"
      label="班级"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="headTeacher"
      label="班主任"
      width="80" align="center">
    </el-table-column>
      <el-table-column label="操作" style="text-align: center" align="center">
        <template slot-scope="scope">

          <!-- 详情按钮 -->
          <router-link :to="{name:'qmoneyDetail'}">
            <el-button
              type="text"
              @click="handleDelete(scope.$index, scope.row)">详情</el-button>
          </router-link>
          <!-- 编辑按钮 -->
          <el-button type="text" @click="handleEdit">修改</el-button>
        </template>
      </el-table-column>
    </el-table>
      </el-col>
    </el-row>
    <el-pagination @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page="currentPage"
                   :page-sizes="[20, 50, 100, 200]"
                   :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total" style="text-align:right;margin-right: 60px">

    </el-pagination>
</div>
  </template>

  <script>
  export default {
    data () {
      return {
        treeList: [],

        defaultProps: {
          children: 'children',
          label: 'label'
        },
        visible: false,
        searchConditions: [{
          option: '',
          value: ''
        }], // 条件搜索栏目数据
        searchCount: 1,
        currentPage: 1, // 当前页码
        pageSize: 20, // 每页显示条数
        total: 0, // 总条数

        tableData: []
      }
    },
    activated () {
      this.getDataList()
      this.getDeptTreeList()
    },
    methods: {
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
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/generator/feearrearage/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.tableData = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.tableData = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
        this.getDeptTreeList()
      },
      // 树形列表
      getDeptsByPid (data, node, item) {
        this.$http({
          url: this.$http.adornUrl(`/generator/sysdept/getSubDeptsByPid/${data.id}`),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      handleEdit (index, row) {
      },
      handleDelete (index, row) {
      },
      handleImport () {
        // 处理导入逻辑
      },
      handleExport () {
        // 处理导出逻辑
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


<style>

</style>

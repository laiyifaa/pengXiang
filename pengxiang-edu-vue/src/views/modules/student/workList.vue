<template>
<div>
  <el-row style="margin-top: 20px;">
    <el-col :span="3" style="text-align:left;margin-left: 200px">
      <el-button type="success" @click="Export">导出</el-button>
    </el-col>
    <el-col :span="14" style="text-align:center;" >
      <div style="display: flex; align-items: center;">
        <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<2">查询条件</el-button>
        <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 5px; display: flex; align-items: center; ">
          <el-select style="width: 92px;" v-model="condition.option" placeholder="条件">
            <el-option label="姓名" value="name"></el-option>
            <el-option label="学号" value="schoolNumber"></el-option>
          </el-select>
          <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;margin-left: 5px" clearable></el-input>
          <el-button type="danger" style=" margin-left: 5px;" icon="el-icon-delete" @click="removeSearchCondition(index) ">删除</el-button>
        </div>
        <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 2px;">搜索</el-button>
      </div>
    </el-col>
  </el-row>
  <el-col :span="3">
    <el-tree
      ref="treeRef"
      :data="treeList"
      node-key="id"
      :default-expanded-keys="[]"
      :default-checked-keys="[]"
      :props="defaultProps"
      @node-click="(data, node, item)=>getDeptsByPid(data, node, item)"
    >
    </el-tree>
  </el-col>
  <el-col :span="21">
<el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;" :key="dataChange">

  <el-table-column prop="name" width="170" label="姓名" align="center"></el-table-column>
  <el-table-column prop="phone" width="170" label="联系电话" align="center"></el-table-column>
  <el-table-column prop="schoolName" width="200" label="学校" align="center"></el-table-column>
  <el-table-column prop="gradeName" width="170" label="年级" align="center"></el-table-column>
  <el-table-column prop="majorName" width="170" label="专业" align="center"></el-table-column>
  <el-table-column prop="className" width="170" label="班级" align="center"></el-table-column>


  <el-table-column prop="times" label="实习次数" width="170" align="center"></el-table-column>
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
  </el-col>

  <el-dialog :visible.sync="showDialog" title="提示" width="30%">
    <p size="100px" style="margin-top: 20px; font-weight: bold;text-align: center">请选择导出选项</p>
    <span slot="footer" class="dialog-footer">
    <el-button type="success" @click="handleExport('current')">导出当前页</el-button>
    <el-button type="success" @click="handleExport('all')">导出所有</el-button>
    <el-button @click="showDialog = false">取消</el-button>
  </span>
  </el-dialog>

</div>
</template>

<script>
export default {
  name: 'workList',

  data () {
    return {
      showDialog:false,
      dataChange:false,
      treeList: [],
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
      this.selectedStudentNumber = scope.row.schoolNumber
      this.$router.push({
          name: 'workDetail',
          params: {
            schoolNumber: this.selectedStudentNumber,
            Info: this.tableData.find(item => item.schoolNumber === this.selectedStudentNumber)
          }
        })
    },
    handleEdit (scope) {
      this.selectedStudentNumber = scope.row.schoolNumber
      this.$router.push({
        name: 'workModify',
        params: {
          schoolNumber: this.selectedStudentNumber,
          Info: this.tableData.find(item => item.schoolNumber === this.selectedStudentNumber)
        }
      })
    },
    handleSearch () {
      const params = {}
      this.searchConditions.forEach(condition => {
        if (condition.option && condition.value) {
          params[condition.option] = condition.value;
        }
      })
      if(this.$refs.treeRef.getCurrentNode()!=null){
        params.id = this.$refs.treeRef.getCurrentNode().id;
      }

      params.pageNum=this.currentPage
      params.pageSize=this.pageSize

      this.$http({
        url: this.$http.adornUrl('/stuWork/search'),
        method: 'get',
        params: params
      }).then(response =>{
        if (response.data.workDtos === null) {
          // 结果为空，弹出警告框
          this.$alert('搜索结果为空', '警告', {
            confirmButtonText: '确定',
            type: 'warning'
          })
        } else {
          this.tableData = response.data.workDtos.list;
          this.total=response.data.workDtos.total
          this.dataChange=!this.dataChange
        }
      })
    },
    handleExport(option) {


      this.$confirm('确定要导出吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (option === 'current') {
          const params = {}
          this.searchConditions.forEach(condition => {
            if (condition.option && condition.value) {
              params[condition.option] = condition.value;
            }
          })
          if(this.$refs.treeRef.getCurrentNode()!=null){
            params.id = this.$refs.treeRef.getCurrentNode().id;
          }

          params.pageNum=this.currentPage
          params.pageSize=this.pageSize

          this.$http({
            url:this.$http.adornUrl('/stuWork/export'),
            method:'get',
            params: params,
            responseType: 'blob'
          }).then(response => {
            const blob = new Blob([response.data], {
              type: response.headers['content-type']
            })
            const url = window.URL.createObjectURL(blob)
            const link = document.createElement('a')
            link.href = url
            link.setAttribute('download', '实习信息.xlsx')
            document.body.appendChild(link)
            link.click()
            window.URL.revokeObjectURL(url)
          })
        } else if (option === 'all') {
          const params = {}
          this.searchConditions.forEach(condition => {
            if (condition.option && condition.value) {
              params[condition.option] = condition.value;
            }
          })
          if(this.$refs.treeRef.getCurrentNode()!=null){
            params.id = this.$refs.treeRef.getCurrentNode().id;
          }

          this.$http({
            url:this.$http.adornUrl('/stuWork/export'),
            method:'get',
            params: params,
            responseType: 'blob'
          }).then(response => {
            const blob = new Blob([response.data], {
              type: response.headers['content-type']
            })
            const url = window.URL.createObjectURL(blob)
            const link = document.createElement('a')
            link.href = url
            /*link.setAttribute('download', isAll === true ? '所有学生就业信息.xlsx' : '当前页学生就业信息.xlsx')*/
            link.setAttribute('download', '实习信息.xlsx')
            document.body.appendChild(link)
            link.click()
            window.URL.revokeObjectURL(url)
          })

        }
        this.showDialog = false; // 关闭Dialog
      }).catch(() => {

      })



    },
    Export () {

        this.showDialog=true

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
        url: this.$http.adornUrl('/stuWork/getList'),
        method: 'get',
        params:{
          pageNum: this.currentPage,
          pageSize: this.pageSize
        }
      }).then(response => {
        this.tableData = response.data.workDtos.list
        this.total=response.data.workDtos.total
      })
        .catch(error => {
          this.$message.error(error)
        })
    },
    getDeptsByPid (data, node, item) {

      let param={
        id: node.key,
        pageNum: this.currentPage,
        pageSize: this.pageSize

      }
      this.$http({
        url:this.$http.adornUrl('stuWork/treeSearch'),
        method:'get',
        params: param
      }).then(response=>{

        this.tableData = response.data.workDtos === null ? [] : response.data.workDtos.list;
        this.total = response.data.workDtos === null ? 0 :response.data.workDtos.total

        this.dataChange=!this.dataChange
      })
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
    }
  }
}
</script>

<style scoped>

.dialog-footer {
  display: flex;
  justify-content: center;
  align-items: center;
}

.dialog-footer .el-button {
  margin: 0 10px;
  background-color: #67C23A;
  border-color: #67C23A;
  color: #fff;
}
</style>

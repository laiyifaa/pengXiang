<template>
  <div>
    <el-row style="margin-top: 20px;">
            <el-col :span="3" style="text-align:left;margin-left: 200px">
              <el-button type="success" @click="handleImport">导入</el-button>
              <el-button type="success" @click="Export">导出</el-button>
            </el-col>
            <el-col :span="14" style="text-align:center;" >
              <div style="display: flex; align-items: center;">
                <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<2">查询条件</el-button>
                <div v-for="(condition, index) in searchConditions" :key="index" style="margin-left: 5px; display: flex; align-items: center;">
                  <el-select style="width: 120px;" v-model="condition.option" placeholder="条件">
                    <el-option label="姓名" value="name"></el-option>
                    <el-option label="学号" value="schoolNumber"></el-option>
                    <el-option label="是否在岗" value="isPost"></el-option>
                    <el-option label="是否需要二次就业" value="isSecondEmploy"></el-option>
                    <el-option label="离校日期" value="leaveDate"></el-option>
                    <el-option label="离校原因" value="leaveReason"></el-option>
                    <el-option label="就业岗位" value="employPost"></el-option>
                    <el-option label="岗位负责人" value="postLeader"></el-option>
                  </el-select>
                  <template v-if="condition.option === 'leaveDate'">
                    <el-date-picker
                      style="width: 215px; margin-left: 5px;"
                      v-model="condition.value"
                      value-format="yyyy-MM-dd"
                      placeholder="选择日期"
                    ></el-date-picker>
                  </template>
                  <template v-else-if="condition.option === 'isPost'">
                    <el-select style="width: 215px; " v-model="condition.value" >
                      <el-option label="是" :value='1' ></el-option>
                      <el-option label="否" :value='0' ></el-option>
                    </el-select>
                  </template>
                  <template v-else-if="condition.option === 'isSecondEmploy'">
                  <el-select style="width: 215px; " v-model="condition.value" >
                    <el-option label="是" :value='1' ></el-option>
                    <el-option label="否" :value='0' ></el-option>
                  </el-select>
                </template>
                  <template v-else>
                    <el-input v-model="condition.value" placeholder="请输入" style="width: 215px; margin-left: 5px;" clearable></el-input>
                  </template>
            <el-button type="danger" style=" " icon="el-icon-delete" @click="removeSearchCondition(index) ">删除</el-button>
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
        @node-click="(node,)=>getDeptsByPid(node)"
      >
      </el-tree>
    </el-col>

    <el-col :span="21">

    <el-table  :data="tableData"  border style="width: 100%;; margin-top: 20px;"  :key="reloadTable">

      <el-table-column
        type="selection"
        width="50">
      </el-table-column>

      <el-table-column prop="name" width="110" label="姓名" align="center"></el-table-column>
      <el-table-column prop="phone" width="110" label="联系电话" align="center"></el-table-column>
      <el-table-column prop="gradeName" width="110" label="年级" align="center"></el-table-column>
      <el-table-column prop="deptName" width="110" label="系部" align="center"></el-table-column>
      <el-table-column prop="majorName" width="160" label="专业" align="center"></el-table-column>
      <el-table-column prop="className" width="110" label="班级" align="center"></el-table-column>
      <el-table-column prop="headTeacher" width="110" label="班主任" align="center"></el-table-column>
      <el-table-column prop="headTeacherPhone" width="110" label="班主任电话" align="center"></el-table-column>
      <el-table-column prop="employOrg" width="110" label="就业单位" align="center"></el-table-column>
      <el-table-column prop="employPost" width="110" label="就页岗位" align="center"></el-table-column>
      <el-table-column prop="postLeader" width="110" label="岗位负责人" align="center"></el-table-column>
      <el-table-column  align="center"  label="操作" fixed="right">
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
                   :page-sizes="[20, 50, 100, 200]"
                   :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total" style="text-align:right;margin-right: 60px"> </el-pagination>
      <employ-import v-if="Visiable" ref="dialog"> </employ-import>



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
import EmployImport from './employImport'

export default {
  components: {
    EmployImport
  },
  name: 'employList',
  data () {
    return {
      showDialog: false,
      treeList: [],
      reloadTable: false,
      Visiable: false,
      selectedIdNumber: '',
      searchCount: 1,
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      currentPage: 1, // 当前页码
      pageSize: 20, // 每页显示条数
      total: 0, // 总条数
      tableData: null
    }
  },
  mounted () {
    this.getDeptTreeList()
    this.getData()
  },
  methods: {
    handleImport (data) {
      // 处理导入逻辑
      this.Visiable = true
      this.$nextTick(() => {
        this.$refs.dialog.init(data)
      })
    },
    handleDetail (scope) {
       // 获取所点击行的学号属性
      this.selectedIdNumber = scope.row.idNumber
      let info
      info = this.tableData.find(item => item.idNumber === this.selectedIdNumber)
      window.open(`#/student-employDetail?idNumber=${this.selectedIdNumber}&Info=${encodeURIComponent(JSON.stringify(info))}`, '_blank')
      // window.open(`#/student-employDetail`, '_blank')
      //
      // this.$router.push({
      //   name: 'employDetail',
      //   params: {
      //     idNumber: this.selectedIdNumber,
      //     Info: this.tableData.find(item => item.idNumber === this.selectedIdNumber)
      //   }
      // })
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
    handleEdit (scope) {

      this.selectedIdNumber = scope.row.idNumber
      let info
      info = this.tableData.find(item => item.idNumber === this.selectedIdNumber)
      window.open(`#/student-employModify?idNumber=${this.selectedIdNumber}&Info=${encodeURIComponent(JSON.stringify(info))}`, '_blank')
    },
    handleSearch () {
      const params = {}
      this.searchConditions.forEach(condition => {
        params[condition.option] = condition.value
      })
      if (this.$refs.treeRef.getCurrentNode() != null) {
        params.id = this.$refs.treeRef.getCurrentNode().id
      }
      params.pageNum = this.currentPage
      params.pageSize = this.pageSize

      this.$http({
        url: this.$http.adornUrl('/stu/search'),
        // eslint-disable-next-line no-undef
        method: 'get',
        params: params
      }).then(response => {
        console.log(response)
        if (response.data.listDto === null) {
          // 结果为空，弹出警告框
          this.$alert('搜索结果为空', '警告', {
            confirmButtonText: '确定',
            type: 'warning'
          })
        } else {
          // 结果不为空，更新表格数据
          this.tableData = response.data.listDto.list
          this.total = response.data.listDto.total
          this.reloadTable = !this.reloadTable
        }
      })
    },
    handleExport (option) {
      this.$confirm('确定导出吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (option === 'current') {
          const params = {}
          this.searchConditions.forEach(condition => {
            if (condition.option && condition.value) {
              params[condition.option] = condition.value
            }
          })
          if (this.$refs.treeRef.getCurrentNode() != null) {
            params.id = this.$refs.treeRef.getCurrentNode().id
          }

          params.pageNum = this.currentPage
          params.pageSize = this.pageSize

          this.$http({
            url: this.$http.adornUrl('/stu/export'),
            method: 'get',
            params: params,
            responseType: 'blob'
          }).then(response => {
            const blob = new Blob([response.data], {
              type: response.headers['content-type']
            })
            const url = window.URL.createObjectURL(blob)
            const link = document.createElement('a')
            link.href = url
            /* link.setAttribute('download', isAll === true ? '所有学生就业信息.xlsx' : '当前页学生就业信息.xlsx') */
            link.setAttribute('download', '就业信息.xlsx')
            document.body.appendChild(link)
            link.click()
            window.URL.revokeObjectURL(url)
          })
        } else if (option === 'all') {
          const params = {}
          this.searchConditions.forEach(condition => {
            if (condition.option && condition.value) {
              params[condition.option] = condition.value
            }
          })
          if (this.$refs.treeRef.getCurrentNode() != null) {
            params.id = this.$refs.treeRef.getCurrentNode().id
          }
          this.$http({
            url: this.$http.adornUrl('/stu/export'),
            method: 'get',
            params: params,
            responseType: 'blob'
          }).then(response => {
            const blob = new Blob([response.data], {
              type: response.headers['content-type']
            })
            const url = window.URL.createObjectURL(blob)
            const link = document.createElement('a')
            link.href = url
            /* link.setAttribute('download', isAll === true ? '所有学生就业信息.xlsx' : '当前页学生就业信息.xlsx') */
            link.setAttribute('download', '就业信息.xlsx')
            document.body.appendChild(link)
            link.click()
            window.URL.revokeObjectURL(url)
          })
        }
        this.showDialog = false // 关闭Dialog
      }).catch(() => {

      })
    },
    Export () {
      this.showDialog = true
    },
    getDeptsByPid (node) {
      this.currentPage = 1
      let param = {
        id: node.id,
        pageNum: this.currentPage,
        pageSize: this.pageSize
      }
      this.$http({
        url: this.$http.adornUrl('/stu/treeSearch'),
        method: 'get',
        params: param
      }).then(response => {
        this.tableData = response.data.listDto === null ? [] : response.data.listDto.list
        this.total = response.data.listDto === null ? 0 : response.data.listDto.total
      })
    },
    reGetDeptsByPid (node) {
      let param = {
        id: node.id,
        pageNum: this.currentPage,
        pageSize: this.pageSize
      }
      this.$http({
        url: this.$http.adornUrl('/stu/treeSearch'),
        method: 'get',
        params: param
      }).then(response => {
        this.tableData = response.data.listDto === null ? [] : response.data.listDto.list
        this.total = response.data.listDto === null ? 0 : response.data.listDto.total
      })
    },
    handleSizeChange (size) {
      this.pageSize = size
      if (this.searchConditions[0].value != '') {
        this.handleSearch()
      } else if (this.$refs.treeRef.getCurrentNode() != null) {
        this.reGetDeptsByPid(this.$refs.treeRef.getCurrentNode())
      } else {
        this.getData()
      }
    },
    // 处理当前页码变化事件
    handleCurrentChange (page) {
      this.currentPage = page
      // 重新请求数据
      if (this.searchConditions[0].value != '') {
        this.handleSearch()
      } else if (this.$refs.treeRef.getCurrentNode() != null) {
        this.reGetDeptsByPid(this.$refs.treeRef.getCurrentNode())
      } else {
        this.getData()
      }
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('/stu/getEmployList'),
        method: 'get',
        params: {
          pageNum: this.currentPage,
          pageSize: this.pageSize
        }
      }).then(response => {
        this.tableData = response.data.listDto.list
        this.total = response.data.listDto.total
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

<template>
  <div>
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
      <el-col :span="8" style="text-align:left;margin-left: 20px">
        <el-button type="primary" icon="el-icon-refresh"  @click="getData"></el-button>
     <el-button type="success" @click="handleEdit(null,false)" style="background-color: lightgreen">新增</el-button>
        <el-button type="success" @click="handleImport">导入</el-button>
        <student-import v-if="importVisiable" ref="importDialog"></student-import>
        <el-button type="success" @click="handleExport">导出</el-button>
        <student-out v-if="outVisiable" ref="outDialog"></student-out>
        <el-button type="success" @click="deleteIf()" style="background-color: red" :disabled="dataListSelections.length <= 0">删除</el-button>
      </el-col>
      <el-col :span="14" >
        <div style="display: flex; align-items: center; margin-left: 0px">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<2">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-table-column
                type="selection"
                width="55">
              </el-table-column>
              <el-option label="姓名" value="stuName"></el-option>
              <el-option label="身份证号" value="idNumber"></el-option>
<!--              <el-option label="政治面貌" value="political"></el-option>-->
              <el-option label="班主任" value="headTeacher"></el-option>
<!--              <el-option label="户口性质" value="account"></el-option>-->
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;" clearable></el-input>
            <i class="el-icon-circle-close" type="danger" icon="el-icon-circle-close" @click="removeSearchCondition(index)" style="margin: 5px"></i>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row>

    <el-table :data="tableData"  border style="width: 100%; margin-top: 20px;"  v-loading="dataListLoading" @selection-change="selectionChangeHandle">
      <el-table-column
        type="selection"
        width="50">
      </el-table-column>
      <el-table-column prop="stuId" label="序号"  align="center" v-if="false"></el-table-column>
<!--      <el-table-column prop="schoolNumber" label="学号" width="115px"  align="center"></el-table-column>-->
      <el-table-column prop="stuName" label="姓名" width="70px"  align="center"></el-table-column>
<!--      <el-table-column prop="idNumber" label="身份证号" width="170px"  align="center"></el-table-column>-->
<!--      <el-table-column prop="birthday" label="出生日期"  align="center"></el-table-column>-->
      <el-table-column prop="gender" label="性别" width="50px" align="center"></el-table-column>
<!--      <el-table-column prop="nation" label="民族" width="50px" align="center"></el-table-column>-->
<!--      <el-table-column prop="nativePlace" label="籍贯" align="center"></el-table-column>-->
<!--      <el-table-column prop="politicalStatus" label="政治面貌"  align="center"></el-table-column>-->
<!--      <el-table-column prop="phone" label="联系电话" width="120px" align="center"></el-table-column>-->
<!--      <el-table-column prop="department" label="系部" width="100px" align="center"></el-table-column>-->
      <el-table-column prop="academyName" label="院校" width="210px" align="center"></el-table-column>
      <el-table-column prop="gradeName" label="年级" align="center"></el-table-column>
      <el-table-column prop="majorName" label="专业" align="center"></el-table-column>
      <el-table-column prop="classType" label="班型" width="70px" align="center"></el-table-column>
      <el-table-column prop="className" label="班级" align="center"></el-table-column>
      <el-table-column prop="headTeacher" label="班主任" align="center"></el-table-column>
      <el-table-column prop="headTeacherPhone" label="班主任电话" width="120px" align="center"></el-table-column>
<!--      <el-table-column prop="emil" label="电子邮件" align="center"></el-table-column>-->
<!--      <el-table-column prop="account" label="户口性质" align="center"></el-table-column>-->
      <el-table-column label="操作" align="center"  width="250px">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="primary"
            @click="handleEdit(scope.row.stuId,true)">编辑
          </el-button>
          <el-button
            size="mini"
            type="success"
            @click="handleDetail( scope.row.stuId)">详情
          </el-button>
          <el-button
            size="mini"
            type="danger"
            @click="deleteIf( scope.row.stuId)"
          >删除
          </el-button>
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

  </div>
</template>


<script>
import studentImport from './studentImport'
import studentOut from './studentOut'

export default {
  mounted () {
    // 初始化时请求数据
    this.getData()
    this.getDeptTreeList()
  },
  components: {
    studentImport,
    studentOut
  },
  methods: {
    filterNode (value, data, node) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    addSearchCondition () {
      this.searchConditions.push({
        option: '',
        value: ''
      })
      this.searchCount++
    },
    deleteIf (id) {
      this.dataListLoading = true
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.stuId
      })
      this.$confirm(`确定对学生进行删除操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('stu/baseInfo/delete'),
          method: 'post',
          data: this.$http.adornData(ids, false)
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getData()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
      this.dataListLoading = false
    },
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (val) {
      // 处理详情逻辑
      this.$router.push({
        name: 'studentDetail',
        params: {
          stuId: val
        }
      })
    },
    handleEdit (val, isEdit) {
      this.$router.push({
        name: 'studentEdit',
        params: {
          stuId: val,
          isEdit: isEdit
        }
      })
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
      // 处理导出逻辑
      this.outVisiable = true
      var stuNameOption = null
      var idNumberOption = null
      var headTeacherOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        idNumberOption = this.searchConditions.filter(condition => condition.option === 'idNumber')
        headTeacherOption = this.searchConditions.filter(condition => condition.option === 'headTeacher')
      }
      this.$nextTick(() => {
        this.$refs.outDialog.init(this.pageSize, this.currentPage, stuNameOption.length === 0 ? null : stuNameOption[0].value,
          idNumberOption.length === 0 ? null : idNumberOption[0].value, headTeacherOption.length === 0 ? null : headTeacherOption[0].value, this.deptId)
      })
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.currentPage = 1
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
      this.dataListLoading = true
      var stuNameOption = null
      var idNumberOption = null
      var headTeacherOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        idNumberOption = this.searchConditions.filter(condition => condition.option === 'idNumber')
        headTeacherOption = this.searchConditions.filter(condition => condition.option === 'headTeacher')
      }
      this.$http({
        url: this.$http.adornUrl('stu/baseInfo/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.currentPage,
          'limit': this.pageSize,
          'deptId': this.deptId,
          'stuName': stuNameOption.length === 0 ? null : stuNameOption[0].value,
          'idNumber': idNumberOption.length === 0 ? null : idNumberOption[0].value,
          'headTeacher': headTeacherOption.length === 0 ? null : headTeacherOption[0].value
        })
      }).then(({data}) => {
        if (data.code === 500) {
          this.$message.error(data.msg)
        }
        if (data && data.code === 0) {
          this.tableData = data.page.list
          this.total = data.page.totalCount
          this.tableData.forEach(function (value, index, array) {
            switch (array[index].classType) {
              case 0:
                array[index].classType = '升学'
                break
              default:
                array[index].classType = '就业'
            }
          })
        } else {
          this.$message.error(data.msg)
          this.tableData = []
          this.total = 0
        }
      })
      this.dataListLoading = false
    },
    selectionChangeHandle (val) {
      this.dataListSelections = val
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
        } else {
          this.$message.error(data.msg)
        }
      })
    }
  },
  data () {
    return {
      filterText: '',
      treeList: [],
      defaultProps: {
        children: 'children',
        label: 'label'
      },
      deptId: null,
      importVisiable: false,
      outVisiable: false,
      searchCount: 1,
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      currentPage: 1, // 当前页码
      pageSize: 10, // 每页显示条数
      total: 0, // 总条数
      searchText: '',
      dataListSelections: [],
      tableData: [],
      dataListLoading: false
    }
  }
}
</script>
<style scoped>

</style>

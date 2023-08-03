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
    <el-row style="margin-top: 20px; margin-left: -20px">
      <el-col :span="9" style="text-align:left;margin-left: 20px">
        <el-button type="primary" icon="el-icon-refresh" @click="getData"></el-button>
        <el-button type="success" @click="ifPass()" style="background-color: darkgreen" icon="el-icon-check" :disabled="dataListSelections.length <= 0">通过</el-button>
         <el-button type="success" @click="handleEdit(null,null,false)" style="background-color: green"  >新增</el-button>
        <el-button type="success" @click="handleImport">导入</el-button>
        <enroll-stu-import v-if="importVisiable" ref="dialog"></enroll-stu-import>
        <el-button type="success" @click="handleExport">导出</el-button>
        <enroll-stu-out v-if="outVisiable" ref="outDialog"></enroll-stu-out>
        <el-button type="success" @click="deleteIf()" style="background-color: red" :disabled="dataListSelections.length <= 0">删除</el-button>
      </el-col>
      <el-col :span="14">
        <div style="display: flex; align-items: center; margin-left: -10px">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;"
                     @click="addSearchCondition" v-show="searchCount<2">查询条件
          </el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-table-column
                type="selection"
                width="55">
              </el-table-column>
              <el-option label="学生姓名" value="stuName" ></el-option>
              <el-option label="招生老师" value="enrollTeacher"></el-option>
              <el-option label="招生老师部门" value="admissionsDepartment"></el-option>
              <el-option label="招生老师电话" value="enrollTeacherPhone"></el-option>
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;" clearable></el-input>
            <i class="el-icon-circle-close" type="danger" icon="el-icon-circle-close"
               @click="removeSearchCondition(index)" style="margin: 5px"></i>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;" >搜索
          </el-button>
        </div>
      </el-col>
    </el-row>
    <el-table :data="dataList" border style="width: 100%; margin-top: 20px;"  @selection-change="selectionChangeHandle"  v-loading="dataListLoading">
      <el-table-column
        type="selection"
        width="50">
      </el-table-column>
      <el-table-column prop="id" label="序号"  align="center" v-if="false"></el-table-column>
      <el-table-column prop="stuName" label="姓名" width="70px" align="center"></el-table-column>
      <el-table-column prop="gender" label="性别" width="50px" align="center"></el-table-column>
      <el-table-column prop="majorName" label="专业" width="180px" style="text-align: center" align="center"></el-table-column>
      <el-table-column prop="schoolingLength" label="学制"  align="center"></el-table-column>
      <el-table-column prop="gradeName" label="年级" width="70px" align="center"></el-table-column>
<!--      <el-table-column prop="admissionSeason" label="招生季"  align="center"></el-table-column>-->
      <el-table-column prop="enrollTeacher" label="招生老师" width="90px" align="center"></el-table-column>
      <el-table-column prop="enrollTeacherDept" label="招生老师部门" width="120px" align="center"></el-table-column>
      <el-table-column prop="enrollTeacherPhone" label="招生老师电话"  align="center"></el-table-column>
      <el-table-column prop="status" label="考生状态"  align="center"></el-table-column>
<!--      <el-table-column prop="phone" label="联系电话"  align="center"></el-table-column>-->
      <el-table-column label="操作" width="350px" align="center">
        <template slot-scope="scope">
          <!-- 编辑按钮 -->
            <el-button
              size="mini"
              type="primary"
              @click="handleEdit(scope.$index, scope.row,true)">编辑
            </el-button>
            <el-button
              size="mini"
              type="success"
              @click="handleDetail( scope.row.id)">详情
            </el-button>

          <el-button
            size="mini"
            type="danger"
            @click="deleteIf( scope.row.id)"
            >删除
          </el-button>
<!--          <label style="margin-left: 1px">
            <input type="checkbox" v-model="isPassed">
          </label>
          <span v-if="isPassed">已通过</span>
          <span v-else>未通过</span>-->
        </template>
      </el-table-column>
    </el-table>
        <el-pagination @size-change="handleSizeChange"
                       @current-change="handleCurrentChange"
                       :current-page="pageIndex"
                       :page-sizes="[10, 20, 30, 40]"
                       :page-size="pageSize"
                       layout="total, sizes, prev, pager, next, jumper"
                       :total="totalPage" style="text-align:right;margin-right: 60px">
        </el-pagination>
      </el-col>
    </el-row>
<!--    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList" :academyIdStu="academyIdStu"></add-or-update>-->
  </div>
</template>

<script>
import EnrollStuImport from './enrollStuImport'
import EnrollStuOut from './enrollStuOut'
export default {
  components: {EnrollStuImport, EnrollStuOut},
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
    // 获取数据列表
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
    },
    addSearchCondition () {
      this.searchConditions.push({
        option: '',
        value: ''
      })
      this.searchCount++
    },
    ifPass (id) {
      this.dataListLoading = true
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm('确定通过已选中的学生吗, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('stu/temp/pass'),
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
            }).catch(() => {
              this.$message({
                type: 'info',
                message: '已取消'
              })
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
      this.dataListLoading = false
    },
    deleteIf (id) {
      this.dataListLoading = true
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('stu/temp/delete'),
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
      this.$router.push({
        name: 'enrollStuListDetail',
        params: {
          stuId: val
        }
      })
    },
    handleEdit (index, row, isEdit) {
      this.$router.push({
        name: 'enrollStuEdit',
        params: {
          stuId: isEdit ? row.id : null,
          isEdit: isEdit
        }
      })
    },
    handleSearch () {
      this.getData()
    },
    handleImport () {
      this.importVisiable = true
      this.$nextTick(() => {
        this.$refs.dialog.init()
      })
    },
    handleExport () {
      // 处理导出逻辑
      this.outVisiable = true
      var stuNameOption = null
      var enrollTeacherOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        enrollTeacherOption = this.searchConditions.filter(condition => condition.option === 'enrollTeacher')
      }
      this.$nextTick(() => {
        this.$refs.outDialog.init(this.pageSize, this.pageIndex, stuNameOption.length === 0 ? null : stuNameOption[0].value, enrollTeacherOption.length === 0 ? null : enrollTeacherOption[0].value, this.deptId)
      })
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.pageIndex = 1
      // 重新请求数据
      this.getData()
    },
    // 处理当前页码变化事件
    handleCurrentChange (page) {
      this.pageIndex = page
      // 重新请求数据
      this.getData()
    },
    getData: function () {
      this.dataListLoading = true
      var stuNameOption = null
      var enrollTeacherOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        enrollTeacherOption = this.searchConditions.filter(condition => condition.option === 'enrollTeacher')
      }
      this.$http({
        url: this.$http.adornUrl('stu/temp/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'deptId': this.deptId,
          'stuName': stuNameOption.length === 0 ? null : stuNameOption[0].value,
          'enrollTeacher': enrollTeacherOption.length === 0 ? null : enrollTeacherOption[0].value
        })
      }).then(({data}) => {
        if (data.code === 500) {
          this.$message.error(data.msg)
        }
        if (data && data.code === 0) {
          this.dataList = data.page.list
          this.totalPage = data.page.totalCount
          this.dataList.forEach(function (value, index, array) {
            switch (array[index].status) {
              case 0:
                array[index].status = '未参加面试'
                break
              // eslint-disable-next-line no-fallthrough
              case 1:
                array[index].status = '通过面试'
                break
              case 2:
                array[index].status = '未通过面试'
                break
            }
          })
        } else {
          this.dataList = []
          this.totalPage = 0
        }
      })
      this.dataListLoading = false
    },
    // 多选
    selectionChangeHandle (val) {
      this.dataListSelections = val
    }
  },
  data () {
    return {
      treeList: [],
      filterText: '',

      defaultProps: {
        children: 'children',
        label: 'label'
      },
      size: '',
      deptId: null,
      importVisiable: false,
      outVisiable: false,
      searchCount: 1,
      dataListSelections: [],
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      pageIndex: 1, // 当前页码
      pageSize: 10, // 每页显示条数
      totalPage: 0, // 总条数
      searchText: '',
      dataListLoading: false,
      dataList: []
    }
  }
}
</script>
<style scoped>

</style>

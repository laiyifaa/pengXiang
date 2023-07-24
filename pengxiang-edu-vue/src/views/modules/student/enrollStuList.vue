<template>
  <div>
    <el-row style="margin-top: 20px;">
      <el-col :span="9" style="text-align:left;margin-left: 20px">
        <el-button type="primary" icon="el-icon-refresh"></el-button>
        <el-button type="success" @click="ifPass" style="background-color: darkgreen" icon="el-icon-check">通过</el-button>
        <el-button type="success" @click="" style="background-color: green">新增</el-button>
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
        <el-button type="success" @click="deleteIf()" style="background-color: red" :disabled="dataListSelections.length <= 0">删除</el-button>
      </el-col>
      <el-col :span="10">
        <div style="display: flex; align-items: center; margin-left: 0px">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;"
                     @click="addSearchCondition" v-show="searchCount<3">查询条件
          </el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">

              <el-table-column
                type="selection"
                width="55">
              </el-table-column>
              <el-option label="学生姓名" value="stuName"></el-option>
              <el-option label="专业" value="major"></el-option>
              <el-option label="年级" value="grade"></el-option>
              <el-option label="招生老师" value="enrollTeacher"></el-option>
              <el-option label="招生老师部门" value="admissionsDepartment"></el-option>
              <el-option label="招生老师电话" value="enrollTeacherPhone"></el-option>
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;"></el-input>
            <i class="el-icon-circle-close" type="danger" icon="el-icon-circle-close"
               @click="removeSearchCondition(index)" style="margin: 5px"></i>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;" >搜索
          </el-button>
        </div>
      </el-col>
    </el-row>
    <el-table :data="dataList" border style="width: 100%; margin-top: 20px;"  @selection-change="selectionChangeHandle">
      <el-table-column
        type="selection"
        width="50">
      </el-table-column>
      <el-table-column prop="stuName" label="姓名"  align="center"></el-table-column>
      <el-table-column prop="gender" label="性别"  align="center"></el-table-column>
      <el-table-column prop="majorName" label="专业"  style="text-align: center" align="center"></el-table-column>
      <el-table-column prop="schoolingLength" label="学制"  align="center"></el-table-column>
      <el-table-column prop="gradeName" label="年级" width="70px" align="center"></el-table-column>
      <el-table-column prop="admissionSeason" label="招生季"  align="center"></el-table-column>
      <el-table-column prop="enrollTeacher" label="招生老师"  align="center"></el-table-column>
      <el-table-column prop="enrollTeacherDept" label="招生老师部门"  align="center"></el-table-column>
      <el-table-column prop="enrollTeacherPhone" label="招生老师电话"  align="center"></el-table-column>
<!--      <el-table-column prop="phone" label="联系电话"  align="center"></el-table-column>-->
      <el-table-column label="操作" width="350px" align="center">
        <template slot-scope="scope">
          <!-- 编辑按钮 -->
          <router-link :to="{name:'enrollStuEdit'}">
            <el-button
              size="mini"
              type="primary"
              @click="handleEdit(scope.$index, scope.row)">编辑
            </el-button>
          </router-link>
          <router-link :to="{name:'enrollStuListDetail'}">
            <el-button
              size="mini"
              type="success"
              @click="handleDetail(scope.$index, scope.row)">详情
            </el-button>
          </router-link>
          <el-button
            size="mini"
            type="danger"
            @click="deleteIf( scope.row.id)"
            >删除
          </el-button>
          <label style="margin-left: 1px">
            <input type="checkbox" v-model="isPassed">
          </label>
          <span v-if="isPassed">已通过</span>
          <span v-else>未通过</span>
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
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList" :academyIdStu="academyIdStu"></add-or-update>
  </div>
</template>

<script>
export default {
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
    ifPass () {
      this.$confirm('确定通过已选中的学生吗, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$message({
          type: 'success',
          message: '通过成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消'
        })
      })
    },
    deleteIf (id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      console.log(this.$http.adornData(ids, false))
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
    },
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (id) {
      // 处理详情逻辑
    },
    handleEdit (row) {
      this.$router.push('/student-enrollStuEdit')
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
    // 请求数据方法
    getData () {
      // 根据当前页码和每页显示条数发送请求获取数据
      this.dataListLoading = true
      this.$http({
        url: this.$http.adornUrl('stu/temp/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize
        })
      }).then(({data}) => {
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
        this.dataListLoading = false
      })
      // 更新表格数据和总条数
    },
    // 多选
    selectionChangeHandle (val) {
      this.dataListSelections = val
    }
  },
  data () {
    return {
      size: '',
      value2: true,
      searchCount: 1,
      isPassed: false,
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
      dataList: [],
      addOrUpdateVisible: false
    }
  }
}
</script>
<style scoped>

</style>

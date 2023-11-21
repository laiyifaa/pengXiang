<template>
<div>
<el-row style="margin-top: 20px;">
<!--  <el-col :span="2" style="text-align:left;margin-right: 0px">
    <el-button type="success" @click="handleExport">导出</el-button>
  </el-col>-->
  <el-col :span="21" >
    <div style="display: flex; align-items: center;margin-left: 210px">
      <el-button type="primary" icon="el-icon-refresh" @click="getData"></el-button>
      <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
      <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 5px; display: flex; align-items: center; ">
        <el-select style="width: 92px;" v-model="condition.option" placeholder="条件">
          <el-option label="姓名" value="stuName"></el-option>
          <el-option label="身份证号" value="idNumber"></el-option>
          <el-option label="班主任" value="headTeacher"></el-option>
        </el-select>
        <el-input v-model="condition.value" placeholder="请输入" style="width: 150px;margin-left: 5px" clearable></el-input>
        <el-button type="danger" style=" margin-left: 5px;" icon="el-icon-delete" @click="removeSearchCondition(index) ">删除</el-button>
      </div>
      <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 2px;">搜索</el-button>
    </div>
  </el-col>
</el-row>

  <el-col :span="3" >
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
  <el-col :span="20" style="margin-top: 20px;margin-left: 20px">
    时间段选择(默认关)：
    <el-date-picker v-model="start" type="date" placeholder="选择日期" value-format="yyyy-MM-dd"
                    style="width: 140px;height: 25px">
    </el-date-picker>

    <el-date-picker v-model="end" type="date" placeholder="选择日期" value-format="yyyy-MM-dd"
                    style="width: 140px;height: 25px">
    </el-date-picker>

    <el-switch
      v-model="value"
      active-color="#13ce66"
      inactive-color="#ccc">
    </el-switch>
  </el-col>
  <el-col :span="21">
  <el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;" v-loading="dataListLoading">
  <el-table-column
    type="selection"
    width="50">
  </el-table-column>
    <el-table-column prop="stuId" label="序号"  align="center" v-if="false"></el-table-column>
<!--    <el-table-column prop="schoolNumber" label="学号" width="115px"  align="center"></el-table-column>-->
  <el-table-column prop="stuName" label="姓名" align="center"></el-table-column>
    <el-table-column prop="academyName" label="院校" width="210px" align="center"></el-table-column>
  <el-table-column prop="majorName" label="专业" align="center"></el-table-column>
  <el-table-column prop="gradeName" label="年级" align="center"></el-table-column>
  <el-table-column prop="className" label="班级" align="center"></el-table-column>
  <el-table-column prop="phone" label="联系电话" align="center"></el-table-column>
<!--  <el-table-column prop="politicalStatus" label="政治面貌" align="center"></el-table-column>-->
  <el-table-column label="当前状态" align="center">
    <template slot-scope="scope">
      {{ getStatusText(scope.row.schoolRollStatus) }}
    </template>
  </el-table-column>
  <el-table-column label="操作" align="center">
    <template slot-scope="scope">
      <el-button type="text" @click="handleDetail(scope)">详情</el-button>
      <el-button type="text" @click="handleEdit(scope)">修改</el-button>
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
  </el-col>
</div>
</template>

<script>
import moment from "moment";

export default {
  name: 'workList',
  data () {
    return {
      value: false,
      start: moment().subtract(1, 'year').format('YYYY-MM-DD'),
      end: moment().format('YYYY-MM-DD'),
      treeList: [],
      deptId: null,
      searchCount: 1,
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      currentPage: 1, // 当前页码
      pageSize: 20, // 每页显示条数
      total: 0, // 总条数
      tableData: null,
      dataListLoading: false
    }
  },
  mounted () {
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
    getStatusText (status) {
      switch (status) {
        case 0:
          return '在校'
        case 1:
          return '实习'
        case 2:
          return '就业'
        case 3:
          return '请假'
        case 4:
          return '休学'
        case 5:
          return '退学'
        case 6:
          return '毕业'
        case 7:
          return '未报到'
        default:
          return ''
      }
    },
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (scope) {
     window.open(`#/student-stuStatusDetail?stuBaseInfoEntity=${encodeURIComponent(JSON.stringify(scope.row))}`, '_blank')
    },
    handleEdit (scope) {
      window.open(`#/student-stuStatusEdit?stuBaseInfoEntity=${encodeURIComponent(JSON.stringify(scope.row))}`, '_blank')
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.getData()
    },
    // 处理当前页码变化事件
    handleCurrentChange (page) {
      this.currentPage = page
      this.getData()
    },
    // 请求数据方法
    getData () {
      this.dataListLoading = true
     /* this.$http({
        url: this.$http.adornUrl('stuChange/getList'),
        method: 'get',
        params: {
          pageNum: this.currentPage,
          pageSize: this.pageSize
        }
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.tableData = data.result.list
          this.total = data.result.total
        } else {
          this.$message.error(data.msg)
        }
      }) */
      var stuNameOption = null
      var idNumberOption = null
      var headTeacherOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        idNumberOption = this.searchConditions.filter(condition => condition.option === 'idNumber')
        headTeacherOption = this.searchConditions.filter(condition => condition.option === 'headTeacher')
      }
      // eslint-disable-next-line no-undef
      if (this.value){
        if (this.start != null && this.end != null) {
          console.log(this.start)
          this.$http({
            url: this.$http.adornUrl('stu/baseInfo/timeList'),
            method: 'get',
            params: this.$http.adornParams({
              'page': this.currentPage,
              'limit': this.pageSize,
              'deptId': this.deptId,
              'stuName': stuNameOption.length === 0 ? null : stuNameOption[0].value,
              'idNumber': idNumberOption.length === 0 ? null : idNumberOption[0].value,
              'headTeacher': headTeacherOption.length === 0 ? null : headTeacherOption[0].value,
              'start': this.start,
              'end': this.end
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
        } else {
          this.$message.error('时间输入错误，请重新输入！')
        }

      } else {
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
      }

      this.dataListLoading = false
    },
    getDeptsByPid (data, node, item) {
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
    },
    handleSearch () {
      this.getData()
    }
  }
}
</script>
<style scoped>
</style>

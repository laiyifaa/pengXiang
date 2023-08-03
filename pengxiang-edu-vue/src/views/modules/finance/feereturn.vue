<template>
  <div class="mod-config">
    <el-row :gutter="20">
      <el-col :span="3">
        <el-tree
          style="padding-top: 80px;"
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
    <el-row style="margin-top: 20px;margin-left: 20px;">
      <el-col :span="7" style="text-align:left;margin-left: 0px">
        <!--        <el-button  type="success" @click="handleExport()" :disabled="dataListSelections.length <= 0">选择导出</el-button>-->
        <el-button type="success" @click="handleExport()">导出</el-button>
        <o-u-t-many v-if="outVisiable" ref="outDialog"></o-u-t-many>
        <el-button type="success" @click="handleImport">导入</el-button>
        <fee-return-import v-if="importVisiable" ref="dialog"></fee-return-import>
        <el-button  type="primary" @click="addHandle()">新增</el-button>
        <el-button  type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>

        <!--        <el-button type="success" @click="handleExport">导出</el-button>-->
        <!--        <student-out v-if="Visiableee" ref="dialoggg"></student-out>-->

      </el-col>
      <el-col :span="17" style="margin-top: 0px" >
        <div style="display: flex; align-items: center;">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-option label="姓名" value="stu_name"></el-option>
              <el-option label="学号" value="school_number"></el-option>
              <el-option label="性别" value="gender"></el-option>
              <el-option label="班主任" value="head_teacher"></el-option>
              <el-option label="籍贯" value="native_place"></el-option>
              <el-option label="政治面貌" value="political_status"></el-option>
              <el-option label="学生联系电话" value="phone"></el-option>

            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;" clearable></el-input>
            <i class="el-icon-circle-close" type="danger" icon="el-icon-circle-close" @click="removeSearchCondition(index)" style="margin: 10px"></i>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row>
    <!--        <el-button  type="primary" @click="addOrUpdateHandle()">新增</el-button>-->
    <!--        <el-button  type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>-->

        <el-table
          :data="dataList"
          border
          v-loading="dataListLoading"
          @selection-change="selectionChangeHandle"
          style="width: 100%;margin-top: 20px;">
          <el-table-column
            type="selection"
            header-align="center"
            align="center"
            width="50">
          </el-table-column>
          <el-table-column
            prop="schoolNumber"
            label="学号"
            width="140" align="center">
          </el-table-column>
          <el-table-column
            prop="stuName"
            label="姓名"
            width="100%" align="center">
          </el-table-column>
          <el-table-column
            prop="gender"
            label="性别"
            width="50" align="center">
          </el-table-column>
          <el-table-column
            prop="phone"
            label="联系电话"
            width="130" align="center">
          </el-table-column>
          <el-table-column
            prop="headTeacher"
            label="班主任"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="headTeacherPhone"
            label="班主任电话"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="returnMoneyTime"
            label="退费时间"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="returnSchoolYear"
            label="退费学年"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="account"
            label="退费账户"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="accountNumber"
            label="退费账号"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="depositBank"
            label="退费开户行"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="returnFeeNum"
            label="退费合计"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            fixed="right"
            header-align="center"
            align="center"
            width="150"
            label="操作">
            <template slot-scope="scope">
              <router-link :to="{name:'remoneyDetail',params:{index:scope.row.id}}">
                <el-button
                  type="text"
                  @click="handleDetail(scope.row.id)">详情</el-button>
              </router-link>
              <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">编辑</el-button>
              <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
      </el-col>
    </el-row>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
    <Add v-if="addVisible" ref="Add" @refreshDataList="getDataList"></Add>
  </div>
</template>

<script>
import AddOrUpdate from './feereturn-add-or-update'
import OUTMany from './returnfeeOut'
import Add from './feereturn-add'
import FeeReturnImport from './feeReturnImport'

export default {
  data () {
    return {
      importVisiable: false,
      outVisiable: false,
      deptId: '',
      year: '',
      Visiableee: false,
      treeList: [],
      IfQMoney: '',
      searchConditions: [{
        option: '',
        value: ''
      }], // 条件搜索栏目数据
      searchCount: 1,
      defaultProps: {
        children: 'children',
        label: 'label'
      },
      dataForm: {
        key: ''
      },
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      addOrUpdateVisible: false,
      addVisible: false
    }
  },
  components: {
    AddOrUpdate,
    Add,
    OUTMany,
    FeeReturnImport
  },
  activated () {
    this.getDataList()
    this.getDeptTreeList()
  },
  methods: {
    handleEdit () {
      this.$router.push('finance-tuitionExpenseEdit')
      // 处理修改逻辑
    },
    // 新增
    addHandle (id) {
      this.addVisible = true
      this.$nextTick(() => {
        this.$refs.Add.init(id)
      })
    },
    handleExport2 () {
      this.$confirm(`确定进行'批量导出'操作?（目前条件下所有）`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/feearrearage/exportInAll'),
          method: 'post',
          responseType: 'blob' // 指定响应类型为 Blob
        }).then(response => {
          // 创建一个Blob对象
          const blob = new Blob([response.data], { type: response.headers['content-type'] })

          // 创建一个a标签用于下载
          const url = window.URL.createObjectURL(blob)
          const link = document.createElement('a')
          link.href = url
          link.setAttribute('download', '')
          document.body.appendChild(link)
          // 触发点击事件下载文件
          link.click()

          // 释放对象URL资源
          window.URL.revokeObjectURL(url)
        })
      })
    },
    addSearchCondition () {
      this.searchConditions.push({
        option: '',
        value: ''
      })
      this.searchCount++
    },
    handleSearch () {
      this.dataListLoading = true
      this.$http.post(this.$http.adornUrl('/generator/feereturn/search'), {
        'page': this.pageIndex,
        'limit': this.pageSize,
        searchConditions: this.searchConditions
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
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (id) {
      this.$nextTick(() => {
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
    },
    // 获取数据列表
    getDataList () {
      this.dataListLoading = true
      this.$http({
        url: this.$http.adornUrl('/generator/feereturn/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'deptId': this.deptId
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
    getDeptsByPid (data, node, item) {
      this.deptId = data.id
      this.pageIndex = 1
      this.pageSize = 10
      this.$http({
        url: this.$http.adornUrl('/generator/feereturn/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'deptId': data.id
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
    // 每页数
    sizeChangeHandle (val) {
      this.pageSize = val
      this.pageIndex = 1
      this.getDataList()
    },
    // 当前页
    currentChangeHandle (val) {
      this.pageIndex = val
      this.getDataList()
    },
    // 多选
    selectionChangeHandle (val) {
      this.dataListSelections = val
    },
    // 新增 / 修改
    addOrUpdateHandle (id) {
      this.addOrUpdateVisible = true
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id)
      })
    },
    handleImport () {
      this.importVisiable = true
      this.$nextTick(() => {
        this.$refs.dialog.init()
      })
    },
    handleExport (id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.outVisiable = true
      this.$nextTick(() => {
        this.$refs.outDialog.init(this.$http.adornData(ids, false))
      })
    },
    // 删除
    deleteHandle (id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/feereturn/delete'),
          method: 'post',
          data: this.$http.adornData(ids, false)
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDataList()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },
  }
}
</script>

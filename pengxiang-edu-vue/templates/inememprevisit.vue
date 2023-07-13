<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth('generator:inememprevisit:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('generator:inememprevisit:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="wa"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="stuId"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="deptId"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="isWork"
        header-align="center"
        align="center"
        label="是否在岗(1在岗，0不在岗)">
      </el-table-column>
      <el-table-column
        prop="isSatisfied"
        header-align="center"
        align="center"
        label="是否对岗位满意">
      </el-table-column>
      <el-table-column
        prop="empStatus"
        header-align="center"
        align="center"
        label="学生就业工作情况(升职、降职、加薪、降薪、其他)">
      </el-table-column>
      <el-table-column
        prop="leaveReason"
        header-align="center"
        align="center"
        label="离职原因(辞职、辞退)">
      </el-table-column>
      <el-table-column
        prop="regularizeSalary"
        header-align="center"
        align="center"
        label="转正薪酬">
      </el-table-column>
      <el-table-column
        prop="trialPeriod"
        header-align="center"
        align="center"
        label="试用期限(二次就业分配填写)">
      </el-table-column>
      <el-table-column
        prop="reworkJob"
        header-align="center"
        align="center"
        label="就业岗位(二次就业分配填写)">
      </el-table-column>
      <el-table-column
        prop="workLeader"
        header-align="center"
        align="center"
        label="岗位负责人">
      </el-table-column>
      <el-table-column
        prop="isNeedReemp"
        header-align="center"
        align="center"
        label="是否需要二次就业(0需要，1不需要)">
      </el-table-column>
      <el-table-column
        prop="reempAllocateTime"
        header-align="center"
        align="center"
        label="二次就业分配时间(二次就业分配填写)">
      </el-table-column>
      <el-table-column
        prop="reworkIn"
        header-align="center"
        align="center"
        label="就业单位(二次就业分配填写)">
      </el-table-column>
      <el-table-column
        prop="probationSalary"
        header-align="center"
        align="center"
        label="试用期薪酬">
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="updateTime"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="createBy"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="updateBy"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="isDeleted"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.wa)">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.wa)">删除</el-button>
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
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
  </div>
</template>

<script>
  import AddOrUpdate from './inememprevisit-add-or-update'
  export default {
    data () {
      return {
        dataForm: {
          key: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/generator/inememprevisit/list'),
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
      // 删除
      deleteHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.wa
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/generator/inememprevisit/delete'),
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
      }
    }
  }
</script>

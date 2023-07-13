<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <!-- <el-button v-if="isAuth('generator:feeschoolsundry:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('generator:feeschoolsundry:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button> -->
        <el-button type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
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
      <!-- <el-table-column
        prop="id"
        header-align="center"
        align="center"
        label="主键">
      </el-table-column> -->
      <el-table-column
        prop="stuName"
        header-align="center"
        align="center"
        label="学生姓名">
      </el-table-column>
      <el-table-column
        prop="academyInfo"
        header-align="center"
        align="center"
        label="院校">
      </el-table-column>
      <el-table-column
        prop="deptId"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="paySchoolYear"
        header-align="center"
        align="center"
        label="缴费学年">
      </el-table-column>
      <el-table-column
        prop="trainFee"
        header-align="center"
        align="center"
        label="实缴培训费">
      </el-table-column>
      <el-table-column
        prop="clothesFee"
        header-align="center"
        align="center"
        label="实缴服装费">
      </el-table-column>
      <el-table-column
        prop="bookFee"
        header-align="center"
        align="center"
        label="实缴教材费">
      </el-table-column>
      <el-table-column
        prop="hotelFee"
        header-align="center"
        align="center"
        label="实缴住宿费">
      </el-table-column>
      <el-table-column
        prop="bedFee"
        header-align="center"
        align="center"
        label="实缴被褥费">
      </el-table-column>
      <el-table-column
        prop="insuranceFee"
        header-align="center"
        align="center"
        label="实缴保险费">
      </el-table-column>
      <el-table-column
        prop="publicFee"
        header-align="center"
        align="center"
        label="实缴公物押金">
      </el-table-column>
      <el-table-column
        prop="certificateFee"
        header-align="center"
        align="center"
        label="实缴证书费">
      </el-table-column>
      <el-table-column
        prop="defenseEduFee"
        header-align="center"
        align="center"
        label="实缴国防教育费">
      </el-table-column>
      <el-table-column
        prop="bodyExamFee"
        header-align="center"
        align="center"
        label="实缴体检费">
      </el-table-column>
      <el-table-column
        prop="derateMoney"
        header-align="center"
        align="center"
        label="减免金额">
      </el-table-column>
      <el-table-column
        prop="derateProject"
        header-align="center"
        align="center"
        label="减免项目">
      </el-table-column>
      <el-table-column
        prop="poorDerateMoney"
        header-align="center"
        align="center"
        label="贫困生减免金额">
      </el-table-column>
      <el-table-column
        prop="returnFeeTime"
        header-align="center"
        align="center"
        label="返费时间">
      </el-table-column>
      <el-table-column
        prop="needReturnFeeNum"
        header-align="center"
        align="center"
        label="应返费总额">
      </el-table-column>
      <el-table-column
        prop="factReturnFeeNum"
        header-align="center"
        align="center"
        label="返费金额">
      </el-table-column>
      <el-table-column
        prop="account"
        header-align="center"
        align="center"
        label="返费账户">
      </el-table-column>
      <el-table-column
        prop="accountNumber"
        header-align="center"
        align="center"
        label="返费账号">
      </el-table-column>
      <el-table-column
        prop="depositBank"
        header-align="center"
        align="center"
        label="返费开户行">
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="创建(缴费)时间">
      </el-table-column>
      <el-table-column
        prop="updateTime"
        header-align="center"
        align="center"
        label="更新时间">
      </el-table-column>
      <el-table-column
        prop="createBy"
        header-align="center"
        align="center"
        label="创建人">
      </el-table-column>
      <el-table-column
        prop="updateBy"
        header-align="center"
        align="center"
        label="修改人">
      </el-table-column>
      <el-table-column
        prop="isDeleted"
        header-align="center"
        align="center"
        label="是否删除">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
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
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
  </div>
</template>

<script>
  import AddOrUpdate from './feeschoolsundry-add-or-update'
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
          url: this.$http.adornUrl('/generator/feeschoolsundry/list'),
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
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/generator/feeschoolsundry/delete'),
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

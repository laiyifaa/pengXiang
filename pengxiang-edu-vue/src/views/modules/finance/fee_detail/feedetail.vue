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
<!--      <el-table-column
        prop="paySchoolYear"
        header-align="center"
        align="center"
        label="缴费学年">
      </el-table-column>-->
      <el-table-column
        prop="trainFee"
        header-align="center"
        align="center"
        label="欠缴培训费">
      </el-table-column>
      <el-table-column
        prop="clothesFee"
        header-align="center"
        align="center"
        label="欠缴服装费">
      </el-table-column>
      <el-table-column
        prop="bookFee"
        header-align="center"
        align="center"
        label="欠缴教材费">
      </el-table-column>
      <el-table-column
        prop="hotelFee"
        header-align="center"
        align="center"
        label="欠缴住宿费">
      </el-table-column>
      <el-table-column
        prop="bedFee"
        header-align="center"
        align="center"
        label="欠缴被褥费">
      </el-table-column>
      <el-table-column
        prop="insuranceFee"
        header-align="center"
        align="center"
        label="欠缴保险费">
      </el-table-column>
      <el-table-column
        prop="publicFee"
        header-align="center"
        align="center"
        label="欠缴公物押金">
      </el-table-column>
      <el-table-column
        prop="certificateFee"
        header-align="center"
        align="center"
        label="欠缴证书费">
      </el-table-column>
      <el-table-column
        prop="defenseEduFee"
        header-align="center"
        align="center"
        label="欠缴国防教育费">
      </el-table-column>
      <el-table-column
        prop="bodyExamFee"
        header-align="center"
        align="center"
        label="欠缴体检费">
      </el-table-column>
      <el-table-column
        prop="feeNum"
        header-align="center"
        align="center"
        label="欠费合计">
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

  </div>
</template>

<script>
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
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
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
      }
    }
  }
</script>

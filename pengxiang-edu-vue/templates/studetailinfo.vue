<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth('generator:studetailinfo:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('generator:studetailinfo:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
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
        prop="stuId"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="eduLevel"
        header-align="center"
        align="center"
        label="培养层次">
      </el-table-column>
      <el-table-column
        prop="skillBeforeAdmission"
        header-align="center"
        align="center"
        label="入学前技能水平">
      </el-table-column>
      <el-table-column
        prop="entranceQual"
        header-align="center"
        align="center"
        label="入学学历">
      </el-table-column>
      <el-table-column
        prop="graduatedSchool"
        header-align="center"
        align="center"
        label="毕业学校">
      </el-table-column>
      <el-table-column
        prop="registeredResidence"
        header-align="center"
        align="center"
        label="户口性质">
      </el-table-column>
      <el-table-column
        prop="isDifficulty"
        header-align="center"
        align="center"
        label="是否家庭困难">
      </el-table-column>
      <el-table-column
        prop="difficultyType"
        header-align="center"
        align="center"
        label="(家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他">
      </el-table-column>
      <el-table-column
        prop="supportType"
        header-align="center"
        align="center"
        label="资助申请类型">
      </el-table-column>
      <el-table-column
        prop="totalIncome"
        header-align="center"
        align="center"
        label="家庭年总收入（元）">
      </el-table-column>
      <el-table-column
        prop="aveIncome"
        header-align="center"
        align="center"
        label="家庭人均收入（元）">
      </el-table-column>
      <el-table-column
        prop="incomeSource"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="firstSemesterLevel"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="secendSemesterLevel"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="thirdSemesterLevel"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="fourthSemesterLevel"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="fifthSemesterLevel"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="sixthSemesterLevel"
        header-align="center"
        align="center"
        label="">
      </el-table-column>
      <el-table-column
        prop="bankAccount"
        header-align="center"
        align="center"
        label="银行账户">
      </el-table-column>
      <el-table-column
        prop="bankCardNum"
        header-align="center"
        align="center"
        label="银行卡帐号">
      </el-table-column>
      <el-table-column
        prop="deposit"
        header-align="center"
        align="center"
        label="开户行">
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="创建时间">
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
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.stuId)">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.stuId)">删除</el-button>
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
  import AddOrUpdate from './studetailinfo-add-or-update'
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
          url: this.$http.adornUrl('/generator/studetailinfo/list'),
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
          return item.stuId
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/generator/studetailinfo/delete'),
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

<template>
  <div class="mod-config">
    <el-row :gutter="20" >
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
    <el-row style="margin-top: 20px;margin-left: 20px;">
      <el-col :span="7" style="text-align:left;margin-left: 0px">
<!--        <el-button  type="success" @click="handleExport()" :disabled="dataListSelections.length <= 0">选择导出</el-button>-->
        <el-button type="success" @click="handleExport()">导出</el-button>
        <o-u-t-many v-if="outVisiable" ref="outDialog"></o-u-t-many>
        <el-button type="success" @click="handleImport">导入</el-button>
        <stu-fee-import v-if="importVisiable" ref="dialog"></stu-fee-import>
        <stu-fee-attachment v-if="attachmentVisiable" ref="attachmentDialog"></stu-fee-attachment>
        <el-button  type="primary" @click="addHandle()">新增</el-button>
        <el-button  type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>

        <!--        <el-button type="success" @click="handleExport">导出</el-button>-->
        <!--        <student-out v-if="Visiableee" ref="dialoggg"></student-out>-->

      </el-col>
      <el-col :span="17" style="margin-top: 0px">
        <div style="display: flex; align-items: center;">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-option label="姓名" value="stuName"></el-option>
              <el-option label="学号" value="schoolNumber"></el-option>
              <el-option label="身份证号" value="idNumber"></el-option>
              <el-option label="户口性质" value="residenceTypeName"></el-option>
              <el-option label="是否欠费" value="isArrearage"></el-option>
              <el-option label="缴费学年" value="year"></el-option>
              <el-option label="减免类型" value="derateType"></el-option>
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
<!--          <el-table-column
            prop="nativePlace"
            label="籍贯"
            width="140" align="center">
          </el-table-column>-->
          <el-table-column
            prop="majorName"
            label="专业"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="gradeName"
            label="年级"
            width="70" align="center">
          </el-table-column>
          <el-table-column
            prop="className"
            label="班级"
            width="100%" align="center">
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
            prop="paySchoolYear"
            label="缴费学年-学期"
            width="110" align="center">
          </el-table-column>
          <el-table-column
            prop="paySchoolDate"
            label="缴费日期"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            prop="ifQMoney"
            label="是否欠费"
            width="80" align="center">
          </el-table-column>
          <el-table-column
            fixed="right"
            header-align="center"
            align="center"
            width="80"
            label="欠费操作">
            <template slot-scope="scope" >
              <el-button  type="text" size="small" @click="qMoneyHandle(scope.row.id)" >点击欠费</el-button>
            </template>
          </el-table-column>
          <el-table-column
            fixed="right"
            header-align="center"
            align="center"
            width="200"
            label="操作">
            <template slot-scope="scope">
<!--              <router-link :to="{name:'tuitionExpenseInfo',params:{index:scope.row.id}}">-->
                <el-button
                  type="text"
                  @click="handleDetail(scope.row.id,scope.row.paySchoolYear)">详情</el-button>
<!--              </router-link>-->
<!--              <router-link :to="{name:'tuitionExpenseEdit',params:{index:scope.row.id}}">-->
<!--                <el-button-->
<!--                  type="text"-->
<!--                  @click="handleEdit(scope.row.id)">修改</el-button>-->
<!--              </router-link>-->
              <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">编辑</el-button>
              <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
              <el-button type="text" size="small" @click="handleAttachment(scope.row.stuId)">附件</el-button>

            </template>
          </el-table-column>
        </el-table>

    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[20, 50, 100, 200]"
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
import AddOrUpdate from './feeschoolsundry-add-or-update'
import Add from './feeschoolsundry-add'
import OUTMany from './feeInfoOut'
import StuFeeImport from './stuFeeImport'
import StuFeeAttachment from './stuFeeAttachment'

export default {
  data () {
    return {
      importVisiable: false,
      outVisiable: false,
      attachmentVisiable: false,
      deptId: null,
      year: '',
      Visiableee: false,
      treeList: [],
      filterText: '',
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
      pageSize: 20,
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
    StuFeeImport,
    StuFeeAttachment
  },
  activated () {
    this.getDataList()
    this.getDeptTreeList()
  },
  methods: {
    filterNode (value, data, node) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    handleEdit () {
      this.$router.push('finance-tuitionExpenseEdit')
      // 处理修改逻辑
    },
    addSearchCondition () {
      this.searchConditions.push({
        option: '',
        value: ''
      })
      this.searchCount++
    },
    handleSearch () {
      this.pageIndex = 1
      this.pageSize = 20
      this.getDataList()
    },
    // 删除条件搜索栏目
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
      this.searchCount--
    },
    handleDetail (id, paySchoolYear) {
      // this.$nextTick(() => {
      //
      // })
      window.open(`#/finance-tuitionExpenseInfo?index=${id}&payYear=${paySchoolYear}`, '_blank')
      console.log(id,paySchoolYear)
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
      var stuNameOption = null
      var idNumberOption = null
      var schoolNumberOption = null
      var residenceTypeNameOption = null
      var isArrearageOption = null
      var derateTypeOption = null
      var yearOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        idNumberOption = this.searchConditions.filter(condition => condition.option === 'idNumber')
        schoolNumberOption = this.searchConditions.filter(condition => condition.option === 'schoolNumber')
        residenceTypeNameOption = this.searchConditions.filter(condition => condition.option === 'residenceTypeName')
        isArrearageOption = this.searchConditions.filter(condition => condition.option === 'isArrearage')
        derateTypeOption = this.searchConditions.filter(condition => condition.option === 'derateType')
        yearOption = this.searchConditions.filter(condition => condition.option === 'year')
      }
      this.$http({
        url: this.$http.adornUrl('/generator/feeschoolsundry/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'year': yearOption.length === 0 ? null : yearOption[0].value,
          'deptId': this.deptId,
          'stuName': stuNameOption.length === 0 ? null : stuNameOption[0].value,
          'idNumber': idNumberOption.length === 0 ? null : idNumberOption[0].value,
          'residenceTypeName': residenceTypeNameOption.length === 0 ? null : residenceTypeNameOption[0].value,
          'schoolNumber': schoolNumberOption.length === 0 ? null : schoolNumberOption[0].value,
          'isArrearage': isArrearageOption.length === 0 ? null : isArrearageOption[0].value,
          'derateType': derateTypeOption.length === 0 ? null : derateTypeOption[0].value
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
    },
    getDeptsByPid (data, node, item) {
      this.deptId = data.id
      this.pageIndex = 1
      this.pageSize = 20
      this.getDataList()
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
    // 新增
    addHandle (id) {
      this.addVisible = true
      this.$nextTick(() => {
        this.$refs.Add.init(id)
      })
    },
    handleImport () {
      this.importVisiable = true
      this.$nextTick(() => {
        this.$refs.dialog.init()
      })
    },
    handleAttachment (val) {
      this.attachmentVisiable = true
      this.$nextTick(() => {
        this.$refs.attachmentDialog.init(val)
      })
    },
    handleExport (id) {
      this.outVisiable = true
      var stuNameOption = null
      var idNumberOption = null
      var schoolNumberOption = null
      var residenceTypeNameOption = null
      var isArrearageOption = null
      var derateTypeOption = null
      var yearOption = null
      if (this.searchConditions != null && this.searchConditions.length >= 0) {
        stuNameOption = this.searchConditions.filter(condition => condition.option === 'stuName')
        idNumberOption = this.searchConditions.filter(condition => condition.option === 'idNumber')
        schoolNumberOption = this.searchConditions.filter(condition => condition.option === 'schoolNumber')
        residenceTypeNameOption = this.searchConditions.filter(condition => condition.option === 'residenceTypeName')
        isArrearageOption = this.searchConditions.filter(condition => condition.option === 'isArrearage')
        derateTypeOption = this.searchConditions.filter(condition => condition.option === 'derateType')
        yearOption = this.searchConditions.filter(condition => condition.option === 'year')
      }
      this.$nextTick(() => {
        this.$refs.outDialog.init(this.pageSize, this.pageIndex, yearOption.length === 0 ? null : yearOption[0].value,
          this.deptId, stuNameOption.length === 0 ? null : stuNameOption[0].value, idNumberOption.length === 0 ? null : idNumberOption[0].value,
          residenceTypeNameOption.length === 0 ? null : residenceTypeNameOption[0].value, schoolNumberOption.length === 0 ? null : schoolNumberOption[0].value,
          isArrearageOption.length === 0 ? null : isArrearageOption[0].value, derateTypeOption.length === 0 ? null : derateTypeOption[0].value
        )
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
    },
    qMoneyHandle (id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm(`确定进行[${id ? '欠费' : '批量欠费'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/feeschoolsundry/qMoneyHandle'),
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

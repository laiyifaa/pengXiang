<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth('stutemp:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('stutemp:delete')" type="danger" @click="deleteHandle()"
                   :disabled="dataListSelections.length <= 0">批量删除
        </el-button>
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
        prop="stuName"
        header-align="center"
        align="center"
        label="学生姓名">
      </el-table-column>
      <el-table-column
        prop="stuIdNumber"
        header-align="center"
        align="center"
        label="身份证号">
      </el-table-column>
      <el-table-column
        prop="academyInfo"
        header-align="center"
        align="center"
        label="报考院校">
      </el-table-column>
      <el-table-column
        prop="majorName"
        header-align="center"
        align="center"
        label="报考专业">
      </el-table-column>
      <el-table-column
        prop="gradeInfo"
        header-align="center"
        align="center"
        label="入学年级">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="考生状态"><!--：0未参加面试，1通过面试，2未通过面试-->
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="报名日期">
      </el-table-column>
      <el-table-column
        prop="ecoType"
        header-align="center"
        align="center"
        label="家庭困难类型">
      </el-table-column>
      <el-table-column
        prop="stipendType"
        header-align="center"
        align="center"
        label="免学费申请类型">
      </el-table-column>
      <el-table-column
        prop="enterTypeName"
        header-align="center"
        align="center"
        label="招生入学方式">
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
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList" :academyIdStu="academyIdStu"></add-or-update>
  </div>
</template>

<script>
import AddOrUpdate from './stutemp-add-or-update'

export default {
  data() {
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
      addOrUpdateVisible: false,
      academyIdStu: ''
    }
  },
  components: {
    AddOrUpdate
  },
  activated() {
    this.getDataList()
  },
  methods: {
    // 获取数据列表
    getDataList () {
      this.dataListLoading = true
      this.$http({
        url: this.$http.adornUrl('/generator/stutemp/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'key': this.dataForm.key
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          console.log(data)
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
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val
      this.pageIndex = 1
      this.getDataList()
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val
      this.getDataList()
    },
    // 多选
    selectionChangeHandle(val) {
      this.dataListSelections = val
    },
    // 新增 / 修改
    addOrUpdateHandle (id) {
      this.addOrUpdateVisible = true
      // console.log(typeof (id))
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id)
        this.academyIdStu = id
      })
    },
    // 删除
    deleteHandle(id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/stutemp/delete'),
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

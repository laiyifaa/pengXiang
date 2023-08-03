<template>
  <div class="mod-config">

    <el-row  :gutter="20">
      <el-col :span="3">
        <el-input
          placeholder="输入关键字进行过滤"
          style="width:90%"
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
        <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
          <el-form-item>
            <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
          </el-form-item>
          <el-form-item>
            <el-button @click="getDataList()">查询</el-button>
            <el-button v-if="isAuth('sysdept:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
            <el-button v-if="isAuth('sysdept:delete')" type="danger" @click="deleteHandle()"
                       :disabled="dataListSelections.length <= 0">批量删除
            </el-button>
          </el-form-item>
        </el-form>
        <el-table :header-cell-style="{color:'#3b3d3f'}"
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
            prop="name"
            header-align="center"
            align="center"
            label="名称">
          </el-table-column>
          <el-table-column
            prop="description"
            header-align="center"
            align="center"
            label="详细信息">
          </el-table-column>

          <el-table-column
            prop="deptTypeInfo"
            header-align="center"
            align="center"
            label="部门类型">
          </el-table-column>
          <el-table-column

            header-align="center"
            align="center"
            width="150"
            label="操作">
            <template slot-scope="scope">
              <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.deptId)">修改</el-button>
              <el-button type="text" size="small" @click="deleteHandle(scope.row.deptId)">删除</el-button>
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
  </div>
</template>

<script>
import AddOrUpdate from './sysdept-add-or-update'

export default {
  watch: {
    filterText (val) {
      this.$refs.tree.filter(val)
    }
  },
  data: function () {
    return {

      treeList: [],
      filterText: '',
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
      addOrUpdateVisible: false
    }
  },
  components: {
    AddOrUpdate
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
    // 获取数据列表
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
    getDataList () {
      this.dataListLoading = true
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/list'),
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
      this.getDeptTreeList()
    },

    getDeptsByPid (data, node, item) {
      this.$http({
        url: this.$http.adornUrl(`/generator/sysdept/getSubDeptsByPid/${data.id}`),
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
      this.getDataList()
      this.getDeptTreeList()
    },
    deleteHandle (id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.deptId
      })
      this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/sysdept/delete'),
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

<style>

.el-row {
  margin-bottom: 20px;

&
:last-child {
  margin-bottom: 0;
}

}
.el-col {
  border-radius: 4px;
}

.bg-purple-dark {
  background: #99a9bf;
}

.bg-purple {
  background: #d3dce6;
}

.bg-purple-light {
  background: #e5e9f2;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
</style>

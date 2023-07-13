<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
<!--        <el-button v-if="isAuth('stuclassinfo:save')" type="primary" @click="addOrUpdateHandle()">分配班级</el-button>-->
        <el-button v-if="isAuth('stuclassinfo:batchsave')" type="primary" @click="addHandle()" :disabled="batchDisabled">批量分配</el-button>
        <el-button v-if="isAuth('stuclassinfo:delete')" type="danger" @click="deleteHandle()"
                   :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="20">
      <el-col :span="6">
    <el-tree
      :data="treeList"
      node-key="id"
      :default-expanded-keys="[]"
      :default-checked-keys="[]"
      :props="defaultProps"
      @node-click="(data, node, item)=>getDeptsByPid(data, node, item)"
    >
    </el-tree>
      </el-col>
      <el-col :span="18">

        <el-table :data="dataList" border v-loading="dataListLoading" @selection-change="selectionChangeHandle"
                  style="width: 100%;">
          <el-table-column type="selection" header-align="center" align="center" width="50" v-model="selections">
          </el-table-column>
          <el-table-column prop="academyInfo" header-align="center" align="center" label="院校">
          </el-table-column>
          <el-table-column prop="majorInfo" header-align="center" align="center" label="专业">
          </el-table-column>
          <el-table-column prop="gradeInfo" header-align="center" align="center" label="年级">
          </el-table-column>
          <el-table-column prop="classInfo" header-align="center" align="center" label="班级">
          </el-table-column>
          <el-table-column prop="stuName" header-align="center" align="center" label="姓名">
          </el-table-column>
          <el-table-column prop="schoolNumber" header-align="center" align="center" label="学号">
          </el-table-column>
          <el-table-column fixed="right" header-align="center" align="center" width="150" label="操作">
            <template slot-scope="scope">
              <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row)">修改</el-button>
              <el-button type="text" size="small" @click="deleteHandle(scope.row.stuId)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination @size-change="sizeChangeHandle" @current-change="currentChangeHandle" :current-page="pageIndex"
                       :page-sizes="[10, 20, 50, 100]" :page-size="pageSize" :total="totalPage"
                       layout="total, sizes, prev, pager, next, jumper">
        </el-pagination>
      </el-col>
    </el-row>


    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
    <batch-add v-if="batchAddVisible" ref="batchAdd" @refreshDataList="getDataList"></batch-add>

  </div>
</template>

<script>
import AddOrUpdate from './stuclassinfo-add-or-update'
import BatchAdd from './stuclassinfo-batch-add'
export default {
  data() {
    return {
      deptId:0,
      level:0,
      batchDisabled:true,
      defaultProps: {
        children: 'children',
        label: 'label'
      },
      treeList:[],
      selections:[],
      dataForm: {
        key: ''
      },
      dataList: [],
      dataList2: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      addOrUpdateVisible: false,
      batchAddVisible: false
    }
  },
  components: {
    AddOrUpdate,
    BatchAdd
  },
  activated() {
      this.getDataList()
      this.getDeptTreeList()
  },
  methods: {
    getDeptsByPid(data, node, item) {
      console.log(data)
      console.log('---------------------')
      console.log(node)
      this.level = node.level
      this.deptId = node.key
      if(node.childNodes.length === 0){
        this.batchDisabled =false;
      }else{
        this.batchDisabled =true;
      }
      this.$http({
        url: this.$http.adornUrl(`/generator/stubaseinfo/list`),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'key': this.dataForm.key,
          'deptId': data.id
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.dataList = data.page.list
          console.log("datalist")
          console.log(this.dataList)
          this.totalPage = data.page.totalCount
        } else {
          this.dataList = []
          this.totalPage = 0
        }
        this.dataListLoading = false
      })
    },
    getDeptTreeList () {
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptTreeList3Level'),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.treeList = data.data
        }
      })
    },
    // 获取数据列表
    getDataList() {
      this.dataListLoading = true
      this.$http({
        url: this.$http.adornUrl('/generator/stuclassinfo/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'key': this.dataForm.key
        })
      }).then(({ data }) => {
        console.log("===================")
        console.log(data)
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
      var ids = this.dataListSelections.map(item => {
        return item.stuId
      })
      this.selections = ids
      console.log("ids----------------")
      console.log(ids)
    },
    // 新增 / 修改
    addOrUpdateHandle(data) {
      this.addOrUpdateVisible = true
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(data)
      })
    },
    // 批量分配
    addHandle() {
      this.batchAddVisible = true;
      setTimeout(()=>{
        this.$refs.batchAdd.init(this.deptId)
      })
      console.log("this deptID" + this.deptId)
    },
    // 删除
    deleteHandle(id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.stuId
      })
      this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/stuclassinfo/delete'),
          method: 'post',
          data: this.$http.adornData(ids, false)
        }).then(({ data }) => {
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

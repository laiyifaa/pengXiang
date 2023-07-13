<template>
  <div>
    <el-container>
      <el-header>
        <el-form :inline="true">
          <el-form-item>
            <el-input disabled placeholder="院校班级" style="width: 400px" v-model="message"/>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="getDataList">生成</el-button>
          </el-form-item>
        </el-form>
      </el-header>
      <el-container>
        <el-aside width="200px">
          <el-tree
            :data="treeList"
            node-key="id"
            :default-expanded-keys="[]"
            :default-checked-keys="[]"
            :props="defaultProps"
            @node-click="(data, node, item)=>getDeptsByPid(data, node, item)"
          >
          </el-tree>
        </el-aside>
        <el-main>
          <div class="successBox">
            <span>成功</span>
            <el-table
              :data="successList"
              border
              style="width: 100%;"
            >
              <el-table-column
                prop="stuName"
                label="学生姓名"
                align="center"
              ></el-table-column>
              <el-table-column
                prop="schoolNumber"
                label="学号"
                align="center"
              ></el-table-column>
            </el-table>
          </div>
          <div class="duplicateBox">
            <span>重复</span>
            <el-table
              :data="duplicateList"
              border
              style="width: 100%;"
            >
              <el-table-column
                prop="stuName"
                label="学生姓名"
                align="center"
              ></el-table-column>
              <el-table-column
                prop="schoolNumber"
                label="学号"
                align="center"
              ></el-table-column>
            </el-table>
          </div>
          <div class="failedBox">
            <span>失败</span>
            <el-table
              :data="failedList"
              border
              style="width: 100%;"
            >
              <el-table-column
                prop="stuName"
                label="学生姓名"
                align="center"
              ></el-table-column>
              <el-table-column
                prop="schoolNumber"
                label="学号"
                align="center"
              ></el-table-column>
            </el-table>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
  export default {
    name:'feestuneedpay',
    data(){
      return{
        treeList: [],
        successList:[],
        duplicateList:[],
        failedList:[],
        defaultProps: {
          children: 'children',
          label: 'label'
        },
        pageIndex:0,
        pageSize:0,
        dataForm:{},
        message:'',
        dataList:[],
      }
    },
    mounted () {
      this.getDeptTreeList()
    },
    methods:{
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
      getDeptsByPid(data, node, item) {
        // console.log(data)
        // console.log('---------------------')
        this.dataList = []
        this.dataForm = {}
        // console.log(node)
        this.dataForm.type = node.level
        this.dataForm.deptId = node.data.id
        while(node.parent!==null){
          this.dataList.push(node.data.label)
          node=node.parent
        }

        this.dataList = this.dataList.reverse()
        this.message = this.dataList.join('/')
        // console.log(this.dataList)
        // this.dataList.push(data.label)
        // this.$http({
        //   url: this.$http.adornUrl(`/generator/stubaseinfo/list`),
        //   method: 'get',
        //   params: this.$http.adornParams({
        //     'page': this.pageIndex,
        //     'limit': this.pageSize,
        //     'key': this.dataForm.key,
        //     'deptId': data.id
        //   })
      //   }).then(({data}) => {
      //     // console.log(data)
      //     if (data && data.code === 0) {
      //       this.dataList = data.page.list
      //       this.totalPage = data.page.totalCount
      //     } else {
      //       this.dataList = []
      //       this.totalPage = 0
      //     }
      //     this.dataListLoading = false
      //     // console.log(this.dataList)
      //   })
      },
      async getDataList(){
        this.$http({
          url: this.$http.adornUrl(`/generator/feestuneedpay/generateNeedPayListsByDeptId`),
          method: 'get',
          params: this.$http.adornParams({
            deptId:this.dataForm.deptId,
            type:this.dataForm.type
          })
        }).then(({data}) => {
          console.log(data)
          this.successList = data.data.success
          this.failedList = data.data.failed
          this.duplicateList = data.data.duplicate
        })
        // console.log(res)
      }
    }
  }
</script>
<style scoped>
  .el-header{
    margin: auto;
  }
  .successBox{
    margin-bottom: 20px;
  }

  .duplicateBox{
    margin-bottom: 20px;
  }
  span{
    display: block;
    text-align: center;
    margin-bottom: 10px;
    font-family: "PingFang SC",serif;
    font-size: 20px;
  }
</style>

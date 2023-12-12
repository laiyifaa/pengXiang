<template>
  <!--1.首先，弹窗页面中要有el-dialog组件即弹窗组件，我们把弹窗中的内容放在el-dialog组件中-->
  <!--2.设置:visible.sync属性，动态绑定一个布尔值，通过这个属性来控制弹窗是否弹出-->
  <el-dialog title="导出" :visible.sync="outVisible" width="50%">
    <div>
      <el-row :gutter="20">
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <div class="bcolor2"><u>导出当前页</u></div>
            <br>
            <el-row style="position: relative;left: 170px;">
              <el-button type="success" @click="exportData(false)">Excel导出</el-button>
            </el-row>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <div class="bcolor2"><u>导出所有</u></div>
            <br>
            <el-row style="position: relative;left: 170px;">
              <el-button type="success" @click="exportData(true)">Excel导出</el-button>
            </el-row>
          </div>
        </el-col>
      </el-row>
    </div>
  </el-dialog>
</template>

<script>
        export default {
          name: 'studentOut',
          data () {
            return {
              pageSize: null,
              pageIndex: null,
              stuName: null,
              idNumber: null,
              year: null,
              deptId: null,
              residenceTypeName: null,
              schoolNumber: null,
              isArrearage: null,
              derateType: null,
              outVisible: false
            }
          },
          methods: {
          // 3.定义一个init函数，通过设置detailVisible值为true来让弹窗弹出，这个函数会在父组件的方法中被调用
            init (pageSize, pageIndex, deptId, stuName, idNumber, residenceTypeName, schoolNumber, isArrearage, derateType) {
              this.outVisible = true
              this.pageSize = pageSize
              this.pageIndex = pageIndex
              this.derateType = derateType
              this.deptId = deptId
              this.stuName = stuName
              this.idNumber = idNumber
              this.residenceTypeName = residenceTypeName
              this.schoolNumber = schoolNumber
              this.isArrearage = isArrearage
            },
            exportData (isAll) {
              this.$confirm(`确定进行导出`, '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
              }).then(() => {
                this.$http({
                  url: this.$http.adornUrl('generator/feeschoolsundry/export'),
                  method: 'get',
                  params: this.$http.adornParams(
                    {
                      'page': this.pageIndex,
                      'limit': this.pageSize,
                      'deptId': this.deptId,
                      'stuName': this.stuName,
                      'idNumber': this.idNumber,
                      'residenceTypeName': this.residenceTypeName,
                      'schoolNumber': this.schoolNumber,
                      'isArrearage': this.isArrearage,
                      'derateType': this.derateType,
                      'isAll': isAll
                    }
                  ),
                  responseType: 'blob'
                }).then(response => {
                  const blob = new Blob([response.data], {
                    type: response.headers['content-type']
                  })
                  const url = window.URL.createObjectURL(blob)
                  const link = document.createElement('a')
                  link.href = url
                  link.setAttribute('download', isAll === true ? '所有学生学杂费信息.xlsx' : '当前页学生学杂费信息.xlsx')
                  document.body.appendChild(link)
                  link.click()
                  window.URL.revokeObjectURL(url)
                })
              })
            }
          }
        }
    </script>
    <style>
    .bcolor1{
        color: black;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
        border-right: darkcyan dashed 2px;
    }
   .bcolor1:active{
      color: blue;
   }
   .bcolor1:focus{
    color: brown;
   }
   .bcolor2{
        color: black;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
    }
   .bcolor2:active{
      color: blue;
   }
   .bcolor2:focus{
    color: brown;
   }
   .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: white;
  }
  .bg-purple {
    background: white;
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

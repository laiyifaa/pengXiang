<template>
  <!--1.首先，弹窗页面中要有el-dialog组件即弹窗组件，我们把弹窗中的内容放在el-dialog组件中-->
  <!--2.设置:visible.sync属性，动态绑定一个布尔值，通过这个属性来控制弹窗是否弹出-->
  <el-dialog title="导出" :visible.sync="outVisible" width="50%">
    <div>
      <el-row :gutter="20">
        <el-col :span="20">
          <div  class="grid-content bg-purple">

          <el-row style="position: relative;left: 400px;">
            <el-button size="medium" type="success" @click="handleExportAll()">Excel导出</el-button>
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
              ids: [],
              outVisible: false
            }
          },
          methods: {
          // 3.定义一个init函数，通过设置detailVisible值为true来让弹窗弹出，这个函数会在父组件的方法中被调用
            init (idList) {
              this.ids = idList
              this.outVisible = true
            },
            handleExportAll () {
              this.$confirm(`确定进行'批量导出'操作?（目前条件下所有）`, '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
              }).then(() => {
                this.$http({
                  url: this.$http.adornUrl('/generator/feereturn/exportInAll'),
                  method: 'post',
                  responseType: 'blob' // 指定响应类型为 Blob
                }).then(response => {
                  // 创建一个Blob对象
                  const blob = new Blob([response.data], { type: response.headers['content-type'] })

                  // 创建一个a标签用于下载
                  const url = window.URL.createObjectURL(blob)
                  const link = document.createElement('a')
                  link.href = url
                  let aData = new Date()
                  let dateValue = aData.getFullYear() + "-" + (aData.getMonth() + 1) + "-" + aData.getDate()
                  link.setAttribute('download', dateValue + '学生退费信息.xlsx')
                  document.body.appendChild(link)
                  // 触发点击事件下载文件
                  link.click()
                  this.$message.success("导出成功！")
                  // 释放对象URL资源
                  window.URL.revokeObjectURL(url)
                })
              })
            },
            handleExport () {
              this.$confirm(`确定进行导出`, '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
              }).then(() => {
                this.$http({
                  url: this.$http.adornUrl('/generator/feereturn/export'),
                  method: 'post',
                  data: this.ids,
                  responseType: 'blob' // 指定响应类型为 Blob
                }).then(response => {
                  // 创建一个Blob对象
                  const blob = new Blob([response.data], { type: response.headers['content-type'] })

                  if (response.data.size === 54) {
                    this.$message.error("未选择需要导出的学生数据，请返回进行选择")
                  } else {
                    // 创建一个a标签用于下载
                    const url = window.URL.createObjectURL(blob)
                    const link = document.createElement('a')
                    link.href = url
                    let aData = new Date()
                    let dateValue = aData.getFullYear() + "-" + (aData.getMonth() + 1) + "-" + aData.getDate()
                    link.setAttribute('download', dateValue + '学生退费信息.xlsx')
                    document.body.appendChild(link)
                    // 触发点击事件下载文件
                    link.click()

                    this.$message.success("导出成功！")
                    // 释放对象URL资源
                    window.URL.revokeObjectURL(url)
                  }
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

    .bg-purple {
    background: white;
  }

    .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
    </style>

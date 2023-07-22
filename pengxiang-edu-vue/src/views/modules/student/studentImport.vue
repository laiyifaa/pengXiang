<template>
    <!--1.首先，弹窗页面中要有el-dialog组件即弹窗组件，我们把弹窗中的内容放在el-dialog组件中-->
    <!--2.设置:visible.sync属性，动态绑定一个布尔值，通过这个属性来控制弹窗是否弹出-->
      <el-dialog title="导入" :visible.sync="detailVisible"
      width="700px"
      height="700px" >
        <div style="border:dashed 2px rgb(43, 226, 165);" width="700px"  >
            <div class="el-icon-upload "  ></div>
            <div class="box1">拖拽到此处也可上传</div>
            <div  class="but">
              <el-button type="primary">上传数据</el-button>
              <el-button type="primary" @click="downloadTemplate">模板文件下载</el-button>
            </div>
            <el-row :gutter="20" >
  <el-col :span="12"><div class="grid-content bg-purple" style="text-align: center;border-right: 2px dashed rgb(113, 111, 111);">素材格式<br>支持JPG/PNG/GIF</div></el-col>
  <el-col :span="12"><div class="grid-content bg-purple" style="text-align: center;">文件大小<br>单个5MG以内</div></el-col>

</el-row>

        </div>
      </el-dialog>
    </template>

    <script>
        export default {
          name: 'studentImport',
          data () {
            return {
              detailVisible: false
            }
          },
          methods: {
          // 3.定义一个init函数，通过设置detailVisible值为true来让弹窗弹出，这个函数会在父组件的方法中被调用
            init (data) {
              this.detailVisible = true
            },
            downloadTemplate () {
              this.$http({
                url: this.$http.adornUrl('/file/download/stu.xlsx'),
                method: 'get'
              }).then(response => {
                // 创建一个Blob对象
                const blob = new Blob([response.data], { type: response.headers['content-type'] })

                // 创建一个a标签用于下载
                const url = window.URL.createObjectURL(blob)
                const link = document.createElement('a')
                link.href = url
                link.setAttribute('download', 'stu.xlsx')
                document.body.appendChild(link)
                // 触发点击事件下载文件
                link.click()

                // 释放对象URL资源
                window.URL.revokeObjectURL(url)
      })
                .catch(error => {
                  console.error('下载文件失败:', error);
                })
            }
          }
        }
    </script>
    <style>
    .el-icon-upload {
        width: 200px; /* 设置icon宽度为32px */
        height: 200px; /* 设置icon高度为32px */
       font-size: 100px;
       position: relative;
       top: 100px;
       left: 270px;
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
  .but{

    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .box1{
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
  }



    </style>

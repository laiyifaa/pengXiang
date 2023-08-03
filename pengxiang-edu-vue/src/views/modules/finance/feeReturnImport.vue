<template>
  <!--1.首先，弹窗页面中要有el-dialog组件即弹窗组件，我们把弹窗中的内容放在el-dialog组件中-->
  <!--2.设置:visible.sync属性，动态绑定一个布尔值，通过这个属性来控制弹窗是否弹出-->
  <el-dialog title="导入" :visible.sync="detailVisible"
             width="700px"
             height="700px">
    <div style="border:dashed 2px rgb(43, 226, 165);" width="700px" @drop="handleDrop" @dragover.prevent>
      <div class="el-icon-upload" v-if="!selectedFile"></div>
      <div class="box1" v-if="!selectedFile">拖拽到此处上传</div>
      <div v-else>
        {{ selectedFile.name }}
        <span class="delete-btn" @click="deleteFile">X</span>
      </div>
      <div class="but">
        <input type="file" ref="fileInput" style="display: none" @change="handleFileChange">
        <el-button type="primary" @click="chooseFile">选择文件</el-button>
        <el-button type="primary" @click="uploadData">上传数据</el-button>
        <el-button type="primary" @click="downloadTemplate">模板文件下载</el-button>
      </div>
      <el-row :gutter="20">
        <el-col :span="12">
          <div class="grid-content bg-purple" style="text-align: center;border-right: 2px dashed rgb(113, 111, 111);">
            素材格式<br>支持excel
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple" style="text-align: center;">文件大小<br>单个5MG以内</div>
        </el-col>
      </el-row>
    </div>
  </el-dialog>
</template>

<script>
export default {
  name: 'enrollStuImport',
  data () {
    return {
      detailVisible: false,
      selectedFile: null
    }
  },
  methods: {
    chooseFile () {
      this.$refs.fileInput.click()
    },
    handleFileChange (event) {
      const file = event.target.files[0]
      this.selectedFile = file
    },
    handleDrop (event) {
      event.preventDefault()
      const file = event.dataTransfer.files[0]
      this.selectedFile = file
    },
    deleteFile () {
      this.selectedFile = null
    },
    init () {
      this.detailVisible = true
    },
    uploadData () {
      if (this.selectedFile === null) {
        this.$message.error('请拖拽文件文件后再上传！')
      } else {
        const formData = new FormData()
        formData.append('file', this.selectedFile)
        this.$http({
          url: this.$http.adornUrl('generator/feereturn/upload'),
          method: 'post',
          headers: {
            'Content-Type': 'multipart/form-data' // 设置正确的 Content-Type
          },
          data: formData
        }).then(({data}) => {
          this.$message.success('导入中，请耐心等待！')
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功，请刷新列表',
              type: 'success',
              duration: 4500,
              onClose: () => {
                this.getData()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      }
    },
    downloadTemplate () {
      this.$http({
        url: this.$http.adornUrl('file/download/excel/fee_return.xlsx'),
        method: 'get',
        responseType: 'blob'
      }).then(response => {
        const blob = new Blob([response.data], {
          type: response.headers['content-type']
        })
        const url = window.URL.createObjectURL(blob)
        const link = document.createElement('a')
        link.href = url
        link.setAttribute('download', '退费信息导入模版.xlsx')
        document.body.appendChild(link)
        link.click()
        this.$message.success("导出中，请耐心等待下载！")
        window.URL.revokeObjectURL(url)
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

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.but {

  height: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.box1 {
  height: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.delete-btn {
  color: red;
  cursor: pointer;
  margin-left: 8px;
}

.button-container button {
  margin: 0 5px;
}
</style>

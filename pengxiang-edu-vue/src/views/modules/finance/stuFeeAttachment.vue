<template>
  <!--1.首先，弹窗页面中要有el-dialog组件即弹窗组件，我们把弹窗中的内容放在el-dialog组件中-->
  <!--2.设置:visible.sync属性，动态绑定一个布尔值，通过这个属性来控制弹窗是否弹出-->
  <el-dialog   title="附件" :visible.sync="detailVisible"
                       width="700px"
                       height="700px">

    <span class="span" ><img  v-loading="dataListLoading" v-if="flag  === 1 " style="width: 100%;height: 50%" :src="content"/></span>
    <div style="border:dashed 2px rgb(43, 226, 165);" width="700px"   @drop="handleDrop" @dragover.prevent>

      <div class="el-icon-upload" v-if="!selectedFile"></div>
      <div class="box1" v-if="!selectedFile">拖拽到此处上传</div>
      <div v-else>
        {{ selectedFile.name }}
        <span class="delete-btn" @click="deleteFile">X</span>
      </div>

      <div class="but">
        <input type="file" ref="fileInput" style="display: none" @change="handleFileChange">
        <el-button type="primary" @click="chooseFile">选择图片文件</el-button>
        <el-button type="primary" @click="uploadData">上传数据</el-button>
      </div>
    </div>
  </el-dialog>
</template>

<script>
export default {
  name: 'enrollStuImport',
  data () {
    return {
      detailVisible: false,
      selectedFile: null,
      stuId: null,
      flag: 0,
      content: '',
      dataListLoading: true
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
    init (val) {
      this.detailVisible = true
      this.stuId = val
      this.selectedFile = null
      this.$http({
        url: this.$http.adornUrl('generator/feeschoolsundry/getImg'),
        method: 'get',
        responseType: 'blob',
        params: this.$http.adornParams({
          'stuId': this.stuId
        })
      }).then(response => {
        this.flag = 1
        let url = window.URL.createObjectURL(response.data)
        this.content = url
        this.dataListLoading = false
      }).catch(response => {
        // User clicked "Cancel" in the confirmation dialog
        this.flag = 0
      })
    },
    uploadData () {
      if (this.selectedFile === null) {
        this.$message.error('请拖拽文件文件后再上传！')
      } else {
        let uploadConfirmed = false // Flag to keep track of user confirmation
        this.$confirm('确定要上传文件吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // User clicked "OK" in the confirmation dialog, proceed with file upload
          uploadConfirmed = true // Set the flag to true
          const formData = new FormData()
          formData.append('file', this.selectedFile)
          formData.append('stuId', this.stuId)
          this.$http({
            url: this.$http.adornUrl('generator/feeschoolsundry/uploadImg'),
            method: 'post',
            headers: {
              'Content-Type': 'multipart/form-data'
            },
            data: formData
          }).then(({ data }) => {
            if (uploadConfirmed && data && data.code === 0) {
              this.$message({
                message: '操作成功，请刷新列表',
                type: 'success',
                duration: 2500,
                onClose: () => {
                  this.detailVisible = false
                }
              })
            } else if (uploadConfirmed && data) {
              this.$message.error(data.msg)
            }
          })
        }).catch(() => {
          // User clicked "Cancel" in the confirmation dialog
          uploadConfirmed = false // Set the flag to false
        })
      }
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


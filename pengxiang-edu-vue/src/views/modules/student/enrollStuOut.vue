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
      outVisible: false,
      pageIndex: null,
      pageSize: null,
      classType: null,
      enrollTeacher: null,
      admissionSeason: null,
      status: null,
      deptId: null
    }
  },
  methods: {
    // 3.定义一个init函数，通过设置detailVisible值为true来让弹窗弹出，这个函数会在父组件的方法中被调用
    init (i, j, k, l, m, n, d) {
      this.pageSize = i
      this.pageIndex = j
      this.classType = k
      this.enrollTeacher = l
      this.admissionSeason = m
      this.status = n
      this.deptId = d
      this.outVisible = true
    },
    exportData (isAll) {
      this.$confirm(`确定进行导出`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('stu/temp/export'),
          method: 'get',
          params: this.$http.adornParams(
            {
              'page': this.pageIndex,
              'limit': this.pageSize,
              'deptId': this.deptId,
              'classTypeName': this.classType,
              'enrollTeacher': this.enrollTeacher,
              'admissionSeason': this.admissionSeason,
              'statusName': this.status,
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
          link.setAttribute('download', isAll === true ? '所有考生信息.xlsx' : '当前页考生信息.xlsx')
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
.bcolor2 {
  color: black;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 20px;
}

.bcolor2:active {
  color: blue;
}

.bcolor2:focus {
  color: brown;
}
</style>

<template>
    <el-dialog :title="'批量分配班级'" :visible="this.$parent.batchAddVisible" :before-close="close">
      <div>{{this.description}}</div>
      <el-select v-model="value" placeholder="请选择">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
      <span slot="footer">
      <el-button @click="close">取消</el-button>
      <el-button type="primary" @click="batchSave">确定</el-button>
    </span>
    </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      description:'',
      classList: [],
      dataForm:{
        ids:[],
        classId:0,
      },

      options: [],
      value: ''
    }
  },
  methods: {
    close(){
      this.$parent.batchAddVisible = false;
    },
    init(id){
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptById/?id=${id}`),
        method: 'get'
      }).then(({data}) => {
        console.log("-----==========")
        console.log(data)
        this.description = data.data.description
        console.log(this.description)
      })
      this.$http({
        url: this.$http.adornUrl(`generator/sysdept/getDeptsByPid/?pid=${id}`),
        method: 'get'
      }).then(({data}) => {
        console.log(data)
        this.options = data.data
      })
    },
    batchSave(){
      console.log(this.$parent.selections)
      var selection = []
      this.$parent.selections.forEach(item =>{
        selection.push(item)
      })
      console.log(selection)
      this.$http({
        url: this.$http.adornUrl(`generator/stubaseinfo/batchSave`),
        method: 'post',
        data: this.$http.adornData({'ids': selection, 'deptId': this.value})
      }).then(({data}) => {
        this.options = data.data
        if (data && data.code === 0) {
          this.$message({
            message: '操作成功',
            type: 'success',
            duration: 1500,
            onClose: () => {
              this.close()
              this.$emit('refreshDataList')
            }
          })
        } else {
          this.$message.error(data.msg)
        }
      })
    }
  },
}
</script>

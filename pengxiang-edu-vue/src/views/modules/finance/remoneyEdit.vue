<template>

<div>

      <e-desc margin='0 12px' label-width='100px' title="退费信息编辑">
        <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>
//改成只精确到日期的时间选择器后端接收不了
        <e-desc-item label="退费时间">
          <el-date-picker v-model="feeReturnEntity.createTime"
                          type="datetime"
                          placeholder="选择日期"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          :default-time="['00:00:00', '23:59:59']"  ></el-date-picker>
        </e-desc-item>

      <e-desc-item label="退费学年"><el-input
         v-model="feeReturnEntity.returnSchoolYear"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费金额"><el-input
         v-model="feeReturnEntity.returnFeeNum"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退培训费"><el-input
         v-model="feeReturnEntity.trainFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退服装费"><el-input
         v-model="feeReturnEntity.clothesFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退教材费"><el-input
         v-model="feeReturnEntity.bookFee"
         clearable>
        </el-input></e-desc-item>

      <e-desc-item label="退住宿费"><el-input
         v-model="feeReturnEntity.hotelFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退被褥费"><el-input
         v-model="feeReturnEntity.bedFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退保险费"><el-input
         v-model="feeReturnEntity.insuranceFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退公物押金"><el-input
         v-model="feeReturnEntity.publicFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退证书费"><el-input
         v-model="feeReturnEntity.certificateFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退国防教育费"><el-input
         v-model="feeReturnEntity.defenseEduFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退体检费"><el-input
         v-model="feeReturnEntity.bodyExamFee"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费账户"><el-input
         v-model="feeReturnEntity.account"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费账号"><el-input
         v-model="feeReturnEntity.accountNumber"
         clearable>
        </el-input></e-desc-item>
      <e-desc-item label="退费开户行"><el-input
         v-model="feeReturnEntity.depositBank"
         clearable>
        </el-input></e-desc-item>
    </e-desc>
   <el-row style="padding: 50px;text-align: center;">

  <el-button type="success" @click="handleChange" >确认</el-button>


  <el-button type="info" @click = "returnBack">返回</el-button>

</el-row>
</div>

</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      imageUrl: '',
      formLabelWidth: '50px',
      info: null,
      feeReturnEntity: null,
      checkAll: false,
      checkedCities: ['上海', '北京'],
      isIndeterminate: true,
      activeNames: ['1'],
      f_activeNames: ['1'],
      f_workMessage: ['1'],
      f_tryWork: ['1'],
      money: ['1']
    }
  },
  mounted () {
    this.$http({
      url: this.$http.adornUrl('/generator/feereturn/getList'),
      method: 'get'
    }).then(response => {
      this.info = response.data.list.filter(item => item.schoolNumber === this.$route.params.schoolNumber)
      this.feeReturnEntity = this.info[0].feeReturnEntity
    })
      .catch(error => {
        console.error(error)
      })
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    },
    handleChange () {
      this.$confirm('确认提交吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/generator/feereturn/update'),
          method: 'put',
          data: this.feeReturnEntity
        }).then(response => {
        })
          .catch(error => {
            console.error(error)
          })
        }
      )
    }
  }
}
</script>
<style scoped>
.age{
  margin-top: 100px;
}

</style>

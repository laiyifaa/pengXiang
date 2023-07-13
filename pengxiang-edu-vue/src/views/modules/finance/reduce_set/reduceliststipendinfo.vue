<template>
  <div>
    <el-dialog
      title="详情"
      :close-on-click-modal="false"
      :visible.sync="stipendInfoVisible"
      >
      <el-form :model="stipendInfoForm" ref="dataForm"
               label-width="80px" disabled>
        <el-form-item label="免学费类型" prop="typeName">
          <el-input v-model="stipendInfoForm.typeName" placeholder="免学费类型"></el-input>
        </el-form-item>
        <el-form-item label="所属学院" v-show="isAcademy" >
          <el-select v-model="stipendInfoForm.academyId" placeholder="请选择">
            <el-option
              v-for="item in academyOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="扣减学费" prop="reduceTrainFee">
          <el-input v-model="stipendInfoForm.reduceTrainFee" placeholder="扣减学费"></el-input>
        </el-form-item>
        <el-form-item label="扣减服装费" prop="reduceClothesFee">
          <el-input v-model="stipendInfoForm.reduceClothesFee" placeholder="扣减服装费"></el-input>
        </el-form-item>
        <el-form-item label="扣减教材费" prop="reduceBookFee">
          <el-input v-model="stipendInfoForm.reduceBookFee" placeholder="扣减教材费"></el-input>
        </el-form-item>
        <el-form-item label="扣减住宿费" prop="reduceHotelFee">
          <el-input v-model="stipendInfoForm.reduceHotelFee" placeholder="扣减住宿费"></el-input>
        </el-form-item>
        <el-form-item label="扣减被褥费" prop="reduceBedFee">
          <el-input v-model="stipendInfoForm.reduceBedFee" placeholder="扣减被褥费"></el-input>
        </el-form-item>
        <el-form-item label="扣减保险费" prop="reduceInsuranceFee">
          <el-input v-model="stipendInfoForm.reduceInsuranceFee" placeholder="扣减保险费"></el-input>
        </el-form-item>
        <el-form-item label="扣减公物押金" prop="reducePublicFee">
          <el-input v-model="stipendInfoForm.reducePublicFee" placeholder="扣减公物押金"></el-input>
        </el-form-item>
        <el-form-item label="扣减证书费" prop="reduceCertificateFee">
          <el-input v-model="stipendInfoForm.reduceCertificateFee" placeholder="扣减证书费"></el-input>
        </el-form-item>
        <el-form-item label="扣减国防教育费" prop="reduceDefenseEduFee">
          <el-input v-model="stipendInfoForm.reduceDefenseEduFee" placeholder="扣减国防教育费"></el-input>
        </el-form-item>
        <el-form-item label="扣减体检费" prop="reduceBodyExamFee">
          <el-input v-model="stipendInfoForm.reduceBodyExamFee" placeholder="扣减体检费"></el-input>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'reduceliststipendinfo',
  data(){
    return{
      // stipendInfoVisible: false,
      academyOptions: [],
      isAcademy: false,
      dataForm: {
        id: 0,
        typeName: '',
        reduceTrainFee: '',
        reduceClothesFee: '',
        reduceBookFee: '',
        reduceHotelFee: '',
        reduceBedFee: '',
        reduceInsuranceFee: '',
        reducePublicFee: '',
        reduceCertificateFee: '',
        reduceDefenseEduFee: '',
        reduceBodyExamFee: '',
        academyId: null
      },
      stipendInformationVisible:false
    }
  },
  props:{
    stipendInfoForm:{
      type:Object,
      default(){
        return{}
      }
    },
    stipendInfoVisible:{
      type:Boolean,
      default :''

    }
  },
  watch:{
    stipendInfoVisible(news,olds){
      this.stipendInformationVisible = news
    }
  },
  mounted () {
    this.getAcademyList()
  },
  methods:{
    getAcademyList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/academyList'),
        method: 'get'
      }).then(({data}) => {
        // console.log(data)
        this.academyOptions = data.data
        console.log(this.academyOptions)
      })
      console.log(this.$store.state.user)
      if (this.$store.state.user.academyId === -1) {
        this.isAcademy = true
      } else {
        this.isAcademy = false
      }
    },
    init (id) {
      this.dataForm.id = id || 0
      this.stipendInfoVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/generator/reduceliststipend/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.typeName = data.reduceListstipend.typeName
              this.dataForm.reduceTrainFee = data.reduceListstipend.reduceTrainFee
              this.dataForm.reduceClothesFee = data.reduceListstipend.reduceClothesFee
              this.dataForm.reduceBookFee = data.reduceListstipend.reduceBookFee
              this.dataForm.reduceHotelFee = data.reduceListstipend.reduceHotelFee
              this.dataForm.reduceBedFee = data.reduceListstipend.reduceBedFee
              this.dataForm.reduceInsuranceFee = data.reduceListstipend.reduceInsuranceFee
              this.dataForm.reducePublicFee = data.reduceListstipend.reducePublicFee
              this.dataForm.reduceCertificateFee = data.reduceListstipend.reduceCertificateFee
              this.dataForm.reduceDefenseEduFee = data.reduceListstipend.reduceDefenseEduFee
              this.dataForm.reduceBodyExamFee = data.reduceListstipend.reduceBodyExamFee
              this.dataForm.academyId = data.reduceListstipend.academyId
            }
          })
        }
      })
    },
  }
}
</script>

<style scoped>

</style>

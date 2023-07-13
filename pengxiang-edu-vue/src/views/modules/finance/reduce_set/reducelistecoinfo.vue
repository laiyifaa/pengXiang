<template>
  <div>
    <el-dialog
      title="详情"
      :close-on-click-modal="false"
      :visible.sync="ecoInfoVisible"
      >
      <el-form :model="ecoInfoForm" ref="dataForm"
               label-width="80px" disabled>
        <el-form-item label="家庭困难类型" prop="typeName">
          <el-input v-model="ecoInfoForm.typeName" placeholder="助学金类型"></el-input>
        </el-form-item>
        <el-form-item label="所属学院" v-show="isAcademy" >
          <el-select v-model="ecoInfoForm.academyId" placeholder="请选择">
            <el-option
              v-for="item in academyOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="扣减学费" prop="reduceTrainFee">
          <el-input v-model="ecoInfoForm.reduceTrainFee" placeholder="扣减学费"></el-input>
        </el-form-item>
        <el-form-item label="扣减服装费" prop="reduceClothesFee">
          <el-input v-model="ecoInfoForm.reduceClothesFee" placeholder="扣减服装费"></el-input>
        </el-form-item>
        <el-form-item label="扣减教材费" prop="reduceBookFee">
          <el-input v-model="ecoInfoForm.reduceBookFee" placeholder="扣减教材费"></el-input>
        </el-form-item>
        <el-form-item label="扣减住宿费" prop="reduceHotelFee">
          <el-input v-model="ecoInfoForm.reduceHotelFee" placeholder="扣减住宿费"></el-input>
        </el-form-item>
        <el-form-item label="扣减被褥费" prop="reduceBedFee">
          <el-input v-model="ecoInfoForm.reduceBedFee" placeholder="扣减被褥费"></el-input>
        </el-form-item>
        <el-form-item label="扣减保险费" prop="reduceInsuranceFee">
          <el-input v-model="ecoInfoForm.reduceInsuranceFee" placeholder="扣减保险费"></el-input>
        </el-form-item>
        <el-form-item label="扣减公物押金" prop="reducePublicFee">
          <el-input v-model="ecoInfoForm.reducePublicFee" placeholder="扣减公物押金"></el-input>
        </el-form-item>
        <el-form-item label="扣减证书费" prop="reduceCertificateFee">
          <el-input v-model="ecoInfoForm.reduceCertificateFee" placeholder="扣减证书费"></el-input>
        </el-form-item>
        <el-form-item label="扣减国防教育费" prop="reduceDefenseEduFee">
          <el-input v-model="ecoInfoForm.reduceDefenseEduFee" placeholder="扣减国防教育费"></el-input>
        </el-form-item>
        <el-form-item label="扣减体检费" prop="reduceBodyExamFee">
          <el-input v-model="ecoInfoForm.reduceBodyExamFee" placeholder="扣减体检费"></el-input>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'reducelistecoinfo',
  data(){
    return{
      // ecoInfoVisible: false,
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
      ecoInformationVisible:false
    }
  },
  props:{
    ecoInfoForm:{
      type:Object,
      default(){
        return{}
      }
    },
    ecoInfoVisible:{
      type:Boolean,
      default :''

    }
  },
  watch:{
    ecoInfoVisible(news,olds){
      this.ecoInformationVisible = news
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
      this.ecoInfoVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/generator/reducelisteco/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.typeName = data.reduceListEco.typeName
              this.dataForm.reduceTrainFee = data.reduceListEco.reduceTrainFee
              this.dataForm.reduceClothesFee = data.reduceListEco.reduceClothesFee
              this.dataForm.reduceBookFee = data.reduceListEco.reduceBookFee
              this.dataForm.reduceHotelFee = data.reduceListEco.reduceHotelFee
              this.dataForm.reduceBedFee = data.reduceListEco.reduceBedFee
              this.dataForm.reduceInsuranceFee = data.reduceListEco.reduceInsuranceFee
              this.dataForm.reducePublicFee = data.reduceListEco.reducePublicFee
              this.dataForm.reduceCertificateFee = data.reduceListEco.reduceCertificateFee
              this.dataForm.reduceDefenseEduFee = data.reduceListEco.reduceDefenseEduFee
              this.dataForm.reduceBodyExamFee = data.reduceListEco.reduceBodyExamFee
              this.dataForm.academyId = data.reduceListEco.academyId
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

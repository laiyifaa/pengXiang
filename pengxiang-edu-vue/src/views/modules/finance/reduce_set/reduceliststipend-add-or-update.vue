<template>
  <el-dialog :title="!dataForm.id ? '新增' : '修改'" :close-on-click-modal="false" :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
      label-width="120px" label-position="left">
      <el-form-item label="免学费类型" prop="typeName">
        <el-input v-model="dataForm.typeName" placeholder="免学费类型"></el-input>
      </el-form-item>
      <el-form-item label="所属学院" v-show="isAcademy">
        <el-select v-model="dataForm.academyId" placeholder="请选择">
          <el-option v-for="item in academyOptions" :key="item.value" :label="item.label" :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="扣减学费" prop="reduceTrainFee">
        <el-input v-model="dataForm.reduceTrainFee" placeholder="扣减学费"></el-input>
      </el-form-item>
      <el-form-item label="扣减服装费" prop="reduceClothesFee">
        <el-input v-model="dataForm.reduceClothesFee" placeholder="扣减服装费"></el-input>
      </el-form-item>
      <el-form-item label="扣减教材费" prop="reduceBookFee">
        <el-input v-model="dataForm.reduceBookFee" placeholder="扣减教材费"></el-input>
      </el-form-item>
      <el-form-item label="扣减住宿费" prop="reduceHotelFee">
        <el-input v-model="dataForm.reduceHotelFee" placeholder="扣减住宿费"></el-input>
      </el-form-item>
      <el-form-item label="扣减被褥费" prop="reduceBedFee">
        <el-input v-model="dataForm.reduceBedFee" placeholder="扣减被褥费"></el-input>
      </el-form-item>
      <el-form-item label="扣减保险费" prop="reduceInsuranceFee">
        <el-input v-model="dataForm.reduceInsuranceFee" placeholder="扣减保险费"></el-input>
      </el-form-item>
      <el-form-item label="扣减公物押金" prop="reducePublicFee">
        <el-input v-model="dataForm.reducePublicFee" placeholder="扣减公物押金"></el-input>
      </el-form-item>
      <el-form-item label="扣减证书费" prop="reduceCertificateFee">
        <el-input v-model="dataForm.reduceCertificateFee" placeholder="扣减证书费"></el-input>
      </el-form-item>
      <el-form-item label="扣减国防教育费" prop="reduceDefenseEduFee">
        <el-input v-model="dataForm.reduceDefenseEduFee" placeholder="扣减国防教育费"></el-input>
      </el-form-item>
      <el-form-item label="扣减体检费" prop="reduceBodyExamFee">
        <el-input v-model="dataForm.reduceBodyExamFee" placeholder="扣减体检费"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      visible: false,
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
      dataRule: {
        typeName: [
          { required: true, message: '免学费类型不能为空', trigger: 'blur' }
        ],
        reduceTrainFee: [
          { required: true, message: '扣减学费不能为空', trigger: 'blur' }
        ],
        reduceClothesFee: [
          { required: true, message: '扣减服装费不能为空', trigger: 'blur' }
        ],
        reduceBookFee: [
          { required: true, message: '扣减教材费不能为空', trigger: 'blur' }
        ],
        reduceHotelFee: [
          { required: true, message: '扣减住宿费不能为空', trigger: 'blur' }
        ],
        reduceBedFee: [
          { required: true, message: '扣减被褥费不能为空', trigger: 'blur' }
        ],
        reduceInsuranceFee: [
          { required: true, message: '扣减保险费不能为空', trigger: 'blur' }
        ],
        reducePublicFee: [
          { required: true, message: '扣减公物押金不能为空', trigger: 'blur' }
        ],
        reduceCertificateFee: [
          { required: true, message: '扣减证书费不能为空', trigger: 'blur' }
        ],
        reduceDefenseEduFee: [
          { required: true, message: '扣减国防教育费不能为空', trigger: 'blur' }
        ],
        reduceBodyExamFee: [
          { required: true, message: '扣减体检费不能为空', trigger: 'blur' }
        ]
      },
      // 选择器options
      academyOptions: [],
      isAcademy: false,
    }
  },
  mounted() {
    this.getAcademyList()
  },
  methods: {
    init(id) {
      this.dataForm.id = id || 0
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/generator/reduceliststipend/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.dataForm.typeName = data.reduceListStipend.typeName
              this.dataForm.reduceTrainFee = data.reduceListStipend.reduceTrainFee
              this.dataForm.reduceClothesFee = data.reduceListStipend.reduceClothesFee
              this.dataForm.reduceBookFee = data.reduceListStipend.reduceBookFee
              this.dataForm.reduceHotelFee = data.reduceListStipend.reduceHotelFee
              this.dataForm.reduceBedFee = data.reduceListStipend.reduceBedFee
              this.dataForm.reduceInsuranceFee = data.reduceListStipend.reduceInsuranceFee
              this.dataForm.reducePublicFee = data.reduceListStipend.reducePublicFee
              this.dataForm.reduceCertificateFee = data.reduceListStipend.reduceCertificateFee
              this.dataForm.reduceDefenseEduFee = data.reduceListStipend.reduceDefenseEduFee
              this.dataForm.reduceBodyExamFee = data.reduceListStipend.reduceBodyExamFee
              this.dataForm.academyId = data.reduceListStipend.academyId
            }
          })
        }
      })
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.$http({
            url: this.$http.adornUrl(`/generator/reduceliststipend/${!this.dataForm.id ? 'save' : 'update'}`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id || undefined,
              'typeName': this.dataForm.typeName,
              'reduceTrainFee': this.dataForm.reduceTrainFee,
              'reduceClothesFee': this.dataForm.reduceClothesFee,
              'reduceBookFee': this.dataForm.reduceBookFee,
              'reduceHotelFee': this.dataForm.reduceHotelFee,
              'reduceBedFee': this.dataForm.reduceBedFee,
              'reduceInsuranceFee': this.dataForm.reduceInsuranceFee,
              'reducePublicFee': this.dataForm.reducePublicFee,
              'reduceCertificateFee': this.dataForm.reduceCertificateFee,
              'reduceDefenseEduFee': this.dataForm.reduceDefenseEduFee,
              'reduceBodyExamFee': this.dataForm.reduceBodyExamFee,
              'academyId': this.dataForm.academyId
            })
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.visible = false
                  this.$emit('refreshDataList')
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        }
      })
    },
    // 学院列表获取
    getAcademyList() {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/academyList'),
        method: 'get'
      }).then(({ data }) => {
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
    // 获取数据列表
    // getDeptTreeList () {
    //   this.$http({
    //     url: this.$http.adornUrl('/generator/sysdept/getDeptTreeList'),
    //     method: 'get'
    //   }).then(({data}) => {
    //     if (data && data.code === 0) {
    //       this.treeList = data.data
    //     }
    //   })
    // },
    // getDeptsByPid (data, node, item) {
    //   // console.log(data)
    //   this.$http({
    //     url: this.$http.adornUrl(`/generator/sysdept/getSubDeptsByPid/${data.id}`),
    //     method: 'get'
    //   }).then(({data}) => {
    //     // console.log(data)
    //     this.dataList = data.data
    //   })
    // },
    closeDialog() {
      this.dataForm.academyId = null
    }
  }
}
</script>

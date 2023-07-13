<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    @close="refreshDataForm"
  >
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="100px">
<!--    <el-form-item label="院校id" prop="academyId">
      <el-input v-model="dataForm.academyId" placeholder="院校id"></el-input>
    </el-form-item>-->
<!--      <el-form-item label="院校" v-show="isSchool" prop="academyInfo">-->
<!--        <el-select v-model="dataForm.academyInfo" placeholder="请选择">-->
<!--          <el-option-->
<!--            v-for="item in schoolOptions"-->
<!--            :key="item.value"-->
<!--            :label="item.label"-->
<!--            :value="item.label">-->
<!--          </el-option>-->
<!--        </el-select>-->
<!--      </el-form-item>-->
<!--    <el-form-item label="" prop="deptId">
      <el-input v-model="dataForm.deptId" placeholder=""></el-input>
    </el-form-item>-->
<!--    <el-form-item label="专业" prop="major">
      <el-input v-model="dataForm.major" placeholder="专业"></el-input>
    </el-form-item>-->
      <el-form-item label="专业-年级" prop="dept">
        <el-cascader
          :options="this.$parent.treeList"
          :placeholder="'请选择专业年级'"
          v-model="treeNode"
          :props="{value:'id'}"
          @change="handleChange"
        ></el-cascader>
      </el-form-item>
      <!--    <el-form-item label="年级" prop="grade">
      <el-input v-model="dataForm.grade" placeholder="年级"></el-input>
    </el-form-item>-->
<!--    <el-form-item label="1-升学，2-就业" prop="classType">
      <el-input v-model="dataForm.classType" placeholder="1-升学，2-就业"></el-input>
    </el-form-item>-->
      <el-form-item label="班级类型" prop="classType">
        <el-select v-model="dataForm.classType" placeholder="请选择">
          <el-option
            v-for="item in classTypeOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>
    <el-form-item label="学制" prop="schoolSystem">
      <el-input v-model="dataForm.schoolSystem" placeholder="学制"></el-input>
    </el-form-item>
    <el-form-item label="学年数" prop="schoolYear">
      <el-input v-model="dataForm.schoolYear" placeholder="学年数"></el-input>
    </el-form-item>
    <el-form-item label="培训费" prop="trainFee">
      <el-input v-model="dataForm.trainFee" placeholder="培训费"></el-input>
    </el-form-item>
    <el-form-item label="服装费" prop="clothesFee">
      <el-input v-model="dataForm.clothesFee" placeholder="服装费"></el-input>
    </el-form-item>
    <el-form-item label="教材费" prop="bookFee">
      <el-input v-model="dataForm.bookFee" placeholder="教材费"></el-input>
    </el-form-item>
    <el-form-item label="住宿费" prop="hotelFee">
      <el-input v-model="dataForm.hotelFee" placeholder="住宿费"></el-input>
    </el-form-item>
    <el-form-item label="被褥费" prop="bedFee">
      <el-input v-model="dataForm.bedFee" placeholder="被褥费"></el-input>
    </el-form-item>
    <el-form-item label="保险费" prop="insuranceFee">
      <el-input v-model="dataForm.insuranceFee" placeholder="保险费"></el-input>
    </el-form-item>
    <el-form-item label="公物押金" prop="publicFee">
      <el-input v-model="dataForm.publicFee" placeholder="公物押金"></el-input>
    </el-form-item>
    <el-form-item label="证书费" prop="certificateFee">
      <el-input v-model="dataForm.certificateFee" placeholder="证书费"></el-input>
    </el-form-item>
    <el-form-item label="国防教育费" prop="defenseEduFee">
      <el-input v-model="dataForm.defenseEduFee" placeholder="国防教育费"></el-input>
    </el-form-item>
    <el-form-item label="体检费" prop="bodyExamFee">
      <el-input v-model="dataForm.bodyExamFee" placeholder="体检费"></el-input>
    </el-form-item>
<!--    <el-form-item label="创建时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="更新时间" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder="更新时间"></el-input>
    </el-form-item>
    <el-form-item label="创建人" prop="createBy">
      <el-input v-model="dataForm.createBy" placeholder="创建人"></el-input>
    </el-form-item>
    <el-form-item label="修改人" prop="updateBy">
      <el-input v-model="dataForm.updateBy" placeholder="修改人"></el-input>
    </el-form-item>
    <el-form-item label="是否删除" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder="是否删除"></el-input>
    </el-form-item>-->
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        treeNode: [],
        visible: false,
        dataForm: {
          id: 0,
          academyId: '',
          academyInfo:'',
          deptId: '',
          gradeId: '',
          majorId: '',
          classType: '',
          schoolSystem: '',
          schoolYear: '',
          trainFee: '',
          clothesFee: '',
          bookFee: '',
          hotelFee: '',
          bedFee: '',
          insuranceFee: '',
          publicFee: '',
          certificateFee: '',
          defenseEduFee: '',
          bodyExamFee: '',
          createTime: '',
          updateTime: '',
          createBy: '',
          updateBy: '',
          isDeleted: ''
        },
        dataRule: {
          academyId: [
            { required: true, message: '院校id不能为空', trigger: 'blur' }
          ],
          academyInfo: [
            { required: true, message: '院校不能为空', trigger: 'blur' }
          ],
          deptId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          grade: [
            { required: true, message: '年级不能为空', trigger: 'blur' }
          ],
          major: [
            { required: true, message: '专业不能为空', trigger: 'blur' }
          ],
          classType: [
            { required: true, message: '1-升学，2-就业不能为空', trigger: 'blur' }
          ],
          schoolSystem: [
            { required: true, message: '学制不能为空', trigger: 'blur' }
          ],
          schoolYear: [
            { required: true, message: '学年数不能为空', trigger: 'blur' }
          ],
          trainFee: [
            { required: true, message: '培训费不能为空', trigger: 'blur' }
          ],
          clothesFee: [
            { required: true, message: '服装费不能为空', trigger: 'blur' }
          ],
          bookFee: [
            { required: true, message: '教材费不能为空', trigger: 'blur' }
          ],
          hotelFee: [
            { required: true, message: '住宿费不能为空', trigger: 'blur' }
          ],
          bedFee: [
            { required: true, message: '被褥费不能为空', trigger: 'blur' }
          ],
          insuranceFee: [
            { required: true, message: '保险费不能为空', trigger: 'blur' }
          ],
          publicFee: [
            { required: true, message: '公物押金不能为空', trigger: 'blur' }
          ],
          certificateFee: [
            { required: true, message: '证书费不能为空', trigger: 'blur' }
          ],
          defenseEduFee: [
            { required: true, message: '国防教育费不能为空', trigger: 'blur' }
          ],
          bodyExamFee: [
            { required: true, message: '体检费不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '更新时间不能为空', trigger: 'blur' }
          ],
          createBy: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          updateBy: [
            { required: true, message: '修改人不能为空', trigger: 'blur' }
          ],
          isDeleted: [
            { required: true, message: '是否删除不能为空', trigger: 'blur' }
          ]
        },
        classTypeOptions:[{
        value: 0,
        label: '升学'
        },
        {
          value: 1,
          label: '就业'
        }],

        // schoolOptions:[],
        // isSchool: true,
         isAcademy: true,
      }
    },
    mounted () {
      // this.getMajorList()
      // this.getSchoolList()
    },
    updated () {

    },
    methods: {
      refreshDataForm (){
        this.treeNode=[]
      },


      handleChange () {
        this.dataForm.academyId = this.treeNode[0]
        this.dataForm.majorId = this.treeNode[1]
        this.dataForm.gradeId = this.treeNode[2]

      },
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/generator/feestandard/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.treeNode = [data.feeStandard.academyId,data.feeStandard.majorId,data.feeStandard.gradeId]
                this.dataForm.academyId = data.feeStandard.academyId
                this.dataForm.academyInfo = data.feeStandard.academyInfo
                this.dataForm.deptId = data.feeStandard.deptId
                this.dataForm.grade = data.feeStandard.grade
                this.dataForm.major = data.feeStandard.major
                this.dataForm.classType = data.feeStandard.classType
                this.dataForm.schoolSystem = data.feeStandard.schoolSystem
                this.dataForm.schoolYear = data.feeStandard.schoolYear
                this.dataForm.trainFee = data.feeStandard.trainFee
                this.dataForm.clothesFee = data.feeStandard.clothesFee
                this.dataForm.bookFee = data.feeStandard.bookFee
                this.dataForm.hotelFee = data.feeStandard.hotelFee
                this.dataForm.bedFee = data.feeStandard.bedFee
                this.dataForm.insuranceFee = data.feeStandard.insuranceFee
                this.dataForm.publicFee = data.feeStandard.publicFee
                this.dataForm.certificateFee = data.feeStandard.certificateFee
                this.dataForm.defenseEduFee = data.feeStandard.defenseEduFee
                this.dataForm.bodyExamFee = data.feeStandard.bodyExamFee
                this.dataForm.createTime = data.feeStandard.createTime
                this.dataForm.updateTime = data.feeStandard.updateTime
                this.dataForm.createBy = data.feeStandard.createBy
                this.dataForm.updateBy = data.feeStandard.updateBy
                this.dataForm.isDeleted = data.feeStandard.isDeleted
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/generator/feestandard/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'academyId': this.dataForm.academyId,
                'academyInfo': this.dataForm.academyInfo,
                'deptId': this.dataForm.deptId,
                'gradeId': this.dataForm.gradeId,
                'majorId': this.dataForm.majorId,
                'classType': this.dataForm.classType,
                'schoolSystem': this.dataForm.schoolSystem,
                'schoolYear': this.dataForm.schoolYear,
                'trainFee': this.dataForm.trainFee,
                'clothesFee': this.dataForm.clothesFee,
                'bookFee': this.dataForm.bookFee,
                'hotelFee': this.dataForm.hotelFee,
                'bedFee': this.dataForm.bedFee,
                'insuranceFee': this.dataForm.insuranceFee,
                'publicFee': this.dataForm.publicFee,
                'certificateFee': this.dataForm.certificateFee,
                'defenseEduFee': this.dataForm.defenseEduFee,
                'bodyExamFee': this.dataForm.bodyExamFee,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime,
                'createBy': this.dataForm.createBy,
                'updateBy': this.dataForm.updateBy,
                'isDeleted': this.dataForm.isDeleted
              })
            }).then(({data}) => {
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

      // 学校列表获取
      // getSchoolList () {
      //   // console.log('getAcademyList')
      //   this.$http({
      //     url: this.$http.adornUrl('/generator/feestandard/schoolList'),
      //     method: 'get'
      //   }).then(({data}) => {
      //     console.log(data)
      //     this.schoolOptions = data.data
      //   })
      //   if (this.$store.state.user.academyId === -1) {
      //     this.isSchool = true
      //   } else {
      //     this.isSchool = false
      //   }
      // },

    }
  }
</script>

<template>
  <div>
    <span style="margin: 50px ;font-size: larger;font-weight: bolder;">招生信息编辑</span>
    <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>
    <e-desc margin='0 12px' label-width='120px'>
      <e-desc-item label="姓名">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="身份证号">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="出生日期">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="性别">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="民族">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="籍贯">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="政治面貌">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="联系电话">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="入学前技能水平">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="入学学历">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="毕业学校">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="户口性质">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="电子邮件">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="证件类型">
        <el-input
          placeholder=""
          v-model="dataForm"
          clearable>
        </el-input>
      </e-desc-item>
    </e-desc>
    <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>
    <e-desc margin='0 12px' label-width='120px'>
    <e-desc-item label="年级">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    <e-desc-item label="招生季">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    <e-desc-item label="专业">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    <e-desc-item label="学制">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    <e-desc-item label="招生老师">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    <e-desc-item label="招生老师部门">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    <e-desc-item label="招生老师电话">
      <el-input
        placeholder=""
        v-model="dataForm"
        clearable>
      </el-input>
    </e-desc-item>
    </e-desc>
    <el-row style="padding: 50px;text-align: center;">

        <el-button
          type="success"
          @click="returnBack">确认
        </el-button>

        <el-button type="info" @click="returnBack">返回</el-button>

    </el-row>

  </div>
</template>

<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'

export default {
  name: 'enrollStuEdit',
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      dataForm: ''
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    },
    handleEdit (row) {
      this.$router.push('/enrollStuList')
    }
  }
}
</script>

<style>
</style>

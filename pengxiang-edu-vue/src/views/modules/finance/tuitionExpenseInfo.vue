<template>
  <div>

    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">

      <e-desc-item label="学号" >{{ info.wx}}</e-desc-item>
      <e-desc-item label="姓名" >{{info.name}}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item  label="年龄">{{ info.age }}</e-desc-item>
      <e-desc-item label="性别">{{ info.sex }}</e-desc-item>
      <e-desc-item label="民族">汉族</e-desc-item>
      <e-desc-item label="籍贯">浙江省杭州市</e-desc-item>
      <e-desc-item label="户口性质">农村</e-desc-item>
      <e-desc-item label="政治面貌">党员</e-desc-item>
      <e-desc-item label="联系电话">18333665566</e-desc-item>
      <e-desc-item label="系部">计算机系</e-desc-item>
      <e-desc-item label="专业">{{ info.major }}</e-desc-item>
      <e-desc-item label="班型">就业班</e-desc-item>
      <e-desc-item label="班级">专业1班</e-desc-item>
      <e-desc-item label="班主任">{{ info.hobby }}</e-desc-item>
      <e-desc-item label="班主任电话">18333665566</e-desc-item>
      <e-desc-item label="电子邮件">@.com</e-desc-item>
    </e-desc>
    <el-collapse v-model="money"  >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学杂费收支情况</span>
        </template>
        <el-tabs type="border-card">
          <el-tab-pane label="第一学年缴费详情">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <e-desc-item label="缴费学年"> 2023 </e-desc-item>
              <e-desc-item label="减免类型">  贫困生减免</e-desc-item>
              <e-desc-item label="应缴培训费" color="#"  > 100 </e-desc-item>
              <e-desc-item label="实缴培训费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴服装费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴服装费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴教材费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴教材费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴住宿费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴住宿费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴被褥费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴被褥费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴证书费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴证书费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴国防教育费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴国防教育费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴体检费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴体检费" color="#" > 100 </e-desc-item>
              <e-desc-item label="减免金额" color="#"> 100 </e-desc-item>
              <e-desc-item label="减免备注" color="#"> 贫困生减免 </e-desc-item>
              <e-desc-item label="返费时间" color="#"> 2023-07-08 </e-desc-item>
              <e-desc-item label="应返费金额" color="#"> 200 </e-desc-item>
              <e-desc-item label="返费金额" color="#"> 200 </e-desc-item>
              <e-desc-item label="返费账户" color="#"> 朱博伦 </e-desc-item>
              <e-desc-item label="返费账号" color="#"> 202222254658748567 </e-desc-item>
              <e-desc-item label="返费开户行" color="#"> 中国农业银行 </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第二学年缴费详情">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <e-desc-item label="缴费学年"> 2023 </e-desc-item>
              <e-desc-item label="减免类型">贫困生减免  </e-desc-item>
              <e-desc-item label="应缴培训费" color="#"  > 100 </e-desc-item>
              <e-desc-item label="实缴培训费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴服装费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴服装费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴教材费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴教材费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴住宿费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴住宿费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴被褥费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴被褥费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴证书费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴证书费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴国防教育费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴国防教育费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴体检费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴体检费" color="#" > 100 </e-desc-item>
              <e-desc-item label="减免金额" color="#"> 100 </e-desc-item>
              <e-desc-item label="减免备注" color="#"> 贫困生减免 </e-desc-item>
              <e-desc-item label="返费时间" color="#"> 2023-07-08 </e-desc-item>
              <e-desc-item label="应返费金额" color="#"> 200 </e-desc-item>
              <e-desc-item label="返费金额" color="#"> 200 </e-desc-item>
              <e-desc-item label="返费账户" color="#"> 朱博伦 </e-desc-item>
              <e-desc-item label="返费账号" color="#"> 202222254658748567 </e-desc-item>
              <e-desc-item label="返费开户行" color="#"> 中国农业银行 </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第三学年缴费详情">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <e-desc-item label="缴费学年"> 2023 </e-desc-item>
              <e-desc-item label="减免类型">  贫困生减免</e-desc-item>
              <e-desc-item label="应缴培训费" color="#"  > 100 </e-desc-item>
              <e-desc-item label="实缴培训费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴服装费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴服装费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴教材费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴教材费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴住宿费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴住宿费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴被褥费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴被褥费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴证书费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴证书费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴国防教育费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴国防教育费" color="#" > 100 </e-desc-item>
              <e-desc-item label="应缴体检费" color="#" > 100 </e-desc-item>
              <e-desc-item label="实缴体检费" color="#" > 100 </e-desc-item>
              <e-desc-item label="减免金额" color="#"> 100 </e-desc-item>
              <e-desc-item label="减免备注" color="#"> 贫困生减免 </e-desc-item>

              <e-desc-item label="返费时间" color="#"> 2023-07-08 </e-desc-item>
              <e-desc-item label="应返费金额" color="#"> 200 </e-desc-item>
              <e-desc-item label="返费金额" color="#"> 200 </e-desc-item>
              <e-desc-item label="返费账户" color="#"> 朱博伦 </e-desc-item>
              <e-desc-item label="返费账号" color="#"> 202222254658748567 </e-desc-item>
              <e-desc-item label="返费开户行" color="#"> 中国农业银行 </e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>

      </el-collapse-item>
    </el-collapse>
    <div class="button-container">
      <button class="custom-button" @click="returnBack">返回</button>
    </div>
  </div>

</template>


<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
const cityOptions = ['学生详情', '贫困情况', '缴费信息', '评定信息', '就业信息', '实习信息']
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      formLabelWidth: '50px',
      info: {
        name: 'Jerry',
        age: 26,
        sex: '男',
        school: '廊坊学校',
        major: '铁路专业',
        address: '四川省成都市',
        hobby: '朱博伦',
        phone: 33030419980953011,
        wx: '202230603042',
        qq: 332983810
      },
      checkAll: false,
      checkedCities: ['上海', '北京'],
      cities: cityOptions,
      isIndeterminate: true,
      activeNames: ['1'],
      f_activeNames: ['1'],
      f_workMessage: ['1'],
      f_tryWork: ['1'],
      money: ['1']
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    }
  }
}
</script>
<style scoped>
.button-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 10vh;
}

.custom-button {
  padding: 10px 20px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.custom-button:hover {
  background-color: #45a049;
}

.custom-button:active {
  background-color: #3e8e41;
}
</style>

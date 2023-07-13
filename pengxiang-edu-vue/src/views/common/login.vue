<template>
  <div>

    <e-desc margin='0 12px' label-width='100px' title="学生详情">
      <e-desc-item class="age" label="姓名" style="height: 100px">{{info.name}}</e-desc-item>
      <e-desc-item class="age" label="年龄"style="height: 100px">{{ info.age }}岁</e-desc-item>
      <e-desc-item label="头像" style="height: 200px"><img src="https://ts1.cn.mm.bing.net/th/id/R-C.11d9d6918b13f601743f6862114ca8ba?rik=2wWgN4hvojV1xg&riu=http%3a%2f%2fimg.crcz.com%2fallimg%2f201809%2f09%2f1536428316466077.jpg&ehk=NCgFtou7hOFty%2bjRT8V1GZm%2fE38suUV279Ks%2fVya%2bJ0%3d&risl=&pid=ImgRaw&r=0"/></e-desc-item>
      <e-desc-item label="性别">{{ info.sex }}</e-desc-item>
      <e-desc-item label="学校">{{ info.school }}</e-desc-item>
      <e-desc-item label="专业">{{ info.major }}</e-desc-item>
      <e-desc-item label="班主任">{{ info.hobby }}</e-desc-item>
      <e-desc-item label="宿舍楼号">2</e-desc-item>
      <e-desc-item label="房间号">132</e-desc-item>
      <e-desc-item label="床位号">2</e-desc-item>
      <e-desc-item label="入住日期">2023.6.5</e-desc-item>
      <e-desc-item label="离宿日期">2023.6.5</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item label="学号">{{ info.wx}}</e-desc-item>
      <e-desc-item label="籍贯">浙江省杭州市</e-desc-item>
      <e-desc-item label="民族">汉族</e-desc-item>
      <e-desc-item label="联系电话">18333665566</e-desc-item>
      <e-desc-item label="家庭联系人">18333665566</e-desc-item>
      <e-desc-item label="家庭住址">浙江杭州</e-desc-item>
      <e-desc-item label="家庭年总收入（元）">8000</e-desc-item>
      <e-desc-item label="家庭人均收入（元）">6000</e-desc-item>
      <e-desc-item label="家庭经济来源">务农</e-desc-item>
      <e-desc-item label="学制">4年制</e-desc-item>
      <e-desc-item label="招生季">春季</e-desc-item>
      <e-desc-item label="政治面貌">党员</e-desc-item>
      <e-desc-item label="入学日期">2022.6.1</e-desc-item>
      <e-desc-item label="注册学籍日期">2022.6.1</e-desc-item>
      <e-desc-item label="当前状态">在校</e-desc-item>
      <e-desc-item label="是否提前入学">是</e-desc-item>
      <e-desc-item label="操作" :span='3'>
        <template>
          <el-button size="small" type="primary" @click="handleEdit()">修改</el-button>
        </template>
      </e-desc-item>
    </e-desc>

    <el-collapse v-model="money" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">贫困情况</span>
        </template>
        <e-desc margin='0 12px' label-width='100px' >
          <e-desc-item label="户口性质" contentEditable>农村</e-desc-item>
          <e-desc-item label="是否家庭困难" contentEditable> 否</e-desc-item>
          <e-desc-item label="家庭困难类型" contentEditable> 无 </e-desc-item>
          <e-desc-item label="资助申请类型" contentEditable>无</e-desc-item>
          <e-desc-item label="操作" :span='3' >
            <template >
              <el-button size="small" type="primary">修改</el-button>
            </template>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="activeNames" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">缴费信息</span>
        </template>
        <e-desc margin='0 12px' label-width='100px'  >
          <e-desc-item label="第一学年应收小计" contentEditable>{{100}}</e-desc-item>
          <e-desc-item label="第二学年应收小计" contentEditable>{{ 100}}</e-desc-item>
          <e-desc-item label="第三学年应收小计" contentEditable>{{ 100 }}</e-desc-item>
          <e-desc-item label="退费金额" contentEditable>{{ 100 }}</e-desc-item>
          <e-desc-item label="欠费合计" contentEditable>{{ 100 }}</e-desc-item>
          <e-desc-item label="操作" :span='3'>
            <template>
              <el-button size="small" type="primary">修改</el-button>
            </template>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>
    <el-collapse v-model="f_activeNames" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">评定信息</span>
        </template>
        <e-desc margin='0 12px' label-width='100px' >
          <e-desc-item label="第一学期评定" contentEditable>优秀</e-desc-item>
          <e-desc-item label="第二学期评定" contentEditable> 优秀</e-desc-item>
          <e-desc-item label="第三学期评定" contentEditable> 优秀 </e-desc-item>
          <e-desc-item label="第四学期评定" contentEditable>优秀</e-desc-item>
          <e-desc-item label="第五学期评定" contentEditable> 优秀 </e-desc-item>
          <e-desc-item label="第六学期评定" contentEditable> 优秀 </e-desc-item>
          <e-desc-item label="操作" :span='3' >
            <template >
              <el-button size="small" type="primary">修改</el-button>
            </template>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="f_workMessage" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">就业信息</span>
        </template>
        <e-desc margin='0 12px' label-width='100px' >
          <e-desc-item label="就业单位" contentEditable>阿里</e-desc-item>
          <e-desc-item label="就业岗位" contentEditable> 开发</e-desc-item>
          <e-desc-item label="试用期限" contentEditable> 1年 </e-desc-item>
          <e-desc-item label="试用期薪酬" contentEditable>8000</e-desc-item>
          <e-desc-item label="转正薪酬" contentEditable> 12000 </e-desc-item>
          <e-desc-item label="岗位负责人" contentEditable> 朱博伦 </e-desc-item>
          <e-desc-item label="回访日期" contentEditable> 2023.7.4 </e-desc-item>
          <e-desc-item label="是否在岗" contentEditable> 是 </e-desc-item>
          <e-desc-item label="是否对岗位满意" contentEditable> 满意 </e-desc-item>
          <e-desc-item label="学生就业工作情况" contentEditable> 在职 </e-desc-item>
          <e-desc-item label="离职原因" contentEditable> 无 </e-desc-item>
          <e-desc-item label="是否需要二次就业" contentEditable> 不需要 </e-desc-item>
          <e-desc-item label="二次就业分配时间" contentEditable> 无 </e-desc-item>
          <e-desc-item label="就业单位" contentEditable> 无 </e-desc-item>
          <e-desc-item label="就业岗位" contentEditable> 无 </e-desc-item>
          <e-desc-item label="试用期限" contentEditable> 无 </e-desc-item>
          <e-desc-item label="试用期薪酬" contentEditable> 无 </e-desc-item>
          <e-desc-item label="转正薪酬" contentEditable> 无 </e-desc-item>
          <e-desc-item label="岗位负责人" contentEditable> 无 </e-desc-item>
          <e-desc-item label="操作" :span='3' >
            <template >
              <el-button size="small" type="primary">修改</el-button>
            </template>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="f_tryWork" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">实习信息</span>
        </template>
        <e-desc margin='0 12px' label-width='100px' >
          <e-desc-item label="实习类别" contentEditable>推荐</e-desc-item>
          <e-desc-item label="实习单位" contentEditable> 阿里</e-desc-item>
          <e-desc-item label="实习报酬" contentEditable> 8000 </e-desc-item>
          <e-desc-item label="实习岗位" contentEditable>开发</e-desc-item>
          <e-desc-item label="实习离校日期" contentEditable> 2023.6.1 </e-desc-item>
          <e-desc-item label="预计实习结束日期" contentEditable> 2023.8.1 </e-desc-item>
          <e-desc-item label="实际实习结束日期" contentEditable> 2023.8.1 </e-desc-item>
          <e-desc-item label="学生实习鉴定结果" contentEditable> 合格 </e-desc-item>
          <e-desc-item label="是否对岗位满意" contentEditable> 满意 </e-desc-item>
          <e-desc-item label="带队教师" contentEditable> 朱博伦 </e-desc-item>
          <e-desc-item label="操作" :span='3' >
            <template >
              <el-button size="small" type="primary">修改</el-button>
            </template>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-dialog title="编辑用户"
               :visible.sync="dialogFormVisible"
    >
      <el-form :model="form">
        <e-desc margin='0 12px' label-width='120px' title="学生详情">
          <e-desc-item label="姓名" contenteditable="">{{info.name}}</e-desc-item>
          <e-desc-item label="年龄" contenteditable="" >{{ info.age }}岁</e-desc-item>
          <e-desc-item label="性别" contenteditable="">{{ info.sex }}</e-desc-item>
          <e-desc-item label="学校" contenteditable="">{{ info.school }}</e-desc-item>
          <e-desc-item label="专业" contenteditable="">{{ info.major }}</e-desc-item>
          <e-desc-item label="班主任" contenteditable="">{{ info.hobby }}</e-desc-item>
          <e-desc-item label="宿舍楼号" contenteditable="">2</e-desc-item>
          <e-desc-item label="房间号" contenteditable="">132</e-desc-item>
          <e-desc-item label="床位号" contenteditable="">2</e-desc-item>
          <e-desc-item label="入住日期" contenteditable="">2023.6.5</e-desc-item>
          <e-desc-item label="离宿日期" contenteditable="">2023.6.5</e-desc-item>
          <e-desc-item label="身份证号码" contenteditable="" >{{ info.phone }}</e-desc-item>
          <e-desc-item label="学号" contenteditable="">{{ info.wx}}</e-desc-item>
          <e-desc-item label="籍贯" contenteditable="">浙江省杭州市</e-desc-item>
          <e-desc-item label="民族" contenteditable="">汉族</e-desc-item>
          <e-desc-item label="联系电话" contenteditable="">18333665566</e-desc-item>
          <e-desc-item label="家庭联系人" contenteditable="">18333665566</e-desc-item>
          <e-desc-item label="家庭住址" contenteditable="">浙江杭州</e-desc-item>
          <e-desc-item label="家庭年总收入（元）" contenteditable="">8000</e-desc-item>
          <e-desc-item label="家庭人均收入（元）" contenteditable="">6000</e-desc-item>
          <e-desc-item label="家庭经济来源" contenteditable="">务农</e-desc-item>
          <e-desc-item label="学制" contenteditable="">4年制</e-desc-item>
          <e-desc-item label="招生季" contenteditable="">春季</e-desc-item>
          <e-desc-item label="政治面貌" contenteditable="">党员</e-desc-item>
          <e-desc-item label="入学日期" contenteditable="">2022.6.1</e-desc-item>
          <e-desc-item label="注册学籍日期" contenteditable="">2022.6.1</e-desc-item>
          <e-desc-item label="当前状态" contenteditable="">在校</e-desc-item>
          <e-desc-item label="是否提前入学" contenteditable="">是</e-desc-item>
        </e-desc>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary"
                   @click="dialogFormVisible = false">确 定</el-button>
      </div>
    </el-dialog>


    <div>
      <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
      <div style="margin: 15px 0;"></div>
      <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
        <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox>
      </el-checkbox-group>
    </div>
    <el-button type="primary" @click="open" style="margin-left:50%">信息导出</el-button>
  </div>

</template>


<script>
import EDesc from './EDesc'
import EDescItem from './EDescItem'
const cityOptions = ['学生详情', '贫困情况', '缴费信息', '评定信息','就业信息','实习信息'];
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      imageUrl: '',
      dialogFormVisible: false,
      form: {
        account: "",
        username: "",
        id: ""
      },
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
    handleChange(){

    },
    errorHandler() {
      return true
    },
    handleEdit () {
      this.dialogFormVisible = true
    },
    open() {
      this.$confirm('是否导出已选择的模块信息', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        this.$message({
          type: 'success',
          message: '导出成功!'
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消导出'
        });
      });
    },
    handleCheckAllChange(val) {
      this.checkedCities = val ? cityOptions : [];
      this.isIndeterminate = false;
    },
    handleCheckedCitiesChange(value) {
      let checkedCount = value.length;
      this.checkAll = checkedCount === this.cities.length;
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
    }
  }
}
</script>
<style scoped>
.age{
  margin-top: 100px;
}

</style>

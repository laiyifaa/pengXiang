<template>
  <div>
    <e-desc margin='0 12px' label-width='150px' title="学生详情" column="4">
      <e-desc-item  label="姓名" >{{info.name}}</e-desc-item>
      <e-desc-item label="年龄" >{{ info.age }}</e-desc-item>
<!--      <e-desc-item label="头像" style="height: 200px"><img src="https://ts1.cn.mm.bing.net/th/id/R-C.11d9d6918b13f601743f6862114ca8ba?rik=2wWgN4hvojV1xg&riu=http%3a%2f%2fimg.crcz.com%2fallimg%2f201809%2f09%2f1536428316466077.jpg&ehk=NCgFtou7hOFty%2bjRT8V1GZm%2fE38suUV279Ks%2fVya%2bJ0%3d&risl=&pid=ImgRaw&r=0"/></e-desc-item>-->
      <e-desc-item label="性别">{{ info.sex }}</e-desc-item>



      <e-desc-item label="身份证号码">{{ info.phone }}</e-desc-item>
      <e-desc-item label="证件类型">大陆居民身份证</e-desc-item>

      <e-desc-item label="政治面貌">党员</e-desc-item>
      <e-desc-item label="籍贯">浙江省杭州市</e-desc-item>
      <e-desc-item label="民族">汉族</e-desc-item>
      <e-desc-item label="联系电话">18333665566</e-desc-item>
      <e-desc-item label="户口性质">农村</e-desc-item>
      <e-desc-item label="入学前技能水平">无</e-desc-item>
      <e-desc-item label="入学学历">初中</e-desc-item>
      <e-desc-item label="毕业学校">xxxx中学</e-desc-item>
<!--      <e-desc-item label="操作" :span='3'>
        <template>
          <el-button size="small" type="primary" @click="handleEdit()">修改</el-button>
        </template>
      </e-desc-item>-->
    </e-desc>

    <el-collapse v-model="stuStatus" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生学籍信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px' column="4" >
          <e-desc-item label="学号">{{ info.wx}}</e-desc-item>
          <e-desc-item label="学校">{{ info.school }}</e-desc-item>
          <e-desc-item label="专业">{{ info.major }}</e-desc-item>
          <e-desc-item label="学制">3年制</e-desc-item>
          <e-desc-item label="培养层次">中级</e-desc-item>
          <e-desc-item label="当前状态">在校</e-desc-item>
          <e-desc-item label="学籍状态">在籍在册</e-desc-item>
          <e-desc-item label="招生季">春季</e-desc-item>
          <e-desc-item label="入学日期">2022.03.01</e-desc-item>
          <e-desc-item label="注册学籍日期">2022.03.02</e-desc-item>
          <e-desc-item label="是否提前入学">是</e-desc-item>
          <e-desc-item label="年级">2022</e-desc-item>
          <e-desc-item label="系部">计算机系</e-desc-item>
          <e-desc-item label="专业">ai</e-desc-item>
          <e-desc-item label="班型">升学班</e-desc-item>
          <e-desc-item label="班级">升学班1班</e-desc-item>

          <e-desc-item label="班主任">{{ info.hobby }}</e-desc-item>
          <e-desc-item label="班主任电话">18333665566</e-desc-item>
          <e-desc-item label="班主任所属部门">无</e-desc-item>
          <!--          <e-desc-item label="操作" :span='3' >
                      <template >
                        <el-button size="small" type="primary">修改</el-button>
                      </template>
                    </e-desc-item>-->
        </e-desc>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="room" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">住宿信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px' column="4"  >
          <e-desc-item label="宿舍楼号" >1</e-desc-item>
          <e-desc-item label="房间号" > 111</e-desc-item>
          <e-desc-item label="床位号" > 2 </e-desc-item>
          <e-desc-item label="入住日期" >2023.07.15</e-desc-item>
          <e-desc-item label="离宿日期" >2023.08.15</e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="money" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">家庭信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="是否家庭困难" > 否</e-desc-item>
          <e-desc-item label="家庭困难类型" > 无 </e-desc-item>
          <e-desc-item label="资助申请类型" >无</e-desc-item>
          <e-desc-item label="身份证地址" >无</e-desc-item>
          <e-desc-item label="家庭联系人" >朱博伦</e-desc-item>
          <e-desc-item label="邮编" >323232</e-desc-item>
          <e-desc-item label="家庭住址" >xxxxxxx</e-desc-item>
          <e-desc-item label="家庭联系电话" >123545</e-desc-item>
          <e-desc-item label="家庭年总收入（元）" >123545</e-desc-item>
          <e-desc-item label="家庭人均收入（元）" >123545</e-desc-item>
          <e-desc-item label="家庭经济来源" >农村</e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>
    <el-collapse v-model="f_activeNames" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">评定信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="第一学期评定" >优秀</e-desc-item>
          <e-desc-item label="第二学期评定" > 优秀</e-desc-item>
          <e-desc-item label="第三学期评定" > 优秀 </e-desc-item>
          <e-desc-item label="第四学期评定" >优秀</e-desc-item>
          <e-desc-item label="第五学期评定" > 优秀 </e-desc-item>
          <e-desc-item label="第六学期评定" > 优秀 </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="activeNames" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">缴费信息</span>
        </template>
        <el-tabs type="border-card">
          <el-tab-pane label="第一学年缴费详情">
            <e-desc margin='0 12px' label-width='150px' column="4" >
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
            <e-desc margin='0 12px' label-width='150px' column="4" >
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
            <e-desc margin='0 12px' label-width='150px' column="4" >
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


    <el-collapse v-model="f_workMessage" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">就业信息</span>
        </template>
        <el-tabs type="border-card">
          <el-tab-pane label="就业详情">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="离校日期" >{{ empInfo.leaveDate}}</e-desc-item>
              <e-desc-item label="离校原因" >{{empInfo.leaveReason}}</e-desc-item>
              <e-desc-item label="就业单位">{{ empInfo.empcpl }}</e-desc-item>
              <e-desc-item  label=" 就业岗位">{{ empInfo.empjob }}</e-desc-item>
              <e-desc-item label="试用期薪酬">{{ empInfo.befmon}}</e-desc-item>
              <e-desc-item label="转正薪酬">{{ empInfo.aftmon}}</e-desc-item>
              <e-desc-item label="岗位负责人">{{empInfo.resp}}</e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第一次回访">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="回访日期" >{{ callBack.prop1}}</e-desc-item>
              <e-desc-item label="是否在岗" >{{callBack.prop2}}</e-desc-item>
              <e-desc-item label="是否对岗位满意">{{callBack.prop3 }}</e-desc-item>
              <e-desc-item  label="学生就业工作情况">{{ callBack.prop4 }}</e-desc-item>
              <e-desc-item label="离职原因">{{ callBack.prop5 }}</e-desc-item>
              <e-desc-item label="是否需要二次就业">{{ callBack.prop6 }}</e-desc-item>
              <e-desc-item label="二次就业分配时间">{{callBack.prop7}}</e-desc-item>
              <e-desc-item label="就业单位" >{{ callBack.prop8 }}</e-desc-item>
              <e-desc-item label="就业岗位" >{{callBack.prop9}}</e-desc-item>
              <e-desc-item label="试用期限">{{ callBack.prop10 }}</e-desc-item>
              <e-desc-item  label="试用期薪酬">{{ callBack.prop11 }}</e-desc-item>
              <e-desc-item label="转正薪酬">{{ callBack.prop12}}</e-desc-item>
              <e-desc-item label="岗位负责人">{{ callBack.prop13}}</e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第二次回访">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="回访日期" >{{ callBack.prop1}}</e-desc-item>
              <e-desc-item label="是否在岗" >{{callBack.prop2}}</e-desc-item>
              <e-desc-item label="是否对岗位满意">{{callBack.prop3 }}</e-desc-item>
              <e-desc-item  label="学生就业工作情况">{{ callBack.prop4 }}</e-desc-item>
              <e-desc-item label="离职原因">{{ callBack.prop5 }}</e-desc-item>
              <e-desc-item label="是否需要二次就业">{{ callBack.prop6 }}</e-desc-item>
              <e-desc-item label="二次就业分配时间">{{callBack.prop7}}</e-desc-item>
              <e-desc-item label="就业单位" >{{ callBack.prop8 }}</e-desc-item>
              <e-desc-item label="就业岗位" >{{callBack.prop9}}</e-desc-item>
              <e-desc-item label="试用期限">{{ callBack.prop10 }}</e-desc-item>
              <e-desc-item  label="试用期薪酬">{{ callBack.prop11 }}</e-desc-item>
              <e-desc-item label="转正薪酬">{{ callBack.prop12}}</e-desc-item>
              <e-desc-item label="岗位负责人">{{ callBack.prop13}}</e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="f_tryWork" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">实习信息</span>
        </template>
        <el-tabs type="border-card" >
          <el-tab-pane label="第一阶段实习">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="实习类别" >{{ empInfo.pro1}}</e-desc-item>
              <e-desc-item label="实习单位" >{{empInfo.pro2}}</e-desc-item>
              <e-desc-item label="实习报酬">{{ empInfo.pro3 }}</e-desc-item>
              <e-desc-item  label="实习岗位">{{ empInfo.pro4 }}</e-desc-item>
              <e-desc-item label="实习离校日期">{{ empInfo.pro5}}</e-desc-item>
              <e-desc-item label="预计实习结束日期">{{ empInfo.pro6}}</e-desc-item>
              <e-desc-item label="实际实习结束日期">{{empInfo.pro7}}</e-desc-item>
              <e-desc-item label="学生实习鉴定结果" >{{ empInfo.pro8}}</e-desc-item>
              <e-desc-item label="是否对岗位满意" >{{empInfo.pro9}}</e-desc-item>
              <e-desc-item label="带队教师">{{ empInfo.pro10 }}</e-desc-item>
              <e-desc-item  label="带队教师电话">{{ empInfo.pro11 }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane label="第一阶段实习">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="实习类别" >{{ empInfo.pro1}}</e-desc-item>
              <e-desc-item label="实习单位" >{{empInfo.pro2}}</e-desc-item>
              <e-desc-item label="实习报酬">{{ empInfo.pro3 }}</e-desc-item>
              <e-desc-item  label="实习岗位">{{ empInfo.pro4 }}</e-desc-item>
              <e-desc-item label="实习离校日期">{{ empInfo.pro5}}</e-desc-item>
              <e-desc-item label="预计实习结束日期">{{ empInfo.pro6}}</e-desc-item>
              <e-desc-item label="实际实习结束日期">{{empInfo.pro7}}</e-desc-item>
              <e-desc-item label="学生实习鉴定结果" >{{ empInfo.pro8}}</e-desc-item>
              <e-desc-item label="是否对岗位满意" >{{empInfo.pro9}}</e-desc-item>
              <e-desc-item label="带队教师">{{ empInfo.pro10 }}</e-desc-item>
              <e-desc-item  label="带队教师电话">{{ empInfo.pro11 }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>


    <div>
      <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
      <div style="margin: 15px 0;"></div>
      <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
        <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox>
      </el-checkbox-group>
    </div>
    <el-button type="primary" @click="open" style="margin-left:50%">信息导出</el-button>
    <button class="custom-button" @click="returnBack">返回</button>
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
      imageUrl: '',
      dialogFormVisible: false,
      form: {
        account: '',
        username: '',
        id: ''
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
      money: ['1'],
      stuStatus: ['1'],
      room: ['1'],
      empInfo: {
        pro1: '短期实习',
        pro2: '字节跳动',
        pro3: '7000',
        pro4: '开发',
        pro5: '2023-02-06',
        pro6: '2023-08-06',
        pro7: '2023-08-06',
        pro8: '合格',
        pro9: '满意',
        pro10: '王德发',
        pro11: '15715166898',
        leaveDate: '2023-07-02',
        leaveReason: '毕业',
        empcpl: '字节跳动',
        empjob: '开发',
        befmon: 7000,
        aftmon: 10000,
        resp: '朱博伦'
      },
      callBack: {
        prop1: '2023-1-1',
        prop2: '是',
        prop3: '是',
        prop4: '已就业',
        prop5: '无',
        prop6: '不需要',
        prop7: '---',
        prop8: '字节跳动',
        prop9: '开发',
        prop10: '2024-06',
        prop11: '7000',
        prop12: '10000',
        prop13: '王德发'
      }
    }
  },
  methods: {
    returnBack () {
      this.$router.go(-1)
    },
    handleChange () {

    },
    errorHandler () {
      return true
    },
    handleEdit () {
      this.dialogFormVisible = true
    },
    open () {
      this.$confirm('是否导出已选择的模块信息', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        this.$message({
          type: 'success',
          message: '导出成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消导出'
        })
      })
    },
    handleCheckAllChange (val) {
      this.checkedCities = val ? cityOptions : []
      this.isIndeterminate = false
    },
    handleCheckedCitiesChange (value) {
      let checkedCount = value.length
      this.checkAll = checkedCount === this.cities.length
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length
    }
  }
}
</script>
<style scoped>
.age{
  margin-top: 100px;
}

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

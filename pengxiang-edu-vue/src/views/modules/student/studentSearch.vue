<template>
  <div>
    <div>
      <el-dialog title="学生信息" :visible.sync="dialogTableVisible" width="80%">
        <el-table :data="gridData"  v-loading="loading">
          <el-table-column type="selection" width="50"></el-table-column>
          <el-table-column property="academyName" label="学校" width="200"></el-table-column>
          <el-table-column property="className" label="班级" width="200"></el-table-column>
          <el-table-column property="majorName" label="专业" width="200"></el-table-column>
          <el-table-column property="gradeName" label="年级" width="150"></el-table-column>
          <el-table-column property="stuName" label="姓名" width="80"></el-table-column>
          <el-table-column property="gender" label="性别" width="50"></el-table-column>
          <el-table-column property="headTeacher" label="班主任" width="80"></el-table-column>
          <el-table-column property="idNumber" label="身份证号码"></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button size="mini" type="success" @click="handleDetail(scope.row.stuId)">详情</el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange"
                       @current-change="handleCurrentChange"
                       :current-page="currentPage"
                       :page-sizes="[20, 50, 100, 200]"
                       :page-size="pageSize"
                       layout="total, sizes, prev, pager, next, jumper"
                       :total="total" style="text-align:right;margin-right: 60px"> </el-pagination>
      </el-dialog>
    </div>
  <el-row :gutter="50">
    <el-col :span="25">
      <el-button type="primary" icon="el-icon-plus" style="width: 90px; padding-left: 1px;" @click="addSearchCondition">查询条件</el-button>
<!--      时间段选择(默认关)：
      <el-date-picker v-model="start" type="date" placeholder="选择日期" value-format="yyyy-MM-dd"
                      @change="dateChange" style="width: 140px;height: 25px">
      </el-date-picker>

      <el-date-picker v-model="end" type="date" placeholder="选择日期" value-format="yyyy-MM-dd"
                      @change="dateChange" style="width: 140px;height: 25px">
      </el-date-picker>
      <el-switch
        v-model="value"
        active-color="#13ce66"
        inactive-color="#ff4949">
      </el-switch>-->
    </el-col>
   <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
  </el-row>

    <el-row>
      <div v-for="(condition, index) in searchConditions" :key="index" style="margin-left: 10px;margin-top: 20px; display: flex; align-items: center;">
        <el-cascader
          style="margin-left: 100px;display: flex; align-items: center;"
          clearable
          size="medium"
          placeholder="条件选择"
          :options="options"
          :show-all-levels="false"
          v-model="condition.item"
          filterable
          emitPath="false"
          @change="changeSearch(index)"></el-cascader>
        <template v-if="condition.item[1]!= null">
          <template v-if="condition.item[1].inputType === 0">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="是" :value="'是'" ></el-option>
              <el-option label="否" :value="'否'" ></el-option>
            </el-select>
          </template>
          <template v-if="condition.item[1].inputType === 5">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="男" :value="'男'" ></el-option>
              <el-option label="女" :value="'女'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 8">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="党员" :value="'党员'" ></el-option>
              <el-option label="团员" :value="'团员'" ></el-option>
              <el-option label="群众" :value="'群众'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 12">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="农村" :value='1' :key='1'></el-option>
              <el-option label="城市" :value='0' :key='0'></el-option>
              <el-option label="县城" :value='2' :key='2'></el-option>
              <el-option label="县镇" :value='3' :key='3'></el-option>
            </el-select>
          </template>

<!--          <template v-if="condition.item[1].inputType === 13">-->
<!--            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >-->
<!--              <el-option label="二年" :value='0' ></el-option>-->
<!--              <el-option label="三年" :value='1' ></el-option>-->
<!--              <el-option label="四年" :value='2' ></el-option>-->
<!--              <el-option label="五年" :value='3' ></el-option>-->
<!--            </el-select>-->
<!--          </template>-->

          <template v-if="condition.item[1].inputType === 15">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value"  @change="handleGradeId" >
              <el-option
                v-for="item in gradeList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 16">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value"  @change="handleMajorId">
              <el-option
                v-for="item in majorList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 17">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" @change="handleClassId">
              <el-option
                v-for="item in classList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 18">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="春季" :value="'春季'" ></el-option>
              <el-option label="秋季" :value="'秋季'" ></el-option>
            </el-select>
          </template>


          <template v-if="condition.item[1].inputType === 21">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="已注册" :value="'0'" ></el-option>
              <el-option label="未注册" :value="'1'" ></el-option>
              <el-option label="注册前退学" :value="'2'" ></el-option>
              <el-option label="注册后退学" :value="'3'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 22">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="升学" :value="'0'" ></el-option>
              <el-option label="就业" :value="'1'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 23">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="否" :value="'否'" ></el-option>
              <el-option label="是" :value="'是'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 30">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="在校" :value="'0'" ></el-option>
              <el-option label="退学" :value="'1'" ></el-option>
              <el-option label="实习" :value="'2'" ></el-option>
              <el-option label="就业" :value="'3'" ></el-option>
              <el-option label="请假" :value="'4'" ></el-option>
              <el-option label="休学" :value="'5'" ></el-option>
              <el-option label="毕业" :value="'6'" ></el-option>
              <el-option label="未报到" :value="7"></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 35">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="否" :value="'否'" ></el-option>
              <el-option label="是" :value="'是'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 38">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="未参加面试" :value="'0'" ></el-option>
              <el-option label="通过面试" :value="'1'" ></el-option>
              <el-option label="未通过面试" :value="'2'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 46">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="否" :value="'0'" ></el-option>
              <el-option label="是" :value="'1'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 47">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="否" :value="'0'" ></el-option>
              <el-option label="是" :value="'1'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 48">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="否" :value="'0'" ></el-option>
              <el-option label="是" :value="'1'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 55">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="否" :value="'0'" ></el-option>
              <el-option label="是" :value="'1'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 56">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="认识实习" :value="'1'" ></el-option>
              <el-option label="岗位实习" :value="'2'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 58">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="1" :value="'1'" ></el-option>
              <el-option label="2" :value="'2'" ></el-option>
              <el-option label="3" :value="'3'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 110">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="必考证书" :value="'1'" ></el-option>
              <el-option label="选考证书" :value="'0'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 111">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="茶艺证" :value="'茶艺证'" ></el-option>
              <el-option label="礼仪证" :value="'礼仪证'" ></el-option>
              <el-option label="铁路客服证" :value="'铁路客服证'" ></el-option>
              <el-option label="急救证" :value='3' ></el-option>
              <el-option label="普通话证" :value='4' ></el-option>
              <el-option label="教师资格证" :value='5' ></el-option>
              <el-option label="保育员证" :value='6' ></el-option>
              <el-option label="其他证书" :value='7' ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 113">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="未考" :value="'0'" ></el-option>
              <el-option label="已考" :value="'1'" ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 115">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" >
              <el-option label="无" :value='0' ></el-option>
              <el-option label="已补发" :value='1' ></el-option>
              <el-option label="未补发" :value='2' ></el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 999">
            <el-select style="width: 215px;margin-left: 50px; " v-model="condition.value" @change="handleAcademyId">
              <el-option
                v-for="item in academyList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </template>

          <template v-if="condition.item[1].inputType === 2">
            <el-date-picker
              style="margin-left: 50px"
              v-model="condition.value"
              type="date"
              placeholder="选择日期"
              >
            </el-date-picker>
          </template>

          <template v-if="condition.item[1].inputType === 1">
            <el-input v-model="condition.value" placeholder="请输入" style="width: 215px; margin-left: 50px;" clearable></el-input>
          </template>
          <template v-if="condition.item[1].inputType === 122">
            <el-input v-model="condition.value" placeholder="请输入" style="width: 215px; margin-left: 50px;" clearable></el-input>
          </template>
          <template v-if="condition.item[1].inputType === 1">
            <el-select  style="margin-left: 50px" placeholder="查询类别" v-model="condition.type">
              <el-option label="精确查询" :value='1' ></el-option>
              <el-option label="模糊查询" :value='0' ></el-option>
            </el-select>
          </template>
          <template v-if="condition.item[1].inputType === 2">
            <el-select  style="margin-left: 50px" placeholder="查询类别" v-model="condition.type">
              <el-option label="在此之前" :value='2' ></el-option>
              <el-option label="在此之后" :value='3' ></el-option>
              <el-option label="当日" :value='1' ></el-option>
            </el-select>
          </template>
          <template v-if="condition.item[1].inputType === 122">
            <el-select  style="margin-left: 50px" placeholder="查询类别" v-model="condition.type">
              <el-option label="大于" :value='4' ></el-option>
              <el-option label="大于等于" :value='3' ></el-option>
              <el-option label="小于等于" :value='2' ></el-option>
              <el-option label="等于" :value='1' ></el-option>
              <el-option label="小于" :value='5' ></el-option>
            </el-select>
          </template>
        </template>

<!--        <div  class="row" >-->

<!--            <el-select  style="margin-left: 50px" placeholder="查询类别" v-model="condition.type">-->
<!--              <el-option label="精确查询" :value='1' ></el-option>-->
<!--              <el-option label="模糊查询" :value='0' ></el-option>-->
<!--            </el-select>-->

<!--        </div>-->
        <el-button  style="margin-left: 700px" icon="el-icon-delete" @click="removeSearchCondition(index) ">删除</el-button>
      </div>
    </el-row>
    <el-row style="display: flex; justify-content: center;">
        <el-button type="primary" size="max" style="margin-top: 20px;align-self: center;" @click="search">查询</el-button>
    </el-row>
  </div>

</template>


<script>
export default {
  mounted () {
    this.getData()
    this.getAcademyList()
  },
  methods: {
    dateChange(){

    },
    changeSearch (index) {
      console.log(this.searchConditions[index].type)
      this.$set(this.searchConditions[index], 'type', '')
      this.$set(this.searchConditions[index], 'value', '')
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.currentPage = 1
      // 重新请求数据
      this.search()
    },
    // 处理当前页码变化事件
    handleCurrentChange (page) {
      this.currentPage = page
      // 重新请求数据
      this.search()
    },
    handleDetail (val) {
      window.open(`#/student-studentDetail?stuId=${val}`, '_blank')
      // 处理详情逻辑
     /* this.$router.push({
        name: 'studentDetail',
        params: {
          stuId: val
        }
      }) */
    },
    search () {
      this.loading = true
      this.conditions.splice(0, this.conditions.length)

      for (let i = 0; i < this.searchConditions.length; i++) {
        const condition = this.searchConditions[i]
        const searchType = typeof condition.type === 'undefined' ? 1 : condition.type

        this.conditions.unshift({
          item: condition.item[1],
          option: condition.option,
          value: condition.value,
          searchType: searchType
        })
      }
      console.log(this.conditions)
      this.$http({
        url: this.$http.adornUrl('/search/search'),
        method: 'post',
        params: {
          'page': this.currentPage,
          'limit': this.pageSize
        },
        data: this.conditions
      }).then(({data}) => {
        this.gridData = data.result.list
        this.total = data.result.totalCount
      }).finally(() => {
        this.loading = false // Set loading state to false after the request is complete
      })

      this.dialogTableVisible = true
    },
    addSearchCondition () {
      this.searchConditions.push({
        item: '',
        option: '',
        value: '',
        searchType: ''
      })
    },
    removeSearchCondition (index) {
      this.searchConditions.splice(index, 1)
    },
    getAcademyList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/academyList'),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.academyList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    handleAcademyId (item) {
      this.academyId = item
      this.majorList = []
      this.classList = []
      this.getGradeList()
    },
    handleMajorId (item) {
      this.majorId = item
      this.getClassList()
    },
    handleGradeId (item) {
      this.gradeId = item
      this.classList = []
      this.getMajorList()
    },
    handleClassId (item) {
      this.classId = item
    },
    getMajorList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptsByPid'),
        params: this.$http.adornParams({
          'pid': this.gradeId
        }),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.majorList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getGradeList () {
      // console.log('getAcademyList')
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptsByPid'),
        params: this.$http.adornParams({
          'pid': this.academyId
        }),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.gradeList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getClassList () {
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptsByPid'),
        params: this.$http.adornParams({
          'pid': this.majorId
        }),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.classList = data.data
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('/search/getData'),
        method: 'get'
      }).then(response => {
        response.data.Dto.list1.forEach((data) => {
          this.options[0].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list2.forEach((data) => {
          this.options[1].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list3.forEach((data) => {
          this.options[2].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list4.forEach((data) => {
          this.options[3].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list5.forEach((data) => {
          this.options[4].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list6.forEach((data) => {
          this.options[5].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list7.forEach((data) => {
          this.options[6].children.push({
            value: data,
            label: data.fieldsName
          })
        })
        response.data.Dto.list8.forEach((data) => {
          this.options[7].children.push({
            value: data,
            label: data.fieldsName
          })
        })
      })
    }
  },

  data () {
    return {
      loading: true,
      currentPage: 1, // 当前页码
      pageSize: 20, // 每页显示条数
      total: 0, // 总条数
      gridData: [],
      academyId: null,
      majorId: null,
      gradeId: null,
      classId: null,
      academyList: [],
      majorList: [],
      gradeList: [],
      classList: [],
      dialogTableVisible: false,
      value1: '',
      searchType: '',
      searchConditions: [{
        item: '',
        option: '',
        value: '',
        searchType: ''
      }],
      conditions: [{
        item: '',
        option: '',
        value: '',
        searchType: '1'
      }],
      options: [
        {
          value: '0',
          label: '学生管理板块',
          children: []
        },
        {
          value: '2',
          label: '招生板块',
          children: []
        },
        {
          value: '3',
          label: '就业板块',
          children: []
        },
        {
          value: '4',
          label: '实习板块',
          children: []
        },
        {
          value: '5',
          label: '财务收支板块',
          children: []
        },
        {
          value: '6',
          label: '财务退费板块',
          children: []
        },
        {
          value: '7',
          label: '财务欠费板块',
          children: []
        },
        {
          value: '8',
          label: '教务板块',
          children: []
        }
      ]
    }
  }
}
</script>
<style scoped>

.my-component {
  font-family: "Helvetica Neue", sans-serif;
  font-size: 25px;
}

.row {
  display: flex;
  align-items: center;
}

</style>

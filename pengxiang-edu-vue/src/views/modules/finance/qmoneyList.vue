<template>
  <div >


<!--&lt;!&ndash; 按钮 &ndash;&gt;-->
<!--<el-row style="padding: 20px;" >-->
<!--  <el-button type="primary">刷新</el-button>-->

<!--  <el-button type="info">信息导入</el-button>-->
<!--  <el-button type="warning">信息导出</el-button>-->
<!--  <el-button  type="primary" icon="el-icon-plus"  @click="addRow()">新 增</el-button>-->
<!--</el-row>-->
<!--&lt;!&ndash; 搜索框 &ndash;&gt;-->
<!--<el-select-->
<!--    v-model="value"-->
<!--    multiple-->
<!--    filterable-->
<!--    remote-->
<!--    reserve-keyword-->
<!--    placeholder="请输入关键词"-->
<!--    :remote-method="remoteMethod"-->
<!--    :loading="loading"-->
<!--    style="position: absolute ;top: 20px;right:200px;">-->
<!--    <el-option-->
<!--      v-for="item in options"-->
<!--      :key="item.value"-->
<!--      :label="item.label"-->
<!--      :value="item.value">-->
<!--    </el-option>-->
<!--  </el-select>-->
<!--  <HR style="border: 3 double #987cb9" width=95% color=#987cb9 size="3"></HR>-->

    <el-row style="margin-top: 20px;">
      <el-col :span="3" style="text-align:left;margin-left: 20px">
        <el-button type="success" @click="handleImport">导入</el-button>
        <el-button type="success" @click="handleExport">导出</el-button>
      </el-col>
      <el-col :span="20" >
        <div style="display: flex; align-items: center;">
          <el-button type="primary" icon="el-icon-plus" style="width: 80px; padding-left: 1px;" @click="addSearchCondition" v-show="searchCount<3">查询条件</el-button>
          <div v-for="(condition, index) in searchConditions" :key="index" style=" margin-left: 10px;">
            <el-select style="width: 110px;" v-model="condition.option" placeholder="查询条件">
              <el-option label="姓名" value="姓名"></el-option>
              <el-option label="身份证号" value="身份证号"></el-option>
              <!--              <el-option label="系部" value="系部"></el-option>-->
<!--              <el-option label="专业" value="专业"></el-option>-->
<!--              <el-option label="退费账号" value="退费账号"></el-option>-->
            </el-select>
            <el-input v-model="condition.value" placeholder="请输入" style="width: 200px;"></el-input>
            <el-button type="danger" icon="el-icon-delete" @click="removeSearchCondition(index)">删除</el-button>
          </div>
          <el-button type="primary" icon="el-icon-search" @click="handleSearch" style=" margin-left: 4px;">搜索</el-button>
        </div>
      </el-col>
    </el-row>

   <!-- 表格 -->
   <el-table :data="tableData"  border style="width: 100%;; margin-top: 20px;">
      <el-table-column
      type="selection"
      width="55">
    </el-table-column>


    <el-table-column
      prop="name"
      label="姓名"
      width="100" align="center">
     <!-- 编辑尝试 -->
<!--      <template slot-scope="scope">-->
<!--            <el-input  v-model="scope.row.name" :disabled="!(scope.row.isEdit || scope.row.isAdd)" />-->
<!--          </template>-->

    </el-table-column>
    <el-table-column
      prop="id"
      label="身份证号"
      width="140" align="center">
    </el-table-column>
    <el-table-column
      prop="year"
      label="欠费学年"
      width="140" align="center">
    </el-table-column>
    <el-table-column
      prop="peixun"
      label="欠培训费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="fuzhuang"
      label="欠服装费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="jiaocai"
      label="欠教材费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="zhusu"
      label="欠住宿费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="beiru"
      label="欠被褥费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="baoxian"
      label="欠保险费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="gongwu"
      label="欠公物押金"
      width="100" align="center">
    </el-table-column>
    <el-table-column
      prop="zhengshu"
      label="欠证书费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="guofang"
      label="欠国防教育费"
      width="120" align="center">
    </el-table-column>
    <el-table-column
      prop="tijian"
      label="欠体检费"
      width="80" align="center">
    </el-table-column>
    <el-table-column
      prop="heji"
      label="欠费合计"
      width="80" align="center">
    </el-table-column>
      <el-table-column label="操作" style="text-align: center" align="center">
        <template slot-scope="scope">

          <!-- 详情按钮 -->
          <router-link :to="{name:'qmoneyDetail'}">
            <el-button
              type="text"
              @click="handleDelete(scope.$index, scope.row)">详情</el-button>
          </router-link>

          <!-- 编辑按钮 -->
          <el-button type="text" @click="handleEdit">修改</el-button>
            <!-- 删除按钮 -->
<!--
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
             -->




        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
<!--    <el-pagination-->
<!--  background-->
<!--  layout="prev, pager, next"-->
<!--  :total="1000"-->
<!--  style="position: absolute;right: 200px;padding: 20px;">-->
<!--</el-pagination>-->
    <el-pagination @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page="currentPage"
                   :page-sizes="[10, 20, 30, 40]"
                   :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total" style="text-align:right;margin-right: 60px">

    </el-pagination>
</div>
  </template>





  <script>
  export default {
    data () {
      return {
        visible: false,
        searchConditions: [{
          option: '',
          value: ''
        }], // 条件搜索栏目数据
        searchCount: 1,
        currentPage: 1, // 当前页码
        pageSize: 10, // 每页显示条数
        total: 0, // 总条数

        tableData: [{
          date: '2016-05-02',
          name: '王聪',
          address: '上海市普陀区金沙江路 1518 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }, {
          date: '2016-05-04',
          name: '李娜',
          address: '上海市普陀区金沙江路 1517 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }, {
          date: '2016-05-01',
          name: '李颖',
          address: '上海市普陀区金沙江路 1519 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }, {
          date: '2016-05-03',
          name: '赵峥',
          address: '上海市普陀区金沙江路 1516 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }, {
          date: '2016-05-04',
          name: '李娜',
          address: '上海市普陀区金沙江路 1517 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }, {
          date: '2016-05-01',
          name: '李颖',
          address: '上海市普陀区金沙江路 1519 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }, {
          date: '2016-05-03',
          name: '赵峥',
          address: '上海市普陀区金沙江路 1516 弄',
          id: 1372847839884,
          year: '2020上半学年',
          peixun: 300,
          fuzhuang: 200,
          jiaocai: 200,
          zhusu: 1200,
          beiru: 200,
          baoxian: 200,
          gongwu: 200,
          zhengshu: 200,
          guofang: 200,
          tijian: 200,
          heji: 2000
        }]
      }
    },
    methods: {
      handleEdit (index, row) {
        console.log(index, row)
      },
      handleDelete (index, row) {
        console.log(index, row)
      },
      handleImport () {
        // 处理导入逻辑
      },
      handleExport () {
        // 处理导出逻辑
      },
      addSearchCondition () {
        this.searchConditions.push({
          option: '',
          value: ''
        })
        this.searchCount++
      },
      // 删除条件搜索栏目
      removeSearchCondition (index) {
        this.searchConditions.splice(index, 1)
        this.searchCount--
      },
      handleSizeChange (size) {
        this.pageSize = size
        // 重新请求数据
        this.getData()
      },
      // 处理当前页码变化事件
      handleCurrentChange (page) {
        this.currentPage = page
        // 重新请求数据
        this.getData()
      },
      // 请求数据方法
      getData () {
        // 根据当前页码和每页显示条数发送请求获取数据

        // 更新表格数据和总条数
      }
    }
  }
</script>


<style>

</style>

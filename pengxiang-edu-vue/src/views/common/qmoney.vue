<template>
    <div >

 
<!-- 按钮 -->
<el-row style="padding: 20px;" >
  <el-button type="primary">刷新</el-button>
  
  <el-button type="info">信息导入</el-button>
  <el-button type="warning">信息导出</el-button>
  <el-button  type="primary" icon="el-icon-plus"  @click="addRow()">新 增</el-button>
</el-row>
<!-- 搜索框 -->
<el-select
    v-model="value"
    multiple
    filterable
    remote
    reserve-keyword
    placeholder="请输入关键词"
    :remote-method="remoteMethod"
    :loading="loading"
    style="position: absolute ;top: 20px;right:200px;">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
   <!-- 表格 -->
   <el-table
      :data="tableData"
      style="width: 100%">
      <el-table-column
      type="selection"
      width="55">
    </el-table-column>
     
      
    <el-table-column
      prop="name"
      label="姓名"
      width="100">
     <!-- 编辑尝试 -->
      <template slot-scope="scope">
            <el-input  v-model="scope.row.name" :disabled="!(scope.row.isEdit || scope.row.isAdd)" />
          </template>

    </el-table-column>
    <el-table-column
      prop="id"
      label="身份证号"
      width="140">
    </el-table-column>
    <el-table-column
      prop="year"
      label="欠费学年"
      width="140">
    </el-table-column>
    <el-table-column
      prop="peixun"
      label="欠培训费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="fuzhuang"
      label="欠服装费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="jiaocai"
      label="欠教材费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="zhusu"
      label="欠住宿费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="beiru"
      label="欠被褥费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="baoxian"
      label="欠保险费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="gongwu"
      label="欠公物押金"
      width="80">
    </el-table-column>
    <el-table-column
      prop="zhengshu"
      label="欠证书费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="guofang"
      label="欠国防教育费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="tijian"
      label="欠体检费"
      width="80">
    </el-table-column>
    <el-table-column
      prop="heji"
      label="欠费合计"
      width="80">
    </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <!-- 编辑按钮 -->
          <router-link :to="{name:'qmoneyEdit'}"> 
          <el-button
            size="mini"
            type:="success"
            @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          </router-link>
            <!-- 删除按钮 -->
<!--            
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
             -->

            

            <!-- 详情按钮 -->
            <router-link :to="{name:'qmoneyyy'}"> 
            <el-button
            size="mini"
            type="success"
            @click="handleDelete(scope.$index, scope.row)">详情</el-button>
            </router-link>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
  background
  layout="prev, pager, next"
  :total="1000"
  style="position: absolute;right: 200px;padding: 20px;">
</el-pagination>
</div>
  </template>





  <script>
  export default {
    data() {
      return {
        visible: false,


        
        tableData: [{
          date: '2016-05-02',
          name: '王聪',
          address: '上海市普陀区金沙江路 1518 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200,
          beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        }, {
          date: '2016-05-04',
          name: '李娜',
          address: '上海市普陀区金沙江路 1517 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200,
          beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        }, {
          date: '2016-05-01',
          name: '李颖',
          address: '上海市普陀区金沙江路 1519 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200,
          beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        }, {
          date: '2016-05-03',
          name: '赵峥',
          address: '上海市普陀区金沙江路 1516 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200, beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        },{
          date: '2016-05-04',
          name: '李娜',
          address: '上海市普陀区金沙江路 1517 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200,
          beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        }, {
          date: '2016-05-01',
          name: '李颖',
          address: '上海市普陀区金沙江路 1519 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200,
          beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        }, {
          date: '2016-05-03',
          name: '赵峥',
          address: '上海市普陀区金沙江路 1516 弄',
          id:1372847839884,
          year:'2020上半学年',
          peixun:300,
          fuzhuang:200,
          jiaocai:200,
          zhusu:1200, beiru:200,
          baoxian:200,
          gongwu:200,
          zhengshu:200,
          guofang:200,
          tijian:200,
          heji:2000
        }]
      }
    },
    methods: {
      handleEdit(index, row) {
        console.log(index, row);
      },
      handleDelete(index, row) {
        console.log(index, row);
      }
    }
  }
</script>


<style>

</style>
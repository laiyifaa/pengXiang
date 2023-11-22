<template>
  <div>
    <e-desc margin='0 12px' label-width='150px' title="学生详情" column="4">
      <e-desc-item  label="姓名" >{{info.baseInfo.stuName}}</e-desc-item>
      <e-desc-item label="证件类型">{{ info.baseInfo.idNumberType }}</e-desc-item>
      <e-desc-item label="证件号码">{{ info.baseInfo.idNumber }}</e-desc-item>
      <e-desc-item label="出生年月" >{{ info.baseInfo.birthday }}</e-desc-item>
      <e-desc-item label="性别">{{ info.baseInfo.gender }}</e-desc-item>
      <e-desc-item label="政治面貌">{{ info.baseInfo.politicalStatus }}</e-desc-item>
      <e-desc-item label="籍贯">{{ info.baseInfo.nativePlace }}</e-desc-item>
      <e-desc-item label="民族">{{ info.baseInfo.nation }}</e-desc-item>
      <e-desc-item label="联系电话">{{ info.baseInfo.phone }}</e-desc-item>
      <e-desc-item label="户口性质">{{ info.baseInfo.residenceTypeName }}</e-desc-item>
      <e-desc-item label="入学前技能水平">{{ info.baseInfo.skillBefore }}</e-desc-item>
      <e-desc-item label="入学学历">{{ info.baseInfo.eduBefore }}</e-desc-item>
      <e-desc-item label="毕业学校">{{ info.baseInfo.schoolBefore }}</e-desc-item>
    </e-desc>

    <el-collapse v-model="stuStatus" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生学籍信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px' column="4" >
          <e-desc-item label="学号">{{ info.baseInfo.schoolNumber}}</e-desc-item>
          <e-desc-item label="院校">{{ info.baseInfo.academyName }}</e-desc-item>
          <e-desc-item label="年级">{{ info.baseInfo.gradeName }}</e-desc-item>
          <e-desc-item label="专业">{{ info.baseInfo.majorName }}</e-desc-item>
          <e-desc-item label="班级">{{ info.baseInfo.className }}</e-desc-item>
          <e-desc-item label="班型">{{ info.baseInfo.classType  === 1?'就业':'升学'}}</e-desc-item>
          <e-desc-item label="学制">{{ info.baseInfo.schoolingLength }}</e-desc-item>
          <e-desc-item label="当前状态">{{ info.baseInfo.currentStatus===0 ? '在校' : info.baseInfo.currentStatus===1 ? '实习' : info.baseInfo.currentStatus===2 ? '就业' : info.baseInfo.currentStatus===3 ? '请假' : info.baseInfo.currentStatus===4 ? '休学' : info.baseInfo.currentStatus===5 ? '退学' :info.baseInfo.currentStatus===6? '毕业':info.baseInfo.currentStatus===7 ? '未报到' :'无'}}</e-desc-item>
          <e-desc-item label="学籍状态">{{ info.baseInfo.schoolRollStatus===0 ? '已注册' : info.baseInfo.schoolRollStatus===1 ? '未注册' : info.baseInfo.schoolRollStatus===2 ? '注册前退学' : info.baseInfo.schoolRollStatus===3 ? '注册后退学' :'无'}}</e-desc-item>
          <e-desc-item label="现就读学校">{{ info.baseInfo.studyIn }}</e-desc-item>
          <e-desc-item label="现学籍学校">{{ info.baseInfo.statusSchool }}</e-desc-item>
          <e-desc-item label="培养层次">{{ info.baseInfo.developLevel }}</e-desc-item>
          <e-desc-item label="入学日期">{{ info.baseInfo.admissionDate }}</e-desc-item>
          <e-desc-item label="注册学籍日期">{{ info.baseInfo.registerDate }}</e-desc-item>
          <e-desc-item label="是否提前入学">{{ info.baseInfo.isAdmissionEarly }}</e-desc-item>

          <e-desc-item label="班主任">{{ info.baseInfo.headTeacher }}</e-desc-item>
          <e-desc-item label="班主任电话">{{ info.baseInfo.headTeacherPhone }}</e-desc-item>
          <e-desc-item label="班主任所属部门">{{ info.baseInfo.headTeacherDept }}</e-desc-item>

        </e-desc>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="enrollStu" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">招生信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px' column="4" >
          <e-desc-item label="招生老师" icon="*">{{info.tempInfo.enrollTeacher}}</e-desc-item>
          <e-desc-item label="招生老师部门">{{info.tempInfo.enrollTeacherDept}}</e-desc-item>
          <e-desc-item label="招生老师电话">{{info.tempInfo.enrollTeacherPhone}}</e-desc-item>
          <e-desc-item label="招生季">{{ info.baseInfo.admissionSeason }}</e-desc-item>
          <e-desc-item label="考生状态">{{info.tempInfo.status === 0 ? '未参加面试' : info.status === 1 ? '通过面试' :info.status === 2 ? '未通过面试' : '状态未知'}}</e-desc-item>

        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse  v-model="activeCollapse" >
      <el-collapse-item name="1" >
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学籍变更记录</span>
        </template>
        <el-tabs type="border-card" key>
          <el-tab-pane v-for="(item, index) in changeList" :key="index" :label="`${item.updateTime}变更`">
            <e-desc margin='0 12px' label-width='140px' column="3" >
              <e-desc-item label="变更前的当前状态">{{ getCurrentStatusText(item.oldCurrentStatus) }}</e-desc-item>
              <e-desc-item label="变更后的当前状态">{{ getCurrentStatusText(item.newCurrentStatus) }}</e-desc-item>
              <e-desc-item label="变更前的学籍状态">{{ getSchoolStatusText(item.oldSchoolRollStatus) }}</e-desc-item>
              <e-desc-item label="变更后的学籍状态">{{ getSchoolStatusText(item.newSchoolRollStatus) }}</e-desc-item>
              <e-desc-item label="学籍变更时间">{{ item.updateTime }}</e-desc-item>
              <e-desc-item label="离校日期">{{ item.levelDate }}</e-desc-item>
              <e-desc-item label="结束日期">{{ item.endDate }}</e-desc-item>
              <e-desc-item label="学籍变更原因">{{ item.changeDetail }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>

      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="room" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">住宿信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px' column="4"  >
          <e-desc-item label="宿舍楼号" >{{ info.baseInfo.dormNum }}</e-desc-item>
          <e-desc-item label="房间号" > {{ info.baseInfo.roomNum }}</e-desc-item>
          <e-desc-item label="床位号" > {{ info.baseInfo.bedNum }} </e-desc-item>
          <e-desc-item label="入住日期" >{{ info.baseInfo.checkIn }}</e-desc-item>
          <e-desc-item label="离宿日期" >{{ info.baseInfo.leaveDate }}</e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="money" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">家庭信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="是否家庭困难" > {{ info.baseInfo.isDifficulty }}</e-desc-item>
          <e-desc-item label="家庭困难类型" > {{ info.baseInfo.difficultyType }} </e-desc-item>
          <e-desc-item label="资助申请类型" >{{ info.baseInfo.supportType }}</e-desc-item>
          <e-desc-item label="身份证地址" >{{ info.baseInfo.idCardAddr }}</e-desc-item>
          <e-desc-item label="家庭联系人" >{{ info.baseInfo.familyMemberName }}</e-desc-item>
          <e-desc-item label="邮编" >{{ info.baseInfo.postCode }}</e-desc-item>
          <e-desc-item label="家庭住址" >{{ info.baseInfo.familyAddr }}</e-desc-item>
          <e-desc-item label="家庭联系电话" >{{ info.baseInfo.familyPhone }}</e-desc-item>
          <e-desc-item label="家庭年总收入（元）" >{{ info.baseInfo.totalIncome }}</e-desc-item>
          <e-desc-item label="家庭人均收入（元）" >{{ info.baseInfo.aveIncome }}</e-desc-item>
          <e-desc-item label="家庭经济来源" >{{ info.baseInfo.incomeSource }}</e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>
    <el-collapse v-model="f_activeNames" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">评定信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="第一学期评定" >{{ info.baseInfo.firstAssess }}</e-desc-item>
          <e-desc-item label="第二学期评定" > {{ info.baseInfo.secondAssess }}</e-desc-item>
          <e-desc-item label="第三学期评定" > {{ info.baseInfo.thirdAssess }} </e-desc-item>
          <e-desc-item label="第四学期评定" >{{ info.baseInfo.fourthAssess }}</e-desc-item>
          <e-desc-item label="第五学期评定" > {{ info.baseInfo.fifthAssess }} </e-desc-item>
          <e-desc-item label="第六学期评定" > {{ info.baseInfo.sixthAssess }} </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="activeNames" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">缴费信息</span>
        </template>

          <el-tabs>
            <el-tab-pane v-for="(item,index) in info.feeList" :key="index" :label="display(item[0].paySchoolYear)" @click="handleClick((item))">
              <el-tabs type="border-card">
                <el-tab-pane v-for="(item, index) in item" :key="index" :label="displaySecond(index)">
                  <e-desc margin='0 12px' label-width='150px' column="4" >
                    <e-desc-item  label="缴费（学年-学期）"> {{item.paySchoolYear}} </e-desc-item>
                    <e-desc-item label="缴费日期"> {{ formatDate (item.paySchoolDate)}} </e-desc-item>
                    <e-desc-item label="减免类型">  {{item.derateType === 1 ? '贫困生':'非贫困生'}}</e-desc-item>
                    <e-desc-item label="应缴培训费" color="#"  > {{ item.payTrainFee }} </e-desc-item>
                    <e-desc-item label="实缴培训费" color="#" > {{item.trainFee}} </e-desc-item>
                    <e-desc-item label="应缴服装费" color="#" > {{item.payClothesFee}} </e-desc-item>
                    <e-desc-item label="实缴服装费" color="#" > {{item.clothesFee}} </e-desc-item>
                    <e-desc-item label="应缴教材费" color="#" > {{item.payBookFee}} </e-desc-item>
                    <e-desc-item label="实缴教材费" color="#" > {{item.bookFee}} </e-desc-item>
                    <e-desc-item label="应缴住宿费" color="#" > {{item.payHotelFee}} </e-desc-item>
                    <e-desc-item label="实缴住宿费" color="#" > {{item.hotelFee}} </e-desc-item>
                    <e-desc-item label="应缴被褥费" color="#" > {{item.payBedFee}} </e-desc-item>
                    <e-desc-item label="实缴被褥费" color="#" > {{item.bedFee}} </e-desc-item>
                    <e-desc-item label="应缴证书费" color="#" > {{item.payCertificateFee}} </e-desc-item>
                    <e-desc-item label="实缴证书费" color="#" > {{item.certificateFee}} </e-desc-item>
                    <e-desc-item label="应缴国防教育费" color="#" > {{item.payDefenseEduFee}} </e-desc-item>
                    <e-desc-item label="实缴国防教育费" color="#" > {{item.defenseEduFee}} </e-desc-item>
                    <e-desc-item label="应缴体检费" color="#" > {{item.payBodyExamFee}} </e-desc-item>
                    <e-desc-item label="实缴体检费" color="#" > {{item.bodyExamFee}} </e-desc-item>
                    <e-desc-item label="减免金额" color="#"> {{ item.derateMoney }} </e-desc-item>
                    <e-desc-item label="减免备注" color="#"> {{ item.derateDetail }} </e-desc-item>
                    <e-desc-item label="返费时间" color="#"> {{item.returnFeeTime}} </e-desc-item>
                    <e-desc-item label="应返费金额" color="#"> {{item.needReturnFeeNum}} </e-desc-item>
                    <e-desc-item label="返费金额" color="#"> {{ item.factReturnFeeNum }} </e-desc-item>
                    <e-desc-item label="返费账户" color="#"> {{ item.account }} </e-desc-item>
                    <e-desc-item label="返费账号" color="#"> {{item.accountNumber}} </e-desc-item>
                    <e-desc-item label="返费开户行" color="#"> {{item.depositBank}} </e-desc-item>
                  </e-desc>


                </el-tab-pane>
              </el-tabs>
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
              <e-desc-item label="离校日期" >{{ info.employInfo.leaveDate}}</e-desc-item>
              <e-desc-item label="离校原因" >{{info.employInfo.leaveReason}}</e-desc-item>
              <e-desc-item label="就业单位">{{ info.employInfo.employOrg }}</e-desc-item>
              <e-desc-item  label=" 就业岗位">{{ info.employInfo.employPost }}</e-desc-item>
              <e-desc-item label="试用期薪酬">{{ info.employInfo.probationIncome}}</e-desc-item>
              <e-desc-item label="转正薪酬">{{ info.employInfo.formalIncome}}</e-desc-item>
              <e-desc-item label="岗位负责人">{{info.employInfo.postLeader}}</e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane v-for="(item, index) in info.visitList" :key="index" :label="`第${index + 1}次回访记录`">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="回访日期" >{{ item.visitDate}}</e-desc-item>
              <e-desc-item label="是否在岗" >{{item.isPost === 1 ? '是' : '否'}}</e-desc-item>
              <e-desc-item label="是否对岗位满意">{{item.isSatisfied === 1 ? '是' : '否' }}</e-desc-item>
              <e-desc-item  label="学生就业工作情况">{{ item.workSituation}}</e-desc-item>
              <e-desc-item label="离职原因">{{ item.departReason }}</e-desc-item>
              <e-desc-item label="是否需要二次就业">{{ item.isSecondEmploy === 1 ? '是' : '否' }}</e-desc-item>
              <e-desc-item label="二次就业分配时间">{{item.secondEmployDate}}</e-desc-item>
              <e-desc-item label="就业单位" >{{ item.employOrg}}</e-desc-item>
              <e-desc-item label="就业岗位" >{{item.employPost }}</e-desc-item>
              <e-desc-item label="试用期限">{{ item.probationPeriod }}</e-desc-item>
              <e-desc-item  label="试用期薪酬">{{ item.probationIncome  }}</e-desc-item>
              <e-desc-item label="转正薪酬">{{ item.formalIncome}}</e-desc-item>
              <e-desc-item label="岗位负责人">{{ item.postLeader}}</e-desc-item>
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
          <el-tab-pane v-for="(item, index) in info.practiceList" :key="index" :label="`第${index + 1}阶段实习`">
            <e-desc margin='0 12px' label-width='150px' column="4" >
              <e-desc-item label="实习类别" >{{ item.practiceType === 1 ? '认识实习': '岗位实习'}}</e-desc-item>
              <e-desc-item label="实习单位" >{{item.practiceOrg}}</e-desc-item>
              <e-desc-item label="实习报酬">{{ item.practiceIncome }}</e-desc-item>
              <e-desc-item  label="实习岗位">{{ item.practicePost }}</e-desc-item>
              <e-desc-item label="实习离校日期">{{ item.leaveDate}}</e-desc-item>
              <e-desc-item label="预计实习结束日期">{{ item.expectEndDate}}</e-desc-item>
              <e-desc-item label="实际实习结束日期">{{item.realEndDate}}</e-desc-item>
              <e-desc-item label="学生实习鉴定结果" >{{ item.practiceResult}}</e-desc-item>
              <e-desc-item label="是否对岗位满意" >{{item.isSatisfied === 1?'满意':'不满意'}}</e-desc-item>
              <e-desc-item label="带队教师">{{ item.postLeader }}</e-desc-item>
              <e-desc-item  label="带队教师电话">{{ item.postLeaderPhone }}</e-desc-item>
            </e-desc>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>

    <el-collapse v-model="f_remoney" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">退费信息</span>
        </template>
        <el-tabs type="border-card" >
          <el-tab-pane v-for="(item, index) in info.feeReturnList" :key="index" :label="`${item.returnSchoolYear }退费信息`">
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="退费时间">{{item.returnMoneyTime}}</e-desc-item>
          <e-desc-item label="退费学年">{{ item.returnSchoolYear}}</e-desc-item>
          <e-desc-item label="退费金额">{{ item.returnFeeNum}}</e-desc-item>
          <e-desc-item label="退培训费">{{ item.trainFee}}</e-desc-item>
          <e-desc-item label="退服装费">{{ item.clothesFee}}</e-desc-item>
          <e-desc-item label="退教材费">{{ item.bookFee}}</e-desc-item>
          <e-desc-item label="退住宿费">{{ item.hotelFee}}</e-desc-item>
          <e-desc-item label="退被褥费">{{ item.bedFee}}</e-desc-item>
          <e-desc-item label="退保险费">{{ item.insuranceFee}}</e-desc-item>
          <e-desc-item label="退公物押金">{{ item.publicFee}}</e-desc-item>
          <e-desc-item label="退证书费">{{ item.certificateFee}}</e-desc-item>
          <e-desc-item label="退国防教育费">{{ item.defenseEduFee}}</e-desc-item>
          <e-desc-item label="退体检费">{{ item.bodyExamFee}}</e-desc-item>
          <e-desc-item label="退费账户">{{ item.account}}</e-desc-item>
          <e-desc-item label="退费账号">{{ item.accountNumber}}</e-desc-item>
          <e-desc-item label="退费开户行">{{ item.depositBank}}</e-desc-item>
          <e-desc-item label="应收合计">{{ item.returnFeeNum}}</e-desc-item>
        </e-desc>
          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="f_qmoney" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">欠费信息</span>
        </template>
        <el-tabs type="border-card" >
          <el-tab-pane v-for="(item, index) in info.feeArrearageList" :key="index" :label="`第${index+1 }次退费信息`">
            <e-desc margin='0 12px' label-width='120px' label="tab  1" name="tab1">


              <e-desc-item label="欠费学年度">{{ item.year }}</e-desc-item>
              <e-desc-item label="欠培训费">{{ item.trainFee }}</e-desc-item>
              <e-desc-item label="欠服装费">{{ item.clothesFee }}</e-desc-item>
              <e-desc-item label="欠教材费">{{ item.bookFee }}</e-desc-item>
              <e-desc-item label="欠住宿费">{{ item.hotelFee }}</e-desc-item>
              <e-desc-item label="欠被褥费">{{ item.bedFee }}</e-desc-item>
              <e-desc-item label="欠保险费">{{ item.insuranceFee }}</e-desc-item>
              <e-desc-item label="欠公物押金费">{{ item.publicFee }}</e-desc-item>
              <e-desc-item label="欠证书费">{{ item.certificateFee }}</e-desc-item>
              <e-desc-item label="欠国防教育费">{{ item.defenseEduFee }}</e-desc-item>
              <e-desc-item label="欠体检费">{{ item.bodyExamFee }}</e-desc-item>
              <e-desc-item label="欠费合计">{{ item.feeNum }}</e-desc-item>
            </e-desc>
          </el-tab-pane>


        </el-tabs>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="f_necessary" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">必考证书信息</span>
        </template>
        <el-tabs type="border-card" >
          <el-tabs type="border-card" key>
            <el-tab-pane v-for="(item, index) in info.certificateDetail.necessaryList" :key="index" :label="`证书${index+1}`">
              <e-desc margin='0 12px' label-width='140px' column="2" >
                <e-desc-item label="证书名称" >{{ item.certificateName}}</e-desc-item>
                <e-desc-item label="考证时间" >{{item.examTime}}</e-desc-item>
                <e-desc-item label="考证状态">{{ item.status === 1 ? '已考': item.status === 0 ? '未考':'无' }}</e-desc-item>
                <e-desc-item  label="发证日期">{{ item.issueTime }}</e-desc-item>
                <e-desc-item label="错补证信息">{{ item.information === 2 ? '2未补发' :item.information === 1?'1已补发':'无'}}</e-desc-item>
                <e-desc-item label="备注">{{ item.remarks}}</e-desc-item>
              </e-desc>
            </el-tab-pane>
          </el-tabs>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>


    <el-collapse v-model="f_option" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">选考证书信息</span>
        </template>
        <el-tabs type="border-card" >
          <el-tabs type="border-card" key>
            <el-tab-pane v-for="(item, index) in info.certificateDetail.optionList" :key="index" :label="`证书${index+1}`">
              <e-desc margin='0 12px' label-width='140px' column="2" >
                <e-desc-item label="证书名称" >{{ item.certificateName}}</e-desc-item>
                <e-desc-item label="考证时间" >{{item.examTime}}</e-desc-item>
                <e-desc-item label="考证状态">{{ item.status === 1 ? '已考': item.status === 0 ? '未考':'无' }}</e-desc-item>
                <e-desc-item  label="发证日期">{{ item.issueTime }}</e-desc-item>
                <e-desc-item label="错补证信息">{{ item.information === 2 ? '2未补发' :item.information === 1?'1已补发':'无'}}</e-desc-item>
                <e-desc-item label="备注">{{ item.remarks}}</e-desc-item>
              </e-desc>
            </el-tab-pane>
          </el-tabs>
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
  </div>
</template>


<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
import moment from 'moment'

const cityOptions = ['学生详情', '贫困情况', '缴费信息', '评定信息', '就业信息', '实习信息', '退费信息', '欠费信息', '证书信息']
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      feeTime: [],
      activeCollapse: ['1'],
      changeList: [],
      htmlTitle: '学生信息',
      imageUrl: '',
      id: 0,
      form: {
        account: '',
        username: '',
        id: ''
      },
      formLabelWidth: '50px',
      info: {
        baseInfo: {

        },
        feeList: [],
        employInfo: {

        },
        visitList: [],
        practiceList: [],
        certificateDetail: {
          necessaryList: [],
          optionList: []
        },
        feeArrearageList: [],
        feeReturnList: []
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
      enrollStu: ['1'],
      room: ['1'],
      f_remoney: ['1'],
      f_qmoney: ['1'],
      f_necessary: ['1'],
      f_option: ['1']

    }
  },
  methods: {
    formatDate (value) {
      if (value) {
        return moment(value).format('YY-MM-DD HH:mm:ss')
      } else {
        return null
      }
    },
    handleClick (item) {
      this.feeTime = item
    },
    displaySecond (index) {
      let x = index + 1
      return `第${x}次缴费`
    },
    display (item) {
      let data = String(item)
      if (data.includes('-')) {
        const [x, y] = data.split('-')
        return `第${x}学年第${y}学期`
      } else {
        return `第${data}学年`
      }
    },
    getCurrentStatusText (status) {
      switch (status) {
        case 0:
          return '在校'
        case 1:
          return '实习'
        case 2:
          return '就业'
        case 3:
          return '请假'
        case 4:
          return '休学'
        case 5:
          return '退学'
        case 6:
          return '毕业'
        case 7:
          return '未报到'
        default:
          return ''
      }
    },
    getSchoolStatusText (status) {
      switch (status) {
        case 0:
          return '已注册'
        case 1:
          return '未注册'
        case 2:
          return '注册前退学'
        case 3:
          return '注册后退学'
        default:
          return ''
      }
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('/stu/baseInfo/detail'),
        method: 'get',
        params: this.$http.adornParams({
          'id': this.id
        })
      }).then(({data}) => {
        if (data.code === 500) {
          this.$message.error(data.msg)
        }
        if (data && data.code === 0) {
          this.info = data.detail
          this.feeTime = data.detail.feeList[1]
          this.info.feeList.forEach(function (value, index, array) {
            if (array[index].paySchoolDate != null) {
              array[index].paySchoolDate = array[index].paySchoolDate.substring(0, 10)
            }
            if (array[index].returnFeeTime != null) {
              array[index].returnFeeTime = array[index].returnFeeTime.substring(0, 10)
            }
          })
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    getStatusChangeInfo () {
      this.$http({
        url: this.$http.adornUrl('stu/change/info'),
        method: 'get',
        params: this.$http.adornParams({
          'stuId': this.id
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.changeList = data.changeList
          console.log(this.changeList)
        } else {
          this.$message.error('获取学籍变更记录出错啦')
        }
      })
    },
    returnBack () {
      console.log(this.feeTime)
    },
    handleChange () {
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
  },
  created () {
    // this.id = this.$route.params.stuId
    this.id = this.$route.query.stuId
  },
  mounted () {
    this.getData()
    this.getStatusChangeInfo()
  }
}
</script>
<style scoped>

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

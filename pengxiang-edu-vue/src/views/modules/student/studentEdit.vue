<template>
  <div>
    <e-desc margin='0 12px' label-width='150px' title="学生详情" column="4">
      <e-desc-item  label="姓名"   icon="*">
        <el-input
          v-model="baseInfo.stuName"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="证件类型"  icon="*">
        <el-select v-model="baseInfo.idNumberType " placeholder="请选择证件类型">
          <el-option label="大陆居民身份证" value="大陆居民身份证" key="大陆居民身份证"></el-option>
          <el-option label="港澳台身份证" value="港澳台身份证" key="港澳台身份证"></el-option>
          <el-option label="其他" value="其他" key="其他"></el-option>
        </el-select>
    </e-desc-item>

      <e-desc-item label="证件号码"  icon="*">
        <el-input
          v-model="baseInfo.idNumber"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="出生年月" >
        <el-date-picker
          v-model="baseInfo.birthday"
          value-format="yyyy-MM-dd"
          placeholder="选择日期">
        </el-date-picker>
      </e-desc-item>
      <e-desc-item label="性别">
        <el-select v-model="baseInfo.gender " placeholder="请选择性别">
          <el-option label="男" value="男" key="男"></el-option>
          <el-option label="女" value="女" key="女"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="政治面貌">
<!--        <el-input-->
<!--          v-model="baseInfo.politicalStatus"-->
<!--          clearable>-->
<!--        </el-input>-->
        <el-select v-model="baseInfo.politicalStatus " placeholder="请选择政治面貌">
          <el-option label="党员" value="党员" key="党员"></el-option>
          <el-option label="团员" value="团员" key="团员"></el-option>
          <el-option label="群众" value="群众" key="群众"></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="籍贯" icon="*">
        <el-input
          v-model="baseInfo.nativePlace"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="民族">
        <el-input
          v-model="baseInfo.nation"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="联系电话">
        <el-input
          v-model="baseInfo.phone"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="户口性质" icon="*">
        <el-select v-model="baseInfo.residenceType" placeholder="请选择户口性质"  style="width: 100%">
          <el-option label="农村" :value='1' :key='1'></el-option>
          <el-option label="城市" :value='0' :key='0'></el-option>
          <el-option label="县城" :value='2' :key='2'></el-option>
          <el-option label="县镇" :value='3' :key='3'></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="入学前技能水平">
        <el-input
          v-model="baseInfo.skillBefore"
          clearable>
        </el-input>
      </e-desc-item>
      <e-desc-item label="入学学历">
        <el-select v-model="baseInfo.eduBefore" placeholder="请选择入学学历"  style="width: 100%">
          <el-option label="小学" value='小学' key='小学'></el-option>
          <el-option label="初中" value='初中' key='初中'></el-option>
          <el-option label="高中" value='高中' key='高中'></el-option>
          <el-option label="高中以上" value='高中以上' key='高中以上'></el-option>
        </el-select>
      </e-desc-item>
      <e-desc-item label="毕业学校" icon="*">
        <el-input
          v-model="baseInfo.schoolBefore"
          clearable>
        </el-input>
      </e-desc-item>
    </e-desc>

    <el-collapse v-model="stuStatus" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学生学籍信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px' column="4" >
          <e-desc-item label="学号" >
            <el-input
              v-model="baseInfo.schoolNumber"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="院校" icon="*">
            <el-select v-model="baseInfo.academyId"  value-key="value" placeholder="请选择" @change="handleAcademyId" style="width: 100%">
              <el-option
                v-for="item in academyList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="年级" icon="*">
            <el-select v-model="baseInfo.gradeId"  value-key="value" placeholder="请选择" @change="handleGradeId" style="width: 100%">
              <el-option
                v-for="item in gradeList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="专业" icon="*">
            <el-select v-model="baseInfo.majorId"  value-key="value" placeholder="请选择" @change="handleMajorId" style="width: 100%" >
              <el-option
                v-for="item in majorList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </e-desc-item>

          <e-desc-item label="班级">
            <el-select v-model="baseInfo.classId"  value-key="value" placeholder="请选择" @change="handleClassId" style="width: 100%">
              <el-option
                v-for="item in classList"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="班型" icon="*">
            <el-select v-model="baseInfo.classType " placeholder="请选择班型" style="width: 100%">
              <el-option label="就业" :value="1" :key="1"></el-option>
              <el-option label="升学" :value="0" :key="0"></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="学制" icon="*">
            <el-select v-model="baseInfo.schoolingLength " placeholder="请选择学制">
              <el-option label="二年" value="二年" key="二年"></el-option>
              <el-option label="三年" value="三年" key="三年"></el-option>
              <el-option label="四年" value="四年" key="四年"></el-option>
              <el-option label="五年" value="五年" key="五年"></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="当前状态" >
          <el-select v-model="baseInfo.currentStatus " placeholder="请选择当前状态" disabled>
            <el-option label="在校" :value="0" :key="0"></el-option>
            <el-option label="实习" :value="1" :key="1"></el-option>
            <el-option label="就业" :value="2" :key="2"></el-option>
            <el-option label="请假" :value="3" :key="3"></el-option>
            <el-option label="休学" :value="4" :key="4"></el-option>
            <el-option label="退学" :value="5" :key="5"></el-option>
            <el-option label="毕业" :value="6" :key="6"></el-option>
            <el-option label="未报到" :value="7" :key="7"></el-option>

          </el-select>
        </e-desc-item>
          <e-desc-item label="学籍状态" >
            <el-select v-model="baseInfo.schoolRollStatus " placeholder="请选择学籍状态" disabled>
              <el-option label="已注册" :value="0" :key="0"></el-option>
              <el-option label="未注册" :value="1" :key="1"></el-option>
              <el-option label="注册前退学" :value="2" :key="2"></el-option>
              <el-option label="注册后退学" :value="3" :key="3"></el-option>
            </el-select>
          </e-desc-item>

          <e-desc-item label="班主任" >
            <el-input
              v-model="baseInfo.headTeacher"
              clearable>
            </el-input>
          </e-desc-item>

          <e-desc-item label="培养层次">
            <el-input
              v-model="baseInfo.developLevel"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="现就读学校">
            <el-input
              v-model="baseInfo.studyIn"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="现学籍学校">
            <el-input
              v-model="baseInfo.statusSchool"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="招生季" icon="*">
            <el-select v-model="baseInfo.admissionSeason " placeholder="请选择招生季">
              <el-option label="春季" value="春季" key="春季"></el-option>
              <el-option label="秋季" value="秋季" key="秋季"></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="入学日期">
            <el-date-picker
              v-model="baseInfo.admissionDate"
              value-format="yyyy-MM-dd"
              placeholder="选择日期">
            </el-date-picker>
          </e-desc-item>
          <e-desc-item label="注册学籍日期">
            <el-date-picker
              v-model="baseInfo.registerDate"
              value-format="yyyy-MM-dd"
              placeholder="选择日期">
            </el-date-picker>
          </e-desc-item>
          <e-desc-item label="是否提前入学">
            <el-select v-model="baseInfo.isAdmissionEarly " placeholder="请选择">
              <el-option label="是" value="是" key="是"></el-option>
              <el-option label="否" value="否" key="否"></el-option>
            </el-select>
          </e-desc-item>

<!--          <e-desc-item label="系部">{{ baseInfo.deptId }}</e-desc-item>-->



          <e-desc-item label="班主任电话">
            <el-input
              v-model="baseInfo.headTeacherPhone"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="班主任所属部门">
            <el-input
              v-model="baseInfo.headTeacherDept"
              clearable>
            </el-input>
          </e-desc-item>
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
          <e-desc-item label="宿舍楼号" >
            <el-input
              v-model="baseInfo.dormNum"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="房间号" >
            <el-input
              v-model="baseInfo.roomNum"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="床位号" >
            <el-input
              v-model="baseInfo.bedNum"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="入住日期" >
            <el-date-picker
              v-model="baseInfo.checkIn"
              value-format="yyyy-MM-dd"
              placeholder="选择日期">
            </el-date-picker>
          </e-desc-item>
          <e-desc-item label="离宿日期" >
            <el-date-picker
              v-model="baseInfo.leaveDate"
              value-format="yyyy-MM-dd"
              placeholder="选择日期">
            </el-date-picker>
          </e-desc-item>
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
            <e-desc margin='0 12px' label-width='160px' column="3" >
              <e-desc-item label="变更前的当前状态">
                <el-select v-model="item.oldCurrentStatus" placeholder="请选择变更前的当前状态"  >
                  <el-option label="在校" :value="0"></el-option>
                  <el-option label="退学" :value="1"></el-option>
                  <el-option label="实习" :value="2"></el-option>
                  <el-option label="就业" :value="3"></el-option>
                  <el-option label="请假" :value="4"></el-option>
                  <el-option label="休学" :value="5"></el-option>
                  <el-option label="毕业" :value="6"></el-option>
                  <el-option label="未报到" :value="7"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="变更后的当前状态">
                <el-select v-model="item.newCurrentStatus" placeholder="请选择变更后的当前状态" >
                  <el-option label="在校" :value="0"></el-option>
                  <el-option label="退学" :value="1"></el-option>
                  <el-option label="实习" :value="2"></el-option>
                  <el-option label="就业" :value="3"></el-option>
                  <el-option label="请假" :value="4"></el-option>
                  <el-option label="休学" :value="5"></el-option>
                  <el-option label="毕业" :value="6"></el-option>
                  <el-option label="未报到" :value="7"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="变更前的学籍状态">
                <el-select v-model="item.oldSchoolRollStatus" placeholder="请选择学籍状态" >
                  <el-option label="已注册" :value="0"></el-option>
                  <el-option label="未注册" :value="1"></el-option>
                  <el-option label="注册前退学" :value="2"></el-option>
                  <el-option label="注册后退学" :value="3"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="变更后的学籍状态">
                <el-select v-model="item.newSchoolRollStatus" placeholder="请选择学籍状态" >
                  <el-option label="已注册" :value="0"></el-option>
                  <el-option label="未注册" :value="1"></el-option>
                  <el-option label="注册前退学" :value="2"></el-option>
                  <el-option label="注册后退学" :value="3"></el-option>
                </el-select>
              </e-desc-item>
              <e-desc-item label="学籍变更时间">
                <el-date-picker
                  v-model="item.updateTime"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="离校日期">
                <el-date-picker
                  v-model="item.levelDate"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="结束日期">
                <el-date-picker
                  v-model="item.endDate"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </e-desc-item>
              <e-desc-item label="学籍变更原因">
                <el-input  style="width: 700px;" v-model="item.changeDetail"></el-input>
              </e-desc-item>
              <e-desc-item label="提交修改">
                <el-button  type="primary" @click="handleSubmit(item,false)" >操作</el-button>
              </e-desc-item>
            </e-desc>
          </el-tab-pane>
          <el-tab-pane :name="addTabs.name" :closable = "addTabs.closeable">
            <div style="width: 100%; height: 100%;" slot="label"  @click="addTab">{{addTabs.title}}</div>
          </el-tab-pane>
        </el-tabs>

      </el-collapse-item>
    </el-collapse>


    <el-dialog :visible.sync="dialogVisible" title="新增变更记录"   :modal="false" >
      <e-desc margin='0 12px' label-width='160px' column="2">
        <e-desc-item label="变更前的当前状态">
          <el-select v-model="addStatus.oldCurrentStatus" placeholder="请选择变更前的当前状态"  disabled>
            <el-option label="在校" :value="0"></el-option>
            <el-option label="退学" :value="1"></el-option>
            <el-option label="实习" :value="2"></el-option>
            <el-option label="就业" :value="3"></el-option>
            <el-option label="请假" :value="4"></el-option>
            <el-option label="休学" :value="5"></el-option>
            <el-option label="毕业" :value="6"></el-option>
            <el-option label="未报到" :value="7"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="变更后的当前状态">
          <el-select v-model="addStatus.newCurrentStatus" placeholder="请选择变更后的当前状态" >
            <el-option label="在校" :value="0"></el-option>
            <el-option label="退学" :value="1"></el-option>
            <el-option label="实习" :value="2"></el-option>
            <el-option label="就业" :value="3"></el-option>
            <el-option label="请假" :value="4"></el-option>
            <el-option label="休学" :value="5"></el-option>
            <el-option label="毕业" :value="6"></el-option>
            <el-option label="未报到" :value="7"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="变更前的学籍状态">
          <el-select v-model="addStatus.oldSchoolRollStatus" placeholder="请选择学籍状态" disabled>
            <el-option label="已注册" :value="0"></el-option>
            <el-option label="未注册" :value="1"></el-option>
            <el-option label="注册前退学" :value="2"></el-option>
            <el-option label="注册后退学" :value="3"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="变更后的学籍状态">
          <el-select v-model="addStatus.newSchoolRollStatus" placeholder="请选择学籍状态" >
            <el-option label="已注册" :value="0"></el-option>
            <el-option label="未注册" :value="1"></el-option>
            <el-option label="注册前退学" :value="2"></el-option>
            <el-option label="注册后退学" :value="3"></el-option>
          </el-select>
        </e-desc-item>
        <e-desc-item label="学籍变更时间">
          <el-date-picker
            v-model="addStatus.updateTime"
            type="date"
            placeholder="选择日期"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="离校日期">
          <el-date-picker
            v-model="addStatus.levelDate"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="结束日期">
          <el-date-picker
            v-model="addStatus.endDate"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </e-desc-item>
        <e-desc-item label="学籍变更原因">
          <el-input  style="width: 700px;" v-model="addStatus.changeDetail"></el-input>
        </e-desc-item>
      </e-desc>
      <div slot="footer">
        <el-button @click="cancelDialog">取消</el-button>
        <el-button type="primary" @click="handleSubmit(addStatus,true)">确定</el-button>
      </div>
    </el-dialog>

    <el-collapse v-model="b_familly"  >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">家庭信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="是否家庭困难" >
            <el-select v-model="baseInfo.isDifficulty " placeholder="请选择">
              <el-option label="是" value="是" key="是"></el-option>
              <el-option label="否" value="否" key="否"></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="家庭困难类型" >

            <el-select v-model="baseInfo.difficultyType" placeholder="请选择">
              <el-option label="涉农专业" value="涉农专业" key="涉农专业"></el-option>
              <el-option label="22个县户籍" value="22个县户籍" key="22个县户籍"></el-option>
              <el-option label="家庭经济困难" value="家庭经济困难" key="家庭经济困难"></el-option>
              <el-option label="建档立卡家庭经济困难学生" value="建档立卡家庭经济困难学生" key="建档立卡家庭经济困难学生"></el-option>
              <el-option label="最低生活保障家庭学生" value="最低生活保障家庭学生" key="最低生活保障家庭学生"></el-option>
              <el-option label="特困供养学生" value="特困供养学生" key="特困供养学生"></el-option>
              <el-option label="孤儿学生" value="孤儿学生" key="孤儿学生"></el-option>
              <el-option label="烈士子女" value="烈士子女" key="烈士子女" ></el-option>
              <el-option label="家庭经济困难残疾学生" value="家庭经济困难残疾学生" key="家庭经济困难残疾学生" ></el-option>
              <el-option label="家庭经济困难残疾人子女" value="家庭经济困难残疾人子女" key="家庭经济困难残疾人子女"></el-option>
              <el-option label="其他" value="其他" key="其他"></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="资助申请类型" >
            <el-input
              v-model="baseInfo.supportType"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="身份证地址" >
            <el-input
              v-model="baseInfo.idCardAddr"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="家庭联系人" >
            <el-input
              v-model="baseInfo.familyMemberName"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="邮编" >
            <el-input
              v-model="baseInfo.postCode"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="家庭住址" >
            <el-input
              v-model="baseInfo.familyAddr"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="家庭联系电话" >
            <el-input
              v-model="baseInfo.familyPhone"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="家庭年总收入（元）" >
            <el-input
              v-model="baseInfo.totalIncome"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="家庭人均收入（元）" >
            <el-input
              v-model="baseInfo.aveIncome"
              clearable>
            </el-input>
          </e-desc-item>
          <e-desc-item label="家庭经济来源" >
            <el-input
              v-model="baseInfo.incomeSource"
              clearable>
            </el-input>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>
    <el-collapse v-model="b_assess" @change="handleChange" >
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">评定信息</span>
        </template>
        <e-desc margin='0 12px' label-width='150px'  column="4">
          <e-desc-item label="第一学期评定" >
            <el-select v-model="baseInfo.firstAssess" @change="handleInputChange2">
              <el-option label="优秀" value='优秀' key = '优秀'></el-option>
              <el-option label="良好" value='良好'  key='良好'></el-option>
              <el-option label="及格" value='及格' key='及格'></el-option>
              <el-option label="不及格" value='不及格' key='不及格' ></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="第二学期评定" >
            <el-select v-model="baseInfo.secondAssess" @change="handleInputChange2">
              <el-option label="优秀" value='优秀' key = '优秀'></el-option>
              <el-option label="良好" value='良好'  key='良好'></el-option>
              <el-option label="及格" value='及格' key='及格'></el-option>
              <el-option label="不及格" value='不及格' key='不及格' ></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="第三学期评定" >
            <el-select v-model="baseInfo.thirdAssess" @change="handleInputChange2">
              <el-option label="优秀" value='优秀' key = '优秀'></el-option>
              <el-option label="良好" value='良好'  key='良好'></el-option>
              <el-option label="及格" value='及格' key='及格'></el-option>
              <el-option label="不及格" value='不及格' key='不及格' ></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="第四学期评定" >
            <el-select v-model="baseInfo.fourthAssess" @change="handleInputChange2">
              <el-option label="优秀" value='优秀' key = '优秀'></el-option>
              <el-option label="良好" value='良好'  key='良好'></el-option>
              <el-option label="及格" value='及格' key='及格'></el-option>
              <el-option label="不及格" value='不及格' key='不及格' ></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="第五学期评定" >
            <el-select v-model="baseInfo.fifthAssess" @change="handleInputChange2">
              <el-option label="优秀" value='优秀' key = '优秀'></el-option>
              <el-option label="良好" value='良好'  key='良好'></el-option>
              <el-option label="及格" value='及格' key='及格'></el-option>
              <el-option label="不及格" value='不及格' key='不及格' ></el-option>
            </el-select>
          </e-desc-item>
          <e-desc-item label="第六学期评定" >
            <el-select v-model="baseInfo.sixthAssess" @change="handleInputChange2">
              <el-option label="优秀" value='优秀' key = '优秀'></el-option>
              <el-option label="良好" value='良好'  key='良好'></el-option>
              <el-option label="及格" value='及格' key='及格'></el-option>
              <el-option label="不及格" value='不及格' key='不及格' ></el-option>
            </el-select>
          </e-desc-item>
        </e-desc>
      </el-collapse-item>
    </el-collapse>
    <el-row style="padding: 50px;text-align: center;">
      <el-button
        type="success"
        @click="save()">确认
      </el-button>
    <el-button type="info" @click="returnBack">返回</el-button>
    </el-row>
  </div>
</template>


<script>
import EDesc from '../other/EDesc'
import EDescItem from '../other/EDescItem'
export default {
  components: {
    EDesc, EDescItem
  },
  data () {
    return {
      dialogVisible: false,
      activeCollapse: ['1'],
      changeList: [],
      addTabs: {
        title: '+',
        name: '+',
        closeable: false
      },
      imageUrl: '',
      id: 0,
      form: {
        account: '',
        username: '',
        id: ''
      },
      addStatus: {
        stuId: null,
        oldCurrentStatus: '',
        newCurrentStatus: '',
        oldSchoolRollStatus: '',
        newSchoolRollStatus: '',
        updateTime: '',
        levelDate: '',
        endDate: '',
        changeDetail: ''
      },
      baseInfo: {
        stuName: null,
        idNumberType: null,
        idNumber: null,
        schoolNumber: null,
        academyName: null,
        majorName: null,
        schoolingLength: null,
        gradeName: null,
        classType: null,
        headTeacher: null,
        phone: null,
        headTeacherPhone: null,
        postCode: null,
        familyPhone: null,
        totalIncome: null,
        aveIncome: null

      },
      isIndeterminate: true,
      b_assess: ['1'],
      b_familly: ['1'],
      stuStatus: ['1'],
      room: ['1'],
      academyId: null,
      majorId: null,
      gradeId: null,
      classId: null,
      academyList: [],
      majorList: [],
      gradeList: [],
      classList: []
    }
  },
  methods: {
    cancelDialog () {
      this.dialogVisible = false
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
        } else {
          this.$message.error("获取学籍变更记录出错啦")
        }
      })
    },
    getData () {
      this.$http({
        url: this.$http.adornUrl('stu/baseInfo/info'),
        method: 'get',
        params: this.$http.adornParams({
          'id': this.id
        })
      }).then(({data}) => {
        if (data.code === 500) {
          this.$message.error(data.msg)
        }
        if (data && data.code === 0) {
          this.baseInfo = data.baseInfo
          this.academyId = this.baseInfo.academyId
          this.majorId = this.baseInfo.majorId
          this.gradeId = this.baseInfo.gradeId
          this.getAcademyList()
          this.getGradeList()
          this.getMajorList()
          this.getClassList()
        } else {
          this.$message.error(data.msg)
        }
      })
    },
    returnBack () {
      this.$router.go(-1)
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
    addTab () {
      this.addStatus.oldCurrentStatus = this.baseInfo.currentStatus
      this.addStatus.newCurrentStatus = ''
      this.addStatus.oldSchoolRollStatus = this.baseInfo.schoolRollStatus
      this.addStatus.newSchoolRollStatus = ''
      var date = new Date()
      this.addStatus.updateTime = date
      this.addStatus.levelDate = ''
      this.addStatus.endDate = ''
      this.addStatus.changeDetail = ''
      this.dialogVisible = true
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
    save () {
      this.$confirm(`确定当前操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (this.baseInfo.stuName === null || this.baseInfo.stuName === '') {
          this.$message.error('学生姓名为空')
          return
        }
        if (this.baseInfo.idNumberType === null || this.baseInfo.idNumberType === '') {
          this.$message.error('证件类型为空')
          return
        }
        if (this.baseInfo.idNumber === null || this.baseInfo.idNumber === '') {
          this.$message.error('证件号码为空')
          return
        }
        if (this.baseInfo.nativePlace === null || this.baseInfo.nativePlace === '') {
          this.$message.error('籍贯为空')
          return
        }
        // if (this.baseInfo.schoolNumber === null || this.baseInfo.schoolNumber === '') {
        //   this.$message.error('学号为空')
        //   return
        // }
        if (this.baseInfo.residenceType === null || this.baseInfo.residenceType === '') {
          this.$message.error('户口性质为空')
          return
        }
        if (this.baseInfo.schoolBefore === null || this.baseInfo.schoolBefore === '') {
          this.$message.error('毕业院校为空')
          return
        }
        if (this.baseInfo.academyName === null || this.baseInfo.academyName === '') {
          this.$message.error('院校为空')
          return
        }
        if (this.baseInfo.gradeName === null || this.baseInfo.gradeName === '') {
          this.$message.error('年级为空')
          return
        }
        if (this.baseInfo.majorName === null || this.baseInfo.majorName === '') {
          this.$message.error('专业为空')
          return
        }
        if (this.baseInfo.classType === null || this.baseInfo.classType === '') {
          this.$message.error('班型为空')
          return
        }
        if (this.baseInfo.schoolingLength === null || this.baseInfo.schoolingLength === '') {
          this.$message.error('学制为空')
          return
        }
        if (this.baseInfo.admissionSeason === null || this.baseInfo.admissionSeason === '') {
          this.$message.error('招生季为空')
          return
        }
        // if (this.baseInfo.headTeacher === null || this.baseInfo.headTeacher === '') {
        //   this.$message.error('班主任为空')
        //   return
        // }
        // 验证纯数字
  /*      let regNumber = /^[0-9]*$/ */
        // 验证身份证
        let IDRe18 = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
        let IDre15 = /^([1-6][1-9]|50)\d{4}\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}$/
        // let regphone = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
        // let regphone2 = /^(0\d{2,3}-){0,1}\d{7,8}$/
        let regnum = /^[0-9]*$/
        let regpost = /^[0-9]{6}$/
/*        // 验证邮箱
        let regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/// 验证邮箱的正则表达式 */

        if (!(regnum.test(this.baseInfo.phone) || this.baseInfo.phone === null || this.baseInfo.phone === '')) {
          this.$message.error('联系电话校验错误')
          return
        }
        if (!(regnum.test(this.baseInfo.headTeacherPhone) || this.baseInfo.headTeacherPhone === null || this.baseInfo.headTeacherPhone === '')) {
          this.$message.error('班主任电话校验错误')
          return
        }
        if (!(regpost.test(this.baseInfo.postCode) || this.baseInfo.postCode === null || this.baseInfo.postCode === '')) {
          this.$message.error('邮编校验错误')
          return
        }
        if (!(regnum.test(this.baseInfo.familyPhone) || this.baseInfo.familyPhone === null || this.baseInfo.familyPhone === '')) {
          this.$message.error('家庭联系电话校验错误')
          return
        }
        if (!(regnum.test(this.baseInfo.totalIncome) || this.baseInfo.totalIncome === null || this.baseInfo.totalIncome === '')) {
          this.$message.error('家庭年总收入校验错误')
          return
        }
        if (!(regnum.test(this.baseInfo.aveIncome) || this.baseInfo.aveIncome === null || this.baseInfo.aveIncome === '')) {
          this.$message.error('家庭人均收入校验错误')
          return
        }
        if ((IDRe18.test(this.baseInfo.idNumber) || IDre15.test(this.baseInfo.idNumber))) {
          this.$http({
            url: this.$http.adornUrl('stu/baseInfo/save'),
            method: 'post',
            data: this.baseInfo
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.returnBack()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        } else {
          this.$message.error('身份证号码校验失败')
        }
      })
    },
    handleSubmit (val, isAdd) {
      if (isAdd) {
        val.stuId = this.baseInfo.stuId
      }
      if (isAdd && (this.addStatus.stuId === null || this.addStatus.stuId === '')) {
        this.$message.error('请返回列表重新修改')
        return
      }
      this.$confirm('确认更改状态吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('stu/change/save'),
          data: val,
          method: 'post'
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.dialogVisible = false
              }
            })
            this.getData()
          } else {
            this.$message.error('操作失败，请联系管理员')
          }
        })
      }).catch(() => {
        this.$message.success('已取消')
      })
    }
  },
  mounted () {
    var flag = this.$route.query.isEdit
    if (flag == 1) {
      window.alert(123)
      // this.id = this.$route.params.stuId
      this.id = this.$route.query.stuId
      this.getData()
      this.getStatusChangeInfo()
    } else {
      this.getAcademyList()
      this.id = 0
    }
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

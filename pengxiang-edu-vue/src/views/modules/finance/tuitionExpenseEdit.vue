<template>
  <div>
    <e-desc margin='0 12px' label-width='130px' title="学生基本信息">
      <e-desc-item label="学号">{{ info.schoolNumber }}</e-desc-item>
      <e-desc-item label="姓名">{{ info.stuName }}</e-desc-item>
      <e-desc-item label="身份证号码">{{ info.idNumber }}</e-desc-item>
      <e-desc-item label="出生日期">{{ info.birthday }}</e-desc-item>
      <e-desc-item label="毕业学校">{{ info.schoolBefore }}</e-desc-item>
      <e-desc-item label="性别">{{ info.gender }}</e-desc-item>
      <e-desc-item label="民族">{{ info.nation }}</e-desc-item>
      <e-desc-item label="籍贯">{{ info.nativePlace }}</e-desc-item>
      <e-desc-item label="户口性质">{{ info.residenceTypeName }}</e-desc-item>
      <e-desc-item label="政治面貌">{{ info.politicalStatus }}</e-desc-item>
      <e-desc-item label="联系电话">{{ info.phone }}</e-desc-item>
      <e-desc-item label="专业">{{ info.majorName }}</e-desc-item>
      <e-desc-item label="年级">{{ info.gradeName }}</e-desc-item>
      <e-desc-item label="班级">{{ info.className }}</e-desc-item>
      <e-desc-item label="班主任">{{ info.headTeacher }}</e-desc-item>
      <e-desc-item label="班主任电话">{{ info.headTeacherPhone }}</e-desc-item>
      <e-desc-item label="电子邮件">{{ info.email }}</e-desc-item>
    </e-desc>
    <el-collapse v-model="fee">
      <el-collapse-item name="1">
        <template slot="title">
          <span style="text-align: center; font-weight: bold; font-size: 16px;">学杂费收支情况</span>
        </template>
        <el-tabs>
          <el-tab-pane v-for="(item,index) in FeeInfo" :key="index" :label="display(item[0].paySchoolYear)"
                       @click="handleClick((item))">
            <el-tabs type="border-card">
              <el-tab-pane v-for="(item, index) in item" :key="index" :label="displaySecond(index,item)">
                <e-desc margin='0 12px' label-width='140px' column="3">
                  <div style="margin-bottom: 20px">
                    <e-desc-item label="减免类型">
                      <el-select v-model="item.derateType " placeholder="请选择减免类型" style="width: 100%">
                        <el-option label="农村户口" :value="农村户口" :key="农村户口"></el-option>
                        <el-option label="城市户口" :value="城市户口" :key="城市户口"></el-option>
                      </el-select>
                      </e-desc-item>
                    <e-desc-item label="减免备注">
                      <el-input
                        v-model="item.derateDetail"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="减免金额" color="#">
                      <el-input
                        v-model="item.derateMoney"
                        clearable>
                      </el-input>
                     </e-desc-item>
                    <e-desc-item label="减免备注" color="#">
                      <el-input
                        v-model="item.paySchoolYear"
                        clearable>
                      </el-input>
                      </e-desc-item>
                    <e-desc-item label="返费时间" color="#">
                      <el-input
                        v-model="item.returnFeeTime"
                        value-format="yyyy-MM-dd"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="应返费金额" color="#">
                      <el-input
                        v-model="item.needReturnFeeNum"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="返费金额" color="#">
                      <el-input
                        v-model="item.factReturnFeeNum"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="返费账户" color="#">
                      <el-input
                        v-model="item.account"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="返费账号" color="#">
                      <el-input
                        v-model="item.accountNumber"
                        clearable>
                      </el-input>
                      </e-desc-item>
                    <e-desc-item label="返费开户行" color="#">
                      <el-input
                        v-model="item.depositBank"
                        clearable>
                      </el-input>
                     </e-desc-item>
                    <e-desc-item label="是否欠费" color="#">
                      <el-input
                        v-model="item.ifQMoney"
                        clearable>
                      </el-input>
                   </e-desc-item>
                  </div>
                  <div style="margin-bottom: 20px">
                    <span style="text-align: center; font-weight: bold; font-size: 15px;">实缴、应缴情况</span>
                  </div>
                  <div style="margin-bottom: 20px">
                    <e-desc-item label="缴费学年">
                      <el-input
                        v-model="item.paySchoolYear"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="缴费日期">
                        <el-input
                          v-model="item.paySchoolDate"
                          value-format="yyyy-MM-dd"
                          clearable>
                        </el-input>
                    </e-desc-item>
                    <e-desc-item label="应缴培训费" color="#">
                      <el-input
                        v-model="item.payTrainFee"
                        clearable>
                      </el-input>
                      </e-desc-item>
                    <e-desc-item label="实缴培训费" color="#">
                      <el-input
                        v-model="item.trainFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                    <e-desc-item label="应缴服装费" color="#">
                      <el-input
                        v-model="item.payClothesFee"
                        clearable>
                      </el-input>
                      </e-desc-item>
                    <e-desc-item label="实缴服装费" color="#">
                      <el-input
                        v-model="item.clothesFee"
                        clearable>
                      </el-input>
                      </e-desc-item>
                    <e-desc-item label="应缴教材费" color="#">
                      <el-input
                        v-model="item.payBookFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                    <e-desc-item label="实缴教材费" color="#">
                      <el-input
                        v-model="item.bookFee"
                        clearable>
                      </el-input>
                     </e-desc-item>
                    <e-desc-item label="应缴住宿费" color="#">
                      <el-input
                        v-model="item.payHotelFee"
                        clearable>
                      </el-input>
                     </e-desc-item>
                    <e-desc-item label="实缴住宿费" color="#">
                      <el-input
                        v-model="item.hotelFee"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="应缴被褥费" color="#">
                      <el-input
                        v-model="item.payBedFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                    <e-desc-item label="实缴被褥费" color="#">
                      <el-input
                        v-model="item.bedFee"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="应缴保险费" color="#">
                      <el-input
                        v-model="item.payInsuranceFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                    <e-desc-item label="实缴保险费" color="#">
                      <el-input
                        v-model="item.insuranceFee"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="应缴公物押金" color="#">
                      <el-input
                        v-model="item.payPublicFee"
                        clearable>
                      </el-input>
                     </e-desc-item>
                    <e-desc-item label="实缴公物押金" color="#">
                      <el-input
                        v-model="item.publicFee"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="应缴证书费" color="#">
                      <el-input
                        v-model="item.payCertificateFee"
                        clearable>
                      </el-input>
                    </e-desc-item>
                    <e-desc-item label="实缴证书费" color="#">
                      <el-input
                        v-model="item.certificateFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                    <e-desc-item label="应缴国防教育费" color="#">
                      <el-input
                        v-model="item.payDefenseEduFee"
                        clearable>
                      </el-input>
                  </e-desc-item>
                    <e-desc-item label="实缴国防教育费" color="#">
                      <el-input
                        v-model="item.defenseEduFee"
                        clearable>
                      </el-input>
                      </e-desc-item>
                    <e-desc-item label="应缴体检费" color="#">
                      <el-input
                        v-model="item.payBodyExamFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                    <e-desc-item label="实缴体检费" color="#">
                      <el-input
                        v-model="item.bodyExamFee"
                        clearable>
                      </el-input>
                   </e-desc-item>
                   <e-desc-item>
                       <el-button
                         type="success"
                         @click="save(item)">确认
                       </el-button>
                     <el-button type="danger"  @click="deleteHandle(item)">删除</el-button>
                   </e-desc-item>
                  </div>
                </e-desc>
              </el-tab-pane>
            </el-tabs>

          </el-tab-pane>
        </el-tabs>
      </el-collapse-item>
    </el-collapse>

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
      FeeInfoList: [],
      feeTime: [],
      formLabelWidth: '50px',
      info: {
      },
      FeeInfo: {
      },
      fee: ['1']
    }
  },
  created () {
    this.getDataList()
  },
  methods: {
    save (item) {
      this.$confirm(`确定当前保存操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (item == null || item.id == null) {
          this.$message.error('合计不能编辑')
          return
        }
        this.$http({
          url: this.$http.adornUrl('generator/feeschoolsundry/save'),
          method: 'post',
          data: item
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
      })
    },
    handleClick (item) {
      this.feeTime = item
    },
    displaySecond (index, item) {
      if (item == null || item.id == null) {
        return '合计'
      } else {
        let x = index + 1
        return `第${x}次缴费`
      }
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
    // 删除
    deleteHandle (item) {
      this.$confirm(`确定当前删除操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (item == null || item.id == null) {
          this.$message.error('合计不能删除')
          return
        }
        var ids = [item.id]
        this.$http({
          url: this.$http.adornUrl('/generator/feeschoolsundry/delete'),
          method: 'post',
          data: this.$http.adornData(ids, false)
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDataList()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },
    getDataList () {
      this.$http.get(this.$http.adornUrl(`/generator/feeschoolsundry/sInfo/${this.$route.query.index}/`)).then(({data}) => {
        if (data && data.code === 0) {
          this.info = data.infoMap.stuInfo
          this.FeeInfo = data.infoMap.feeInfo
          this.FeeInfo.forEach(function (value, index, array) {
            if (array[index].paySchoolDate != null && array[index].paySchoolDate !== '') {
              array[index].paySchoolDate = array[index].paySchoolDate.substring(0, 10)
            }
            if (array[index].returnFeeTime != null && array[index].returnFeeTime !== '') {
              array[index].returnFeeTime = array[index].returnFeeTime.substring(0, 10)
            }
          })
          this.feeTime = this.FeeInfo[1]
        }
      })
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

<template>
  <div class="desc" :style="{margin}">
    <!-- 标题 -->
    <h1 v-if="title" class="desc-title" v-html="title"></h1>
    <el-row class="desc-row" ref='elRow'>
      <slot/>
    </el-row>
  </div>
</template>
<script>
export default {
  name: 'EDesc',
  // 通过provide提供给子组件
  provide () {
    return {
      labelWidth: this.labelWidth,
      column: this.column,
      size: this.size
    }
  },
  props: {
    // 标题
    title: {
      type: String,
      default: ''
    },
    // 边距
    margin: {
      type: String,
      default: '0'
    },
    // label宽度
    labelWidth: {
      type: String,
      default: '120px'
    },
    column: {
      // 每行显示的项目个数
      type: [Number, String],
      default: 3
    },
    size: {
      // 大小
      type: String,
      default: ''
    }
  },
  data () {
    return {
      // 监听插槽变化
      observe: new MutationObserver(this.computedSpan)
    }
  },
  mounted () {
    this.$nextTick(() => {
      this.computedSpan()
      this.observe.observe(this.$refs.elRow.$el, { childList: true })
    })
  },
  methods: {
    computedSpan () {
      // 筛选出子组件e-desc-item
      const dataSource = this.$slots.default
      const dataList = []
      dataSource.forEach(item => {
        if (item.componentOptions && item.componentOptions.tag === 'e-desc-item') {
          dataList.push(item.componentInstance)
        }
      })
      // 剩余span
      let leftSpan = this.column
      const len = dataList.length
      dataList.forEach((item, index) => {
        // 处理column与span之间的关系
        // 剩余的列数小于设置的span数
        const hasLeft = leftSpan <= (item.span || 1)
        // 当前列的下一列大于了剩余span
        const nextColumnSpan = (index < (len - 1)) && (dataList[index + 1].span >= leftSpan)
        // 是最后一行的最后一列
        const isLast = index === (len - 1)
        if (hasLeft || nextColumnSpan || isLast) {
          // 满足以上条件，需要自动补全span，避免最后一列出现残缺的情况
          item.selfSpan = leftSpan
          leftSpan = this.column
        } else {
          leftSpan -= item.span || 1
        }
      })
    }
  },
  beforeDestroy () {
    this.observer.disconnect()
  }
}
</script>

<style scoped lang="scss">
.desc{
  .desc-title {
    margin-bottom: 10px;
    color: #333;
    font-weight: 700;
    font-size: 16px;
    line-height: 1.5715;
  }
  .desc-row{
    display: flex;
    flex-wrap: wrap;
    border-radius: 2px;
    border: 1px solid #EBEEF5;
    border-bottom: 0;
    border-right: 0;
    width: 100%;
  }
}
</style>

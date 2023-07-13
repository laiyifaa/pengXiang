<template>
  <el-tree
    :data="treeList"
    node-key="id"
    :default-expanded-keys="[]"
    :default-checked-keys="[]"
    :props="defaultProps"
    @node-click="(data, node, item)"
  >
  </el-tree>
</template>

<script>
export default {
  name: 'treeForCheck',
  data () {
    return {
      treeList: [],
      defaultProps: {
        children: 'children',
        label: 'label'
      }
    }
  },
  methods: {
    getDeptTreeList () {
      this.$http({
        url: this.$http.adornUrl('/generator/sysdept/getDeptTreeList'),
        method: 'get'
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.treeList = data.data
        }
      })
    }
  }
}
</script>

<style scoped>

</style>

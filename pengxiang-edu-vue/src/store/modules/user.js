export default {
  namespaced: true,
  state: {
    id: 0,
    name: '',
    academyId: 0
  },
  mutations: {
    updateId (state, id) {
      state.id = id
    },
    updateName (state, name) {
      state.name = name
    },
    updateAcademyId (state, academyId) {
      state.academyId = academyId
    }
  }
}

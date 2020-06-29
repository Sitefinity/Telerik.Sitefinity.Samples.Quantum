import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        updateIteration: 0,
        triggerSubmit: 0,
        allowNavigate: false,
        widgets: [],
        submittedWidgets: 0
    },
    mutations: {
        update(state) {
            state.updateIteration++
        },
        // migrate to action
        triggersubmit(state) {
            state.submittedWidgets = 0;
            state.triggerSubmit++
        },
        allowNavigation(state) {
            state.allowNavigate = true;
        },
        vuecreated(state, name) {
            state.widgets.push(name);
        },
        widgetSubmitted(state) {
            state.submittedWidgets++;
        }
    },
    actions: {
        widgetSubmitted({ commit, state }) {
            if ((state.submittedWidgets + 1) == state.widgets.length) {
                commit('allowNavigation');
            }
            else {
                commit('widgetSubmitted');
            }
        }
    }
})

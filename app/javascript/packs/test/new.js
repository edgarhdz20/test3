import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('test_form')
  const props = JSON.parse(node.getAttribute('data'))
  const app = new Vue({
    render: h => h(App, {props})
  }).$mount('#test_form')
})
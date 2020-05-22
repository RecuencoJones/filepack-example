import Vue from 'vue';
import { config } from '@app/config';
import Home from './pages/index.vue';

const app = new Vue({
  el: '#app',
  render: (h) => h(Home),
  mounted() {
    console.log(config);
  }
});

app.$mount('#app');

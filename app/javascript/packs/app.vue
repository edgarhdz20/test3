<template>
  <div id="app">
    <form method="post" v-on:submit.prevent="onSubmit">
      <table>
        <tr>
          <th style="width:100px"><label>Nombre</label></th>
          <td><input v-model="name" v-model.trim="name" type="text" name="name"></td>
        </tr>
        <tr>
          <th style="width:100px"><label>Edad</label></th>
          <td><input v-model="age" type="number" name="age"></td>
        </tr>
      </table>
      <input type="submit" value="Guardar">
    </form>
    <div id="error_msg" v-bind:class="{ hidden: !hasErrors }">{{ errorMsg }}</div>
    <table>
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Edad</th>
        </tr>
      </thead>
      <tbody id="app-2">
        <tr v-for="test in tests">
          <td>{{ test.name }}</td>
          <td>{{ test.age }}</td>
        </tr>
      </tbody>
    </table>
  </div>

</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      name: null,
      age: null,
      tests: null,
      hasErrors: false,
      errorMsg: ""
    }
  },
  methods: {
    onSubmit: function () {
      axios.post('/tests', {
        test: {
          name: this.name,
          age: this.age,
        }
      })
      .then(response => {
        this.errorMsg = "";
        this.hasErrors = false;
        this.tests.unshift(response.data);
      })
      .catch(error => {
        console.log(error);
        this.errorMsg = "Ocurrio un error al intentar guardar.";
        this.hasErrors = true;
      })
    }
  },
  created: function(){
    axios.get('/tests.json')
    .then(response => {
      this.errorMsg = "";
      this.hasErrors = false;
      this.tests = response.data;
    })
    .catch(error => {
      console.log(error);
      this.errorMsg = "Ocurrio un error al cargar la lista.";
      this.hasErrors = true;
    })
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
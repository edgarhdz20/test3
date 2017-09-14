<template>
  <div id="app">
    <form action="/tests" method="post">
      <label>{{ name }}</label>
      <input type="text" name="test[name]">
      <br>
      <label>{{ age }}</label>
      <input type="number" name="test[age]">
      <br>
      <input type="submit" value="Guardar">
    </form>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      name: "Nombre",
      age: "Edad"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
<template>

  <form class="footer__form">
    <p>Contact</p>
    <label for="name">Name: </label>
    <input class="footer__form--input" type="text" id="name" name="name"><br>
    <label for="email">Email: </label>
    <input class="footer_form--input" type="text"  id="email" name="email"><br>
    <label for="message">Message: </label>
    <textarea class="footer__form--input-large" type="text" id="message" name="message"></textarea>
  </form>

  <h6>Dr. Liza Ignatova, &copy; 2022-2023 | <a href="#" target="_blank">Privacy Policy</a> </h6>



</template>

<script>
export default {
  name: "PageFooter"
}
</script>

<style scoped>

</style>
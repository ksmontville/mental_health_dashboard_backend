<template>
    <span class="footer__span">Contact Us!</span>

  <form class="footer__form">
    <span>
      <label for="name">Name:</label>
      <input class="footer__form--input" type="text" id="name" name="name" placeholder="Your Name">
    </span>
    <span>
      <label for="email">Email:</label>
      <input class="footer__form--input" type="text"  id="email" name="email" placeholder="Your Email">
    </span>
    <span>
      <label for="message">Message:</label>
      <textarea class="footer__form--input" type="text" id="message" name="message" placeholder="What can we help you with?"></textarea>
    </span>
  </form>

  <span class="footer__span">Dr. Liza Ignatova, &copy; 2022-2023 | <a href="#" target="_blank">Privacy Policy</a></span>



</template>

<script>
export default {
  name: "PageFooter"
}
</script>

<style scoped>

</style>
<template>
  <div class="container-fluid p-3 mb-5 bg-gradient">
    <span class="display-6 footer footer__span">Contact Us!</span>
      <div class="footer footer__content__top mt-3">
        <div class="footer footer-contact">
          <div class="form-floating">
            <input type="text" class="form-control form-control-sm" id="nameField" placeholder="Name">
            <label class="text-muted" for="nameField"><small>Name</small></label>
          </div>
          <div class="form-floating">
            <input type="email" class="form-control form-control-sm" id="emailField" placeholder="Email">
            <label class="text-muted" for="emailField"><small>Email</small></label>
          </div>
          <div class="form-floating">
            <textarea class="form-control" id="messageField" placeholder="How can we help you?"></textarea>
            <label class="text-muted" for="messageField"><small>How can we help you?</small></label>
          </div>
          <button class="btn btn-info btn-lg" type="submit">Submit</button>
        </div>

        <div class="container-fluid footer text-container">
          <small>Please note that it may take up to 72 hours before you receive a response. We hope to hear from you!</small>
        </div>
      </div>
      <div class="container-fluid text-center">
        <span class="footer footer__span"><small>Dr. Liza Ignatova, &copy; 2022-2023 | <a href="#" target="_blank">Privacy Policy</a></small></span>
      </div>
  </div>


</template>

<script>
export default {
  name: "PageFooter"
}
</script>

<style scoped>

</style>
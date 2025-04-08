$("#togglePassword").on("click", function() {
  let passwordInput = $("#passwd"); 
  let type = passwordInput.attr("type") === "password" ? "text" : "password"; 
  passwordInput.attr("type", type); 
  $(this).toggleClass("fa-eye fa-eye-slash");
});
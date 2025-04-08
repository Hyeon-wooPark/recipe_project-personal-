$(document).ready(() => {
  $("#domainSelect").on("change", function () {
    let selected = $(this).val();
    if(selected) {
      $("#domain").val(selected).prop("readonly", true);
    } else {
      $("#domain").val('').prop("readonly", false);
    }
  });
  
  $("#togglePassword1").on("click", function() {
        let passwordInput = $("#passwd1"); 
        let type = passwordInput.attr("type") === "password" ? "text" : "password"; 
        passwordInput.attr("type", type); 

        $(this).toggleClass("fa-eye fa-eye-slash");
    });
  
  $("#togglePassword2").on("click", function() {
        let passwordInput = $("#passwd2"); 
        let type = passwordInput.attr("type") === "password" ? "text" : "password"; 
        passwordInput.attr("type", type); 

        $(this).toggleClass("fa-eye fa-eye-slash");
    });
});
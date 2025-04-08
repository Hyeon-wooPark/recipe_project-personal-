$(document).ready(() => {
  $("#domainSelect").on("change", function () {
    let selected = $(this).val();
    if(selected) {
      $("#domain").val(selected).prop("readonly", true);
    } else {
      $("#domain").val('').prop("readonly", false);
    }
  });
  
  $("#numInput1").on("input", function(){
        if ($(this).val().length > 6) {
            $(this).val($(this).val().slice(0, 6));
        }
    });
  
  $("#numInput2").on("input", function(){
        if ($(this).val().length > 1) {
            $(this).val($(this).val().slice(0, 1));
        }
    });
  
  $("#numInput3").on("input", function() {
    if ($(this).val().length > 11) {
      $(this).val($(this).val().slice(0, 11));
    }
  })
  
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
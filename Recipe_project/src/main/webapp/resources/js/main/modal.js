$(document).ready(() => {
  if (msgType && msgType.trim() !== "") {
    $("#messageType").attr("class", "modal-header bg-danger bg-opacity-25 text-white");
    $("#myMessage").modal("show");
  }
});
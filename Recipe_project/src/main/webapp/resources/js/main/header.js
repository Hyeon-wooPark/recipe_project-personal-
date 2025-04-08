$(document).ready(function() {
  function updateTime() {
      const now = new Date();
      const timeStr = now.toLocaleTimeString(); 
      $('#clock').text(timeStr); 
    }

    setInterval(updateTime, 1000);
    updateTime();
})
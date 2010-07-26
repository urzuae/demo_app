$(function() {
  
  $('#users').hover(
    function() {
      $('.users').show();
    },
    function() {
      $('.users').hide();
    }
  );
  
  $('#microposts').hover(
    function() {
      $('.microposts').show ();
    },
    function() {
      $('.microposts').hide();
    }
  );
  
  
});
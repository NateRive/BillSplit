$(function() {
  $(".destroy-group").click(function() {
    var groupId = $(this).data("groupid");
    $("#modal-main").find("a:first").attr("href", `groups/${groupId}`)

    function modalResize() {
      var w = $(window).width();
      var h = $(window).height();
      var cw = $("#modal-main").outerWidth();
      var ch = $("#modal-main").outerHeight();
      $("#modal-main").css({
        "left": ((w - cw) / 2) + "px",
        "top": ((h - ch) / 2) + "px"
      });
    }
    modalResize();
    $("#modal-bg").fadeIn(500);
    $("#modal-main").fadeIn(500);
  });

  $("#not-delete-group").click(function() {
    $(this).css("color", "red");
    $("#modal-main, #modal-bg").fadeOut(1000);
  });
});

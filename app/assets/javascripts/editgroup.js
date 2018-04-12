$(function() {
  $(".destroy-member-btn").on("click", function(e) {
    e.preventDefault();
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
    var userId = $(this).data("id");
    $(".really-delete-member").attr("data-userId", userId);
    $("#modal-bg,#modal-main").fadeIn("slow");
  });

  $(".really-delete-member").click(function(e) {
    e.preventDefault();
    var userId = $(this).attr("data-userId");
    var groupId = $(".edit-group").data("groupid");
    var url = "/members/" + userId;
    $(`[data-id= ${userId}]`).parent().remove();
    console.log($(`[data-id= ${userId}]`).parent());
    $.ajax({
      type: "delete",
      url: url,
      data: { group_id: groupId },
      dataType: "json"
    })
    .done(function(data) {
      return false;
    })
    .fail(function(data) {
      alert("errors");
    })
    $("#modal-bg, #modal-main").fadeOut("fast");
  });

  $(".destroy").click(function() {
    $("#modal-bg, #modal-main").fadeOut("fast");
  });


})

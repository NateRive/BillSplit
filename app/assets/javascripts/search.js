$(function() {

  function appendHTML(group) {
    var html = `
      <div class= "hit-group clearfix">
      <p class= "hit-group__name">${group.name}</p>
      <p class= "hit-group__join" data-group-id= ${group.id} data-group-name= ${group.name}>加入</p>
      </div>
    `
    $(".search-result").append(html);
  }

  function appendNoHTML(message) {
    var html = `<p class= "hitGroup">${message}`
    $(".search-result").append(html);
  }

  $(".search-group").submit(function(e) {
    e.preventDefault();
    $(".search-result").empty();
    $(".resultedSearch").css("display", "block");
    $(".submit").removeAttr("data-disable-with");
    var keywordData = $("#keyword").val();
    $.ajax({
        url: "/groups/search",
        data: { keyword: keywordData },
        dataType: "json",
        type: "get",
        processData: true,
        contentType: false
      })
      .done(function(data) {
        if (data.length == 0) {
          appendNoHTML("一致するグループはありません");
        } else {
          data.forEach(function(group, index) {
            appendHTML(group);
          })
        }
      })
      .fail(function(data) {
        alert("errors");
      });
    $(this)[0].reset();
  });

  function appendModal(groupId, groupName) {
    $("#modal-main").find(".group-id").attr("value", groupId)
    $("#modal-main__group-name").text(`グループ名: ${groupName}`);
    var bg = `
    <div id="modal-bg"> </div>
    `
    $("body").append(bg);
  }



  $(".search-result").on("click", ".hit-group__join", function() {
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


    var groupId = $(this).attr("data-group-id");
    var groupName = $(this).attr("data-group-name");
    appendModal(groupId, groupName);
    modalResize();
    $("#modal-bg,#modal-main").fadeIn("slow");
  });

  $(".destroy").click(function() {
    $("#modal-bg, #modal-main").fadeOut("fast");
  });





})

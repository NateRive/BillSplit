$(function() {
  function appendHTML(userId, userName) {
    var html = `
    <div class="charged-user-person" data-user-id= "${userId}">
      <div class="charged-user-person__name">
        ${userName}
      </div>
      <div class="charge-button--delete">
        取り消し
      </div>
      <input type="hidden"
      name="charged_user[user_id][]"
      value= "${userId}" multiple= "multiple">
    </div>
    `
    $(".charged-user-list").append(html);
  }

  function checkAlreadyChosed(userId) {
    var tmp = []
    $(".charged-user-person").each(function(index, person) {
      tmp.push($(person).data("user-id"));
    });
    if (tmp.includes(userId)) {
      return false;
    } else {
      return true;
    }
  }


  $(".pay_off").click(function() {
    var text = $(this).prev().text();
    if (text == "0円") {
      return false
    }
  });



  $("#new_charge").submit(function(e) {
    var chargedUserLength = $(".charged-user-person").length;
    if (chargedUserLength == 0) {
      alert("請求対象を選んでください");
      return false;
    }
  });

  $(".charge-button").click(function() {
    var userId = $(this).parent().data("userid")
    var userName = $(this).siblings().text();
    if (checkAlreadyChosed(userId)) {
        appendHTML(userId, userName);
    } else {
      alert("already chosed!!");
    }
    });

  $(".charge-all-user__btn").click(function() {
    var number = $(".charge-button").length;
    var chargeButton= $(".charge-button");
    var preindex = 0
    for (var index = 0; index < number; index++) {
      var userId = $(chargeButton[index]).parent().data("userid");
      var userName = $(chargeButton[index]).siblings().text();
      if (checkAlreadyChosed(userId)) {
      appendHTML(userId, userName);
      } else {
        preindex += 1
      }
    }
    if (preindex == number) {
      alert("already chosed!!")
    }
  });

  $(".charged-user-list").on("click", ".charge-button--delete", function() {
    $(this).parent().remove();
  });


  function bottom() {
    var boolean = $("div").hasClass("group__middle-content");
    if (boolean) {
      $(".group__right-content").animate({
        scrollTop: $(".group__right-content")[0].scrollHeight
      }, 500);
    }
  }

  bottom();
});

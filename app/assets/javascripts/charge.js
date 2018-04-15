$(function() {
  function appendHTML(userId, userName) {
    var html = `
    <div class="charged-user-person">
      <div class="charged-user-person__name">
        ${userName}
      </div>
      <div class="charge-button--delete">
        取り消し
      </div>
      <input type="hidden" name="charge[chargeduser_id][]" value="${userId}">
    </div>
    `
    $(".charged-user-list").append(html);
  }

  $(".charge-button").click(function() {
    var userId = $(this).parent().data("userid")
    var userName = $(this).siblings().text();
    appendHTML(userId, userName);
    });

  $(".charge-all-user__btn").click(function() {
    var number = $(".charge-button").length;
    var chargeButton= $(".charge-button");
    console.log($(chargeButton[3]).parent());
    for (var index = 0; index < number; index++) {
      var userId = $(chargeButton[index]).parent().data("userid");
      var userName = $(chargeButton[index]).siblings().text();
      appendHTML(userId, userName);
    }
  });
});

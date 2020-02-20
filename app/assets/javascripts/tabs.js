$(function() {
  /*クリックイベント*/
  $('.tab').on('click', function() {
    $('.panel').removeClass("is-show");
    $($(this).attr("href")).addClass("is-show");
    $('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
  });
});
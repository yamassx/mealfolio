$(function() {
  $('.tab').on('click', function() {
    $('.tab').removeClass("is-show");
    $($(this).attr("href")).addClass("is-show");
    $('.tab').removeClass('is-active');
    $(this).addClass('is-active');
  });
});
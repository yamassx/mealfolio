$(function(){
  // 「.modal-open」をクリック
  $('.js-modal-open').click(function(){
//   $('.js-modal-open').each("click" function(){
    // $('modal-content').remove();
      // オーバーレイ用の要素を追加
    $('body').append('<div class="modal-overlay"></div>');
      // オーバーレイをフェードイン
    $('.modal-overlay').fadeIn('slow');

      // モーダルコンテンツのIDを取得
    //   var modal = $('#' + 'modal__content-' + variable);
    //   var modal = $("#" + "$(portfolio.id)");
    var modal = $('modal-content');
    //   var modal = `<div class = "portfolio-show-modal__show-portfolio clearfix modal-content" id = "modal__content-${portfolio.id}">
    //                 <div class = "portfolio-show-modal__show-portfolio__image">
    //                   <img class = "image" src = "${portfolio.image1.url}" size = "250x200"></img>
    //                 </div>
    //                 <div class = "portfolio-show-modal__show-portfolio__technic">
    //                   <div class = "portfolio-show-modal__show-portfolio__technic__title">
    //                     使用技術
    //                   </div>
    //                   <div class = "portfolio-show-modal__show-portfolio__technic__content">
    //                     ${portfolio.tecnic}
    //                   </div>
    //                 </div>
    //                 <div class = "portfolio-show-modal__show-portfolio__detail">
    //                   <div class = "portfolio-show-modal__show-portfolio__detail__title">
    //                     説明
    //                   </div>
    //                   <div class = "portfolio-show-modal__show-portfolio__detail__content">
    //                     ${portfolio.detale}
    //                   </div>
    //                 </div>
    //                </div>`
      // モーダルコンテンツの表示位置を設定
      modalResize();
       // モーダルコンテンツフェードイン
      $(modal).fadeIn('normal');

      // 「.modal-overlay」あるいは「.modal-close」をクリック
      // $('.modal-overlay, .modal-close').off().click(function(){
        $('.modal-overlay').off().click(function(){

          // モーダルコンテンツとオーバーレイをフェードアウト
          $(modal).fadeOut('normal');
          $('.modal-overlay').fadeOut('normal',function(){
              // オーバーレイを削除
              $('.modal-overlay').remove();
          });
        });

      // リサイズしたら表示位置を再取得
      $(window).on('resize', function(){
          modalResize();
      });

      // モーダルコンテンツの表示位置を設定する関数
      function modalResize(){
          // ウィンドウの横幅、高さを取得
          var w = $(window).width();
          var h = $(window).height();

          // モーダルコンテンツの表示位置を取得
          var x = (w - $(modal).outerWidth(true)) / 2;
          var y = (h - $(modal).outerHeight(true)) / 2;

          // モーダルコンテンツの表示位置を設定
          $(modal).css({'left': x + 'px','top': y + 'px'});
      }
      return false
  });
});
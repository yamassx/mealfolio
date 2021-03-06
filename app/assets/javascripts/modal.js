$(function(){
  // 「.modal-open」をクリック
  $('.js-modal-open').click(function(){
      // オーバーレイ用の要素を追加
      $('body').append('<div class="modal-overlay"></div>');
      // オーバーレイをフェードイン
      $('.modal-overlay').fadeIn('slow');

      // モーダルコンテンツのIDを取得
      var modal = '#modal__content';
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

  });
});
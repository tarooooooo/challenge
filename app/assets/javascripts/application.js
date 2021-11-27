// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(function() {
    // .tabがクリックされたときを指定
    $('.tab').click(function(){
      // 今ある.tab-activeを削除
      $('.tab-active').removeClass('tab-active');
      // クリックされた.tabに.tab-activeを追加
      $(this).addClass('tab-active');
      // 今ある.box-showを削除
      $('.box-show').removeClass('box-show');
      // indexに.tabのindex番号を代入
      const index = $(this).index();
      // .tabboxとindexの番号が同じ要素に.box-showを追加
      $('.tabbox').eq(index).addClass('box-show');
    });
  });
});


$(document).on('turbolinks:load', function() {
  var zindex = 10;

  $("li.card7").click(function(e){
    e.preventDefault();

    var isShowing = false;

    if ($(this).hasClass("show")) {
      isShowing = true
    }

    if ($("ul.cards7").hasClass("showing")) {
      $("li.card7.show")
        .removeClass("show");

      if (isShowing) {
        $("ul.cards7")
          .removeClass("showing");
      } else {
        $(this)
          .css({zIndex: zindex})
          .addClass("show");

      }

      zindex++;

    } else {
      // no cards in view
      $("ul.cards7")
        .addClass("showing");
      $(this)
        .css({zIndex:zindex})
        .addClass("show");
      zindex++;
    }

  });
});

$(function(){
  $('.section').hide();

  $('.secList').on('click',function(){
    $('.section').not($($(this).attr('href'))).hide();
    $($(this).attr('href')).fadeToggle(1000);
  });
});
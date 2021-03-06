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
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require owl.carousel
//= require chartkick
//= require Chart.bundle
//= require_tree .

$(function () {
  $(".date-picker").datetimepicker({
    format: "MM-DD",
    useCurrent: false,
  });
});

// $(".date-picker").datetimepicker((pickTime: false));

$(function () {
  $(".slide-banner.owl-carousel").owlCarousel({
    items: 4
  });
});

// ユーザー更新を押したらページ上部へいく
$(function () {
  $("#user_edit").click(function () {
    $("html,body").animate({
      scrollTop: 0
    }, "1000");
  });
});
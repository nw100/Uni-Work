if (addEventListener) addEventListener("load",myJS,false);
else attachEvent("onload", myJS);
function myJS() {
"use strict";

$ = jQuery;

$(function () {
  $("#fixed-bar")
    .css({position:'fixed',bottom:'0px'})
    .hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 400) {
      $('#fixed-bar').fadeIn(400);
    } else {
      $('#fixed-bar').fadeOut(400);
    }
  });
});

$('.go-to-top').click(function () {
  $('html,body').animate({
    scrollTop: 0
  }, 1000);
  return false;
});

$('.go-to-content').click(function () {
var window = $('html, body'),
    scrollTo = $('#content');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

$('.go-to-page').click(function () {
var window = $('html, body'),
    scrollTo = $('#sForm');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});


$('.go-to-content').click(function () {
var window = $('html, body'),
    scrollTo = $('#content');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

$(function () {
  var window = $('html, body');
  
  $('.go-to-html').click(function () {
	var scrollTo = $('#html');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-css').click(function () {
	var scrollTo = $('#css');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-gimp').click(function () {
	var scrollTo = $('#gimp');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-inkscape').click(function () {
	var scrollTo = $('#inkscape');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-svg').click(function () {
	var scrollTo = $('#svg');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-jScript').click(function () {
	var scrollTo = $('#jScript');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-extras').click(function () {
	var scrollTo = $('#extras');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});

  $('.go-to-testing').click(function () {
	var scrollTo = $('#testing');

 window.animate({
    scrollTop: scrollTo.offset().top - window.offset().top + window.scrollTop()
  }, 1000);
  return false;
});
});







$('.about_animate').click(function(){
var q1 = $('.q1');
var q2 = $('.q2');
var q3 = $('.q3');
var q4 = $('.q4');
var q5 = $('.q5');

	q1.animate({ fontSize: "8em"},1000);
	q1.animate({ fontSize: "5em"},1000);
	q2.animate({ fontSize: "5em"},1000);
	q2.animate({ fontSize: "3em"},1000);
	q3.animate({ fontSize: "6em"},1000);
	q3.animate({ fontSize: "5em"},1000);
	q4.animate({ fontSize: "10em"},1000);
	q4.animate({ fontSize: "8em"},1000);
	q5.animate({ fontSize: "5em"},1000);
	q5.animate({ fontSize: "2em"},1000);

}); 


}




function toReport() {
window.location = './report.html'
}

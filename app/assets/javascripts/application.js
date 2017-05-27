//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./theme

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

$('.apply-modal').magnificPopup({
  type: 'inline',

  fixedContentPos: false,
  fixedBgPos: true,

  overflowY: 'auto',

  closeBtnInside: true,
  preloader: false,

  midClick: true,
  removalDelay: 300,
  mainClass: 'my-mfp-zoom-in'
});

if($("span.countdown").length > 0) {
  var timeLeft = parseInt($("span.countdown").text());
  var endTime = 0;
  var interval = setInterval(function(){
    timeLeft--;
    if(timeLeft==0) {
      clearInterval(interval);
      $("span.countdown").text(timeLeft);
      window.location = getParameterByName('url');
    } else {
      $("span.countdown").text(timeLeft);
    }
  }, 1000);
}

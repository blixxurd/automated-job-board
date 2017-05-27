//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./theme

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

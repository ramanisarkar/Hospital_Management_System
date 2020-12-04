<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<link rel="stylesheet" href="js/Desbord_Css.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
$(document).ready(function(){
	$.get('Login',{flag:"PermissionRole"},function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$.each(obj, function(index, value) {
			if(obj[index].bool1 == true || obj[index].bool2 == true){
				console.log("fnuisdhaafd");
				$('.'+obj[index].field3+'_menu').removeClass("all_manu");
			}
		});
		$(".all_manu").remove();
		$("#body").css("display", "block");
	});
});
</script>
<style type="text/css">
@font-face{font-family:'FontAwesome';src:url('fonts/fontawesome-webfont.eot?v=4.3.0');src:url('fonts/fontawesome-webfont.eot?#iefix&v=4.3.0') format('embedded-opentype'),url('fonts/fontawesome-webfont.woff2?v=4.3.0') format('woff2'),url('fonts/fontawesome-webfont.woff?v=4.3.0') format('woff'),url('fonts/fontawesome-webfont.ttf?v=4.3.0') format('truetype'),url('fonts/fontawesome-webfont.svg?v=4.3.0#fontawesomeregular') format('svg');font-weight:normal;font-style:normal}.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;transform:translate(0, 0)}.fa-lg{font-size:1.33333333em;line-height:.75em;vertical-align:-15%}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-fw{width:1.28571429em;text-align:center}.fa-ul{padding-left:0;margin-left:2.14285714em;list-style-type:none}.fa-ul>li{position:relative}.fa-li{position:absolute;left:-2.14285714em;width:2.14285714em;top:.14285714em;text-align:center}.fa-li.fa-lg{left:-1.85714286em}.fa-border{padding:.2em .25em .15em;border:solid .08em #eee;border-radius:.1em}.pull-right{float:right}.pull-left{float:left}.fa.pull-left{margin-right:.3em}.fa.pull-right{margin-left:.3em}.fa-spin{-webkit-animation:fa-spin 2s infinite linear;animation:fa-spin 2s infinite linear}.fa-pulse{-webkit-animation:fa-spin 1s infinite steps(8);animation:fa-spin 1s infinite steps(8)}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}.fa-rotate-90{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=1);-webkit-transform:rotate(90deg);-ms-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=2);-webkit-transform:rotate(180deg);-ms-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=3);-webkit-transform:rotate(270deg);-ms-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1);-webkit-transform:scale(-1, 1);-ms-transform:scale(-1, 1);transform:scale(-1, 1)}.fa-flip-vertical{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1);-webkit-transform:scale(1, -1);-ms-transform:scale(1, -1);transform:scale(1, -1)}:root .fa-rotate-90,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-flip-horizontal,:root .fa-flip-vertical{filter:none}.fa-stack{position:relative;display:inline-block;width:2em;height:2em;line-height:2em;vertical-align:middle}.fa-stack-1x,.fa-stack-2x{position:absolute;left:0;width:100%;text-align:center}.fa-stack-1x{line-height:inherit}.fa-stack-2x{font-size:2em}.fa-inverse{color:#fff}.fa-glass:before{content:"\f000"}.fa-music:before{content:"\f001"}.fa-search:before{content:"\f002"}.fa-envelope-o:before{content:"\f003"}.fa-heart:before{content:"\f004"}.fa-star:before{content:"\f005"}.fa-star-o:before{content:"\f006"}.fa-user:before{content:"\f007"}.fa-film:before{content:"\f008"}.fa-th-large:before{content:"\f009"}.fa-th:before{content:"\f00a"}.fa-th-list:before{content:"\f00b"}.fa-check:before{content:"\f00c"}.fa-remove:before,.fa-close:before,.fa-times:before{content:"\f00d"}.fa-search-plus:before{content:"\f00e"}.fa-search-minus:before{content:"\f010"}.fa-power-off:before{content:"\f011"}.fa-signal:before{content:"\f012"}.fa-gear:before,.fa-cog:before{content:"\f013"}.fa-trash-o:before{content:"\f014"}.fa-home:before{content:"\f015"}.fa-file-o:before{content:"\f016"}.fa-clock-o:before{content:"\f017"}.fa-road:before{content:"\f018"}.fa-download:before{content:"\f019"}.fa-arrow-circle-o-down:before{content:"\f01a"}.fa-arrow-circle-o-up:before{content:"\f01b"}.fa-inbox:before{content:"\f01c"}.fa-play-circle-o:before{content:"\f01d"}.fa-rotate-right:before,.fa-repeat:before{content:"\f01e"}.fa-refresh:before{content:"\f021"}.fa-list-alt:before{content:"\f022"}.fa-lock:before{content:"\f023"}.fa-flag:before{content:"\f024"}.fa-headphones:before{content:"\f025"}.fa-volume-off:before{content:"\f026"}.fa-volume-down:before{content:"\f027"}.fa-volume-up:before{content:"\f028"}.fa-qrcode:before{content:"\f029"}.fa-barcode:before{content:"\f02a"}.fa-tag:before{content:"\f02b"}.fa-tags:before{content:"\f02c"}.fa-book:before{content:"\f02d"}.fa-bookmark:before{content:"\f02e"}.fa-print:before{content:"\f02f"}.fa-camera:before{content:"\f030"}.fa-font:before{content:"\f031"}.fa-bold:before{content:"\f032"}.fa-italic:before{content:"\f033"}.fa-text-height:before{content:"\f034"}.fa-text-width:before{content:"\f035"}.fa-align-left:before{content:"\f036"}.fa-align-center:before{content:"\f037"}.fa-align-right:before{content:"\f038"}.fa-align-justify:before{content:"\f039"}.fa-list:before{content:"\f03a"}.fa-dedent:before,.fa-outdent:before{content:"\f03b"}.fa-indent:before{content:"\f03c"}.fa-video-camera:before{content:"\f03d"}.fa-photo:before,.fa-image:before,.fa-picture-o:before{content:"\f03e"}.fa-pencil:before{content:"\f040"}.fa-map-marker:before{content:"\f041"}.fa-adjust:before{content:"\f042"}.fa-tint:before{content:"\f043"}.fa-edit:before,.fa-pencil-square-o:before{content:"\f044"}.fa-share-square-o:before{content:"\f045"}.fa-check-square-o:before{content:"\f046"}.fa-arrows:before{content:"\f047"}.fa-step-backward:before{content:"\f048"}.fa-fast-backward:before{content:"\f049"}.fa-backward:before{content:"\f04a"}.fa-play:before{content:"\f04b"}.fa-pause:before{content:"\f04c"}.fa-stop:before{content:"\f04d"}.fa-forward:before{content:"\f04e"}.fa-fast-forward:before{content:"\f050"}.fa-step-forward:before{content:"\f051"}.fa-eject:before{content:"\f052"}.fa-chevron-left:before{content:"\f053"}.fa-chevron-right:before{content:"\f054"}.fa-plus-circle:before{content:"\f055"}.fa-minus-circle:before{content:"\f056"}.fa-times-circle:before{content:"\f057"}.fa-check-circle:before{content:"\f058"}.fa-question-circle:before{content:"\f059"}.fa-info-circle:before{content:"\f05a"}.fa-crosshairs:before{content:"\f05b"}.fa-times-circle-o:before{content:"\f05c"}.fa-check-circle-o:before{content:"\f05d"}.fa-ban:before{content:"\f05e"}.fa-arrow-left:before{content:"\f060"}.fa-arrow-right:before{content:"\f061"}.fa-arrow-up:before{content:"\f062"}.fa-arrow-down:before{content:"\f063"}.fa-mail-forward:before,.fa-share:before{content:"\f064"}.fa-expand:before{content:"\f065"}.fa-compress:before{content:"\f066"}.fa-plus:before{content:"\f067"}.fa-minus:before{content:"\f068"}.fa-asterisk:before{content:"\f069"}.fa-exclamation-circle:before{content:"\f06a"}.fa-gift:before{content:"\f06b"}.fa-leaf:before{content:"\f06c"}.fa-fire:before{content:"\f06d"}.fa-eye:before{content:"\f06e"}.fa-eye-slash:before{content:"\f070"}.fa-warning:before,.fa-exclamation-triangle:before{content:"\f071"}.fa-plane:before{content:"\f072"}.fa-calendar:before{content:"\f073"}.fa-random:before{content:"\f074"}.fa-comment:before{content:"\f075"}.fa-magnet:before{content:"\f076"}.fa-chevron-up:before{content:"\f077"}.fa-chevron-down:before{content:"\f078"}.fa-retweet:before{content:"\f079"}.fa-shopping-cart:before{content:"\f07a"}.fa-folder:before{content:"\f07b"}.fa-folder-open:before{content:"\f07c"}.fa-arrows-v:before{content:"\f07d"}.fa-arrows-h:before{content:"\f07e"}.fa-bar-chart-o:before,.fa-bar-chart:before{content:"\f080"}.fa-twitter-square:before{content:"\f081"}.fa-facebook-square:before{content:"\f082"}.fa-camera-retro:before{content:"\f083"}.fa-key:before{content:"\f084"}.fa-gears:before,.fa-cogs:before{content:"\f085"}.fa-comments:before{content:"\f086"}.fa-thumbs-o-up:before{content:"\f087"}.fa-thumbs-o-down:before{content:"\f088"}.fa-star-half:before{content:"\f089"}.fa-heart-o:before{content:"\f08a"}.fa-sign-out:before{content:"\f08b"}.fa-linkedin-square:before{content:"\f08c"}.fa-thumb-tack:before{content:"\f08d"}.fa-external-link:before{content:"\f08e"}.fa-sign-in:before{content:"\f090"}.fa-trophy:before{content:"\f091"}.fa-github-square:before{content:"\f092"}.fa-upload:before{content:"\f093"}.fa-lemon-o:before{content:"\f094"}.fa-phone:before{content:"\f095"}.fa-square-o:before{content:"\f096"}.fa-bookmark-o:before{content:"\f097"}.fa-phone-square:before{content:"\f098"}.fa-twitter:before{content:"\f099"}.fa-facebook-f:before,.fa-facebook:before{content:"\f09a"}.fa-github:before{content:"\f09b"}.fa-unlock:before{content:"\f09c"}.fa-credit-card:before{content:"\f09d"}.fa-rss:before{content:"\f09e"}.fa-hdd-o:before{content:"\f0a0"}.fa-bullhorn:before{content:"\f0a1"}.fa-bell:before{content:"\f0f3"}.fa-certificate:before{content:"\f0a3"}.fa-hand-o-right:before{content:"\f0a4"}.fa-hand-o-left:before{content:"\f0a5"}.fa-hand-o-up:before{content:"\f0a6"}.fa-hand-o-down:before{content:"\f0a7"}.fa-arrow-circle-left:before{content:"\f0a8"}.fa-arrow-circle-right:before{content:"\f0a9"}.fa-arrow-circle-up:before{content:"\f0aa"}.fa-arrow-circle-down:before{content:"\f0ab"}.fa-globe:before{content:"\f0ac"}.fa-wrench:before{content:"\f0ad"}.fa-tasks:before{content:"\f0ae"}.fa-filter:before{content:"\f0b0"}.fa-briefcase:before{content:"\f0b1"}.fa-arrows-alt:before{content:"\f0b2"}.fa-group:before,.fa-users:before{content:"\f0c0"}.fa-chain:before,.fa-link:before{content:"\f0c1"}.fa-cloud:before{content:"\f0c2"}.fa-flask:before{content:"\f0c3"}.fa-cut:before,.fa-scissors:before{content:"\f0c4"}.fa-copy:before,.fa-files-o:before{content:"\f0c5"}.fa-paperclip:before{content:"\f0c6"}.fa-save:before,.fa-floppy-o:before{content:"\f0c7"}.fa-square:before{content:"\f0c8"}.fa-navicon:before,.fa-reorder:before,.fa-bars:before{content:"\f0c9"}.fa-list-ul:before{content:"\f0ca"}.fa-list-ol:before{content:"\f0cb"}.fa-strikethrough:before{content:"\f0cc"}.fa-underline:before{content:"\f0cd"}.fa-table:before{content:"\f0ce"}.fa-magic:before{content:"\f0d0"}.fa-truck:before{content:"\f0d1"}.fa-pinterest:before{content:"\f0d2"}.fa-pinterest-square:before{content:"\f0d3"}.fa-google-plus-square:before{content:"\f0d4"}.fa-google-plus:before{content:"\f0d5"}.fa-money:before{content:"\f0d6"}.fa-caret-down:before{content:"\f0d7"}.fa-caret-up:before{content:"\f0d8"}.fa-caret-left:before{content:"\f0d9"}.fa-caret-right:before{content:"\f0da"}.fa-columns:before{content:"\f0db"}.fa-unsorted:before,.fa-sort:before{content:"\f0dc"}.fa-sort-down:before,.fa-sort-desc:before{content:"\f0dd"}.fa-sort-up:before,.fa-sort-asc:before{content:"\f0de"}.fa-envelope:before{content:"\f0e0"}.fa-linkedin:before{content:"\f0e1"}.fa-rotate-left:before,.fa-undo:before{content:"\f0e2"}.fa-legal:before,.fa-gavel:before{content:"\f0e3"}.fa-dashboard:before,.fa-tachometer:before{content:"\f0e4"}.fa-comment-o:before{content:"\f0e5"}.fa-comments-o:before{content:"\f0e6"}.fa-flash:before,.fa-bolt:before{content:"\f0e7"}.fa-sitemap:before{content:"\f0e8"}.fa-umbrella:before{content:"\f0e9"}.fa-paste:before,.fa-clipboard:before{content:"\f0ea"}.fa-lightbulb-o:before{content:"\f0eb"}.fa-exchange:before{content:"\f0ec"}.fa-cloud-download:before{content:"\f0ed"}.fa-cloud-upload:before{content:"\f0ee"}.fa-user-md:before{content:"\f0f0"}.fa-stethoscope:before{content:"\f0f1"}.fa-suitcase:before{content:"\f0f2"}.fa-bell-o:before{content:"\f0a2"}.fa-coffee:before{content:"\f0f4"}.fa-cutlery:before{content:"\f0f5"}.fa-file-text-o:before{content:"\f0f6"}.fa-building-o:before{content:"\f0f7"}.fa-hospital-o:before{content:"\f0f8"}.fa-ambulance:before{content:"\f0f9"}.fa-medkit:before{content:"\f0fa"}.fa-fighter-jet:before{content:"\f0fb"}.fa-beer:before{content:"\f0fc"}.fa-h-square:before{content:"\f0fd"}.fa-plus-square:before{content:"\f0fe"}.fa-angle-double-left:before{content:"\f100"}.fa-angle-double-right:before{content:"\f101"}.fa-angle-double-up:before{content:"\f102"}.fa-angle-double-down:before{content:"\f103"}.fa-angle-left:before{content:"\f104"}.fa-angle-right:before{content:"\f105"}.fa-angle-up:before{content:"\f106"}.fa-angle-down:before{content:"\f107"}.fa-desktop:before{content:"\f108"}.fa-laptop:before{content:"\f109"}.fa-tablet:before{content:"\f10a"}.fa-mobile-phone:before,.fa-mobile:before{content:"\f10b"}.fa-circle-o:before{content:"\f10c"}.fa-quote-left:before{content:"\f10d"}.fa-quote-right:before{content:"\f10e"}.fa-spinner:before{content:"\f110"}.fa-circle:before{content:"\f111"}.fa-mail-reply:before,.fa-reply:before{content:"\f112"}.fa-github-alt:before{content:"\f113"}.fa-folder-o:before{content:"\f114"}.fa-folder-open-o:before{content:"\f115"}.fa-smile-o:before{content:"\f118"}.fa-frown-o:before{content:"\f119"}.fa-meh-o:before{content:"\f11a"}.fa-gamepad:before{content:"\f11b"}.fa-keyboard-o:before{content:"\f11c"}.fa-flag-o:before{content:"\f11d"}.fa-flag-checkered:before{content:"\f11e"}.fa-terminal:before{content:"\f120"}.fa-code:before{content:"\f121"}.fa-mail-reply-all:before,.fa-reply-all:before{content:"\f122"}.fa-star-half-empty:before,.fa-star-half-full:before,.fa-star-half-o:before{content:"\f123"}.fa-location-arrow:before{content:"\f124"}.fa-crop:before{content:"\f125"}.fa-code-fork:before{content:"\f126"}.fa-unlink:before,.fa-chain-broken:before{content:"\f127"}.fa-question:before{content:"\f128"}.fa-info:before{content:"\f129"}.fa-exclamation:before{content:"\f12a"}.fa-superscript:before{content:"\f12b"}.fa-subscript:before{content:"\f12c"}.fa-eraser:before{content:"\f12d"}.fa-puzzle-piece:before{content:"\f12e"}.fa-microphone:before{content:"\f130"}.fa-microphone-slash:before{content:"\f131"}.fa-shield:before{content:"\f132"}.fa-calendar-o:before{content:"\f133"}.fa-fire-extinguisher:before{content:"\f134"}.fa-rocket:before{content:"\f135"}.fa-maxcdn:before{content:"\f136"}.fa-chevron-circle-left:before{content:"\f137"}.fa-chevron-circle-right:before{content:"\f138"}.fa-chevron-circle-up:before{content:"\f139"}.fa-chevron-circle-down:before{content:"\f13a"}.fa-html5:before{content:"\f13b"}.fa-css3:before{content:"\f13c"}.fa-anchor:before{content:"\f13d"}.fa-unlock-alt:before{content:"\f13e"}.fa-bullseye:before{content:"\f140"}.fa-ellipsis-h:before{content:"\f141"}.fa-ellipsis-v:before{content:"\f142"}.fa-rss-square:before{content:"\f143"}.fa-play-circle:before{content:"\f144"}.fa-ticket:before{content:"\f145"}.fa-minus-square:before{content:"\f146"}.fa-minus-square-o:before{content:"\f147"}.fa-level-up:before{content:"\f148"}.fa-level-down:before{content:"\f149"}.fa-check-square:before{content:"\f14a"}.fa-pencil-square:before{content:"\f14b"}.fa-external-link-square:before{content:"\f14c"}.fa-share-square:before{content:"\f14d"}.fa-compass:before{content:"\f14e"}.fa-toggle-down:before,.fa-caret-square-o-down:before{content:"\f150"}.fa-toggle-up:before,.fa-caret-square-o-up:before{content:"\f151"}.fa-toggle-right:before,.fa-caret-square-o-right:before{content:"\f152"}.fa-euro:before,.fa-eur:before{content:"\f153"}.fa-gbp:before{content:"\f154"}.fa-dollar:before,.fa-usd:before{content:"\f155"}.fa-rupee:before,.fa-inr:before{content:"\f156"}.fa-cny:before,.fa-rmb:before,.fa-yen:before,.fa-jpy:before{content:"\f157"}.fa-ruble:before,.fa-rouble:before,.fa-rub:before{content:"\f158"}.fa-won:before,.fa-krw:before{content:"\f159"}.fa-bitcoin:before,.fa-btc:before{content:"\f15a"}.fa-file:before{content:"\f15b"}.fa-file-text:before{content:"\f15c"}.fa-sort-alpha-asc:before{content:"\f15d"}.fa-sort-alpha-desc:before{content:"\f15e"}.fa-sort-amount-asc:before{content:"\f160"}.fa-sort-amount-desc:before{content:"\f161"}.fa-sort-numeric-asc:before{content:"\f162"}.fa-sort-numeric-desc:before{content:"\f163"}.fa-thumbs-up:before{content:"\f164"}.fa-thumbs-down:before{content:"\f165"}.fa-youtube-square:before{content:"\f166"}.fa-youtube:before{content:"\f167"}.fa-xing:before{content:"\f168"}.fa-xing-square:before{content:"\f169"}.fa-youtube-play:before{content:"\f16a"}.fa-dropbox:before{content:"\f16b"}.fa-stack-overflow:before{content:"\f16c"}.fa-instagram:before{content:"\f16d"}.fa-flickr:before{content:"\f16e"}.fa-adn:before{content:"\f170"}.fa-bitbucket:before{content:"\f171"}.fa-bitbucket-square:before{content:"\f172"}.fa-tumblr:before{content:"\f173"}.fa-tumblr-square:before{content:"\f174"}.fa-long-arrow-down:before{content:"\f175"}.fa-long-arrow-up:before{content:"\f176"}.fa-long-arrow-left:before{content:"\f177"}.fa-long-arrow-right:before{content:"\f178"}.fa-apple:before{content:"\f179"}.fa-windows:before{content:"\f17a"}.fa-android:before{content:"\f17b"}.fa-linux:before{content:"\f17c"}.fa-dribbble:before{content:"\f17d"}.fa-skype:before{content:"\f17e"}.fa-foursquare:before{content:"\f180"}.fa-trello:before{content:"\f181"}.fa-female:before{content:"\f182"}.fa-male:before{content:"\f183"}.fa-gittip:before,.fa-gratipay:before{content:"\f184"}.fa-sun-o:before{content:"\f185"}.fa-moon-o:before{content:"\f186"}.fa-archive:before{content:"\f187"}.fa-bug:before{content:"\f188"}.fa-vk:before{content:"\f189"}.fa-weibo:before{content:"\f18a"}.fa-renren:before{content:"\f18b"}.fa-pagelines:before{content:"\f18c"}.fa-stack-exchange:before{content:"\f18d"}.fa-arrow-circle-o-right:before{content:"\f18e"}.fa-arrow-circle-o-left:before{content:"\f190"}.fa-toggle-left:before,.fa-caret-square-o-left:before{content:"\f191"}.fa-dot-circle-o:before{content:"\f192"}.fa-wheelchair:before{content:"\f193"}.fa-vimeo-square:before{content:"\f194"}.fa-turkish-lira:before,.fa-try:before{content:"\f195"}.fa-plus-square-o:before{content:"\f196"}.fa-space-shuttle:before{content:"\f197"}.fa-slack:before{content:"\f198"}.fa-envelope-square:before{content:"\f199"}.fa-wordpress:before{content:"\f19a"}.fa-openid:before{content:"\f19b"}.fa-institution:before,.fa-bank:before,.fa-university:before{content:"\f19c"}.fa-mortar-board:before,.fa-graduation-cap:before{content:"\f19d"}.fa-yahoo:before{content:"\f19e"}.fa-google:before{content:"\f1a0"}.fa-reddit:before{content:"\f1a1"}.fa-reddit-square:before{content:"\f1a2"}.fa-stumbleupon-circle:before{content:"\f1a3"}.fa-stumbleupon:before{content:"\f1a4"}.fa-delicious:before{content:"\f1a5"}.fa-digg:before{content:"\f1a6"}.fa-pied-piper:before{content:"\f1a7"}.fa-pied-piper-alt:before{content:"\f1a8"}.fa-drupal:before{content:"\f1a9"}.fa-joomla:before{content:"\f1aa"}.fa-language:before{content:"\f1ab"}.fa-fax:before{content:"\f1ac"}.fa-building:before{content:"\f1ad"}.fa-child:before{content:"\f1ae"}.fa-paw:before{content:"\f1b0"}.fa-spoon:before{content:"\f1b1"}.fa-cube:before{content:"\f1b2"}.fa-cubes:before{content:"\f1b3"}.fa-behance:before{content:"\f1b4"}.fa-behance-square:before{content:"\f1b5"}.fa-steam:before{content:"\f1b6"}.fa-steam-square:before{content:"\f1b7"}.fa-recycle:before{content:"\f1b8"}.fa-automobile:before,.fa-car:before{content:"\f1b9"}.fa-cab:before,.fa-taxi:before{content:"\f1ba"}.fa-tree:before{content:"\f1bb"}.fa-spotify:before{content:"\f1bc"}.fa-deviantart:before{content:"\f1bd"}.fa-soundcloud:before{content:"\f1be"}.fa-database:before{content:"\f1c0"}.fa-file-pdf-o:before{content:"\f1c1"}.fa-file-word-o:before{content:"\f1c2"}.fa-file-excel-o:before{content:"\f1c3"}.fa-file-powerpoint-o:before{content:"\f1c4"}.fa-file-photo-o:before,.fa-file-picture-o:before,.fa-file-image-o:before{content:"\f1c5"}.fa-file-zip-o:before,.fa-file-archive-o:before{content:"\f1c6"}.fa-file-sound-o:before,.fa-file-audio-o:before{content:"\f1c7"}.fa-file-movie-o:before,.fa-file-video-o:before{content:"\f1c8"}.fa-file-code-o:before{content:"\f1c9"}.fa-vine:before{content:"\f1ca"}.fa-codepen:before{content:"\f1cb"}.fa-jsfiddle:before{content:"\f1cc"}.fa-life-bouy:before,.fa-life-buoy:before,.fa-life-saver:before,.fa-support:before,.fa-life-ring:before{content:"\f1cd"}.fa-circle-o-notch:before{content:"\f1ce"}.fa-ra:before,.fa-rebel:before{content:"\f1d0"}.fa-ge:before,.fa-empire:before{content:"\f1d1"}.fa-git-square:before{content:"\f1d2"}.fa-git:before{content:"\f1d3"}.fa-hacker-news:before{content:"\f1d4"}.fa-tencent-weibo:before{content:"\f1d5"}.fa-qq:before{content:"\f1d6"}.fa-wechat:before,.fa-weixin:before{content:"\f1d7"}.fa-send:before,.fa-paper-plane:before{content:"\f1d8"}.fa-send-o:before,.fa-paper-plane-o:before{content:"\f1d9"}.fa-history:before{content:"\f1da"}.fa-genderless:before,.fa-circle-thin:before{content:"\f1db"}.fa-header:before{content:"\f1dc"}.fa-paragraph:before{content:"\f1dd"}.fa-sliders:before{content:"\f1de"}.fa-share-alt:before{content:"\f1e0"}.fa-share-alt-square:before{content:"\f1e1"}.fa-bomb:before{content:"\f1e2"}.fa-soccer-ball-o:before,.fa-futbol-o:before{content:"\f1e3"}.fa-tty:before{content:"\f1e4"}.fa-binoculars:before{content:"\f1e5"}.fa-plug:before{content:"\f1e6"}.fa-slideshare:before{content:"\f1e7"}.fa-twitch:before{content:"\f1e8"}.fa-yelp:before{content:"\f1e9"}.fa-newspaper-o:before{content:"\f1ea"}.fa-wifi:before{content:"\f1eb"}.fa-calculator:before{content:"\f1ec"}.fa-paypal:before{content:"\f1ed"}.fa-google-wallet:before{content:"\f1ee"}.fa-cc-visa:before{content:"\f1f0"}.fa-cc-mastercard:before{content:"\f1f1"}.fa-cc-discover:before{content:"\f1f2"}.fa-cc-amex:before{content:"\f1f3"}.fa-cc-paypal:before{content:"\f1f4"}.fa-cc-stripe:before{content:"\f1f5"}.fa-bell-slash:before{content:"\f1f6"}.fa-bell-slash-o:before{content:"\f1f7"}.fa-trash:before{content:"\f1f8"}.fa-copyright:before{content:"\f1f9"}.fa-at:before{content:"\f1fa"}.fa-eyedropper:before{content:"\f1fb"}.fa-paint-brush:before{content:"\f1fc"}.fa-birthday-cake:before{content:"\f1fd"}.fa-area-chart:before{content:"\f1fe"}.fa-pie-chart:before{content:"\f200"}.fa-line-chart:before{content:"\f201"}.fa-lastfm:before{content:"\f202"}.fa-lastfm-square:before{content:"\f203"}.fa-toggle-off:before{content:"\f204"}.fa-toggle-on:before{content:"\f205"}.fa-bicycle:before{content:"\f206"}.fa-bus:before{content:"\f207"}.fa-ioxhost:before{content:"\f208"}.fa-angellist:before{content:"\f209"}.fa-cc:before{content:"\f20a"}.fa-shekel:before,.fa-sheqel:before,.fa-ils:before{content:"\f20b"}.fa-meanpath:before{content:"\f20c"}.fa-buysellads:before{content:"\f20d"}.fa-connectdevelop:before{content:"\f20e"}.fa-dashcube:before{content:"\f210"}.fa-forumbee:before{content:"\f211"}.fa-leanpub:before{content:"\f212"}.fa-sellsy:before{content:"\f213"}.fa-shirtsinbulk:before{content:"\f214"}.fa-simplybuilt:before{content:"\f215"}.fa-skyatlas:before{content:"\f216"}.fa-cart-plus:before{content:"\f217"}.fa-cart-arrow-down:before{content:"\f218"}.fa-diamond:before{content:"\f219"}.fa-ship:before{content:"\f21a"}.fa-user-secret:before{content:"\f21b"}.fa-motorcycle:before{content:"\f21c"}.fa-street-view:before{content:"\f21d"}.fa-heartbeat:before{content:"\f21e"}.fa-venus:before{content:"\f221"}.fa-mars:before{content:"\f222"}.fa-mercury:before{content:"\f223"}.fa-transgender:before{content:"\f224"}.fa-transgender-alt:before{content:"\f225"}.fa-venus-double:before{content:"\f226"}.fa-mars-double:before{content:"\f227"}.fa-venus-mars:before{content:"\f228"}.fa-mars-stroke:before{content:"\f229"}.fa-mars-stroke-v:before{content:"\f22a"}.fa-mars-stroke-h:before{content:"\f22b"}.fa-neuter:before{content:"\f22c"}.fa-facebook-official:before{content:"\f230"}.fa-pinterest-p:before{content:"\f231"}.fa-whatsapp:before{content:"\f232"}.fa-server:before{content:"\f233"}.fa-user-plus:before{content:"\f234"}.fa-user-times:before{content:"\f235"}.fa-hotel:before,.fa-bed:before{content:"\f236"}.fa-viacoin:before{content:"\f237"}.fa-train:before{content:"\f238"}.fa-subway:before{content:"\f239"}.fa-medium:before{content:"\f23a"}
.calendar-event .remainder_date {
    float: right;
	width: 180px;
    box-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    padding: 0 5px;
    color: #FFF;
    border-radius: 2px;
	background-color: #f39c12;
    background-image: url(ing/vertical_line.png);
    background-repeat: no-repeat;
    background-position: center;
}
</style>
</head>
<body style="background-color :#f1f4f9;font-family: 'Open Sans',sans-serif;font-size: 13px;display: none;" id="body">
    <c:forEach items="${sessionScope.userdata }" var="q" end="0">
        <div class="navbar" style="padding-right: 14px;  background-color: white; height: 69px;">
            <div class="col-md-3 col-sm-2 col-xs-4"style=" word-break: break-all;">
                <h3>
                    <img src="Admin_Images/<%=session.getAttribute("hospitallogo")%>" class="img-circle head_logo" width="40" height="40"
                        style="margin-top: -8px;"><span style="font-size:21px "><%=session.getAttribute("hospitalname")%></span>
                </h3>
            </div>
            <ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
                <li class="dropdown" style="margin-left: 80%;">
                    <a style="background-color: white;  color: #5f5f5f !important;   height: 49px;"
                        data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
                        <img src="User_Image/<%=session.getAttribute("userimage")%>" height="40px" width="40px"
                            class="img-circle" style="margin-top: -15px;">
                        <span>${q.firstname }</span> <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <li><a href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"><i
                                    class="fa fa-user"></i>
                                My Profile</a></li>
                        <li><a href="Com_Login.jsp"><i class="fas fa-sign-out-alt"></i>Log Out </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <ul class="nav nav-pills nav-stacked ullist" style="margin-top: -19px; height: 1695px; width: 217px;"
            id="UserListId">
            <li><a href="<%=request.getContextPath()%>/Admin?flag=desbord&id=${q.adminid.id }"><span class="icone">
                        <img src="ing/dashboard.png"></span><span class="title">Dashboard</span></a></li>

            <li class="PatientRegistration_menu  all_manu"><a
                    href="<%=request.getContextPath()%>/PatientRegistration?flag=role_insert&id=${q.adminid.id }">
                    <span class="icone"><i class="fas fa fa-wheelchair" style="color: gray;"></i></span><span
                        class="title">Patient Registration</span></a></li>

            <li class="department_menu all_manu "><a href="<%=request.getContextPath()%>/Department?flag=role_insert&id=${q.adminid.id }">
                    <span class="icone"><i class="fas fa-briefcase" style="color: gray;"></i></span><span
                        class="title">Department</span></a></li>

            <li class="specialization_menu all_manu"><a
                    href="<%=request.getContextPath()%>/Specialization?flag=role_insert&id=${q.adminid.id }">
                    <span class="icone"><i class="fa fa-lightbulb" style="color: gray;"></i></span><span
                        class="title">Specialization</span></a></li>

            <li class="doctor_menu all_manu"><a href="<%=request.getContextPath()%>/Doctor?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Doctor" title="Doctor">
                    <span class="icone"> <img src="ing/doctor-logo.png"></span>
                    <span class="title">Doctor</span></a></li>

            <li class="outpatient_menu all_manu"><a href="<%=request.getContextPath()%>/OutPatient?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Outpatient" title="Outpatient">
                    <span class="icone"> <img src="ing/outpatient-logo.png"></span>
                    <span class="title">Outpatient</span></a></li>

            <li class="inpatient_menu all_manu"><a href="<%=request.getContextPath()%>/Patient?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
                    <span class="icone"> <img src="ing/Patient-logo.png"></span>
                    <span class="title">Inpatient</span></a></li>

            <li class="nurse_menu all_manu"><a href="<%=request.getContextPath()%>/Nurse?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Nurse" title="Nurse">
                    <span class="icone"> <img src="ing/Nurse-logo.png"></span>
                    <span class="title">Nurse</span></a></li>

            <li class="supportstaff_menu all_manu"><a href="<%=request.getContextPath()%>/SupportStaff?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Support Staff" title="Support Staff">
                    <span class="icone"> <img src="ing/support-logo.png"></span>
                    <span class="title">Support Staff</span></a></li>

            <li class="pharmacist_menu all_manu"><a href="<%=request.getContextPath()%>/Pharmacist?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Pharmacist" title="Pharmacist">
                    <span class="icone"> <img src="ing/Pharmacist-logo.png"></span><span
                        class="title">Pharmacist</span></a></li>

            <li class="laboratory_menu all_manu"><a href="<%=request.getContextPath()%>/Laboratory?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Laboratory Staff" title="Laboratory Staff">
                    <span class="icone"> <img src="ing/Laboratorist-logo.png"></span><span class="title">Laboratory
                        Staff</span></a></li>

            <li class="accountant_menu all_manu"><a
                    href="<%=request.getContextPath()%>/AccountantStaff?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Accountant" title="Accountant">
                    <span class="icone"> <img src="ing/Accountant-logo.png"></span><span
                        class="title">Accountant</span></a></li>
                       
            <li class="medicine_menu all_manu"><a href="<%=request.getContextPath()%>/Medicine?flag=role_insert&id=${q.adminid.id }"
                    data-tooltip="Medicine" title="Medicine">
                    <span class="icone"> <img src="ing/Medicine-logo.png"></span><span class="title">Medicine</span></a>
            </li>
           
            <li class="treatment_menu all_manu"><a
                    href="<%=request.getContextPath()%>/TreatmentUpdate?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Treatment" title="Treatment">
                    <span class="icone"> <img src="ing/Treatment-logo.png"></span><span
                        class="title">Treatment</span></a></li>
                       
            <li class="prescription_menu all_manu"><a href="<%=request.getContextPath()%>/Prescription?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Prescription" title="Prescription">
                    <span class="icone"> <img src="ing/Prescription-logo.png"></span><span
                        class="title">Prescription</span></a></li>

            <li class="addbed_menu all_manu"><a href="<%=request.getContextPath()%>/BadMenegement?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
                    <span class="icone"><i class="fa fa-bed" aria-hidden="true" style="color: gray;"></i></span>
                    <span class="title">Add Bad</span></a></li>

            <li class="assginaddbed_menu all_manu"><a href="<%=request.getContextPath()%>/BadMenegement?flag=role_bedassign&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
                    <span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign
                        Bed-Nurse</span></a></li>

            <li class="operationlist_menu all_manu"><a
                    href="<%=request.getContextPath()%>/OperationManagement?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Operation List" title="Operation List">
                    <span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation
                        List</span></a></li>

            <li class="diagnosis_menu all_manu"><a
                    href="<%=request.getContextPath()%>/DiagnosisReport?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Diagnosis" title="Diagnosis">
                    <span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span
                        class="title">Diagnosis</span></a></li>

            <li class="bloodbank_menu all_manu"><a href="<%=request.getContextPath()%>/BloodManage?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
                    <span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood
                        Bank</span></a></li>
 
            <li class="appointment_menu all_manu"><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
                    <span class="icone"> <img src="ing/Appointment-logo.png"></span><span
                        class="title">Appointment</span></a></li>

            <li class="invoice_menu all_manu"><a
                    href="<%=request.getContextPath()%>/InvoiceManagement?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Invoice" title="Invoice">
                    <span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a>
            </li>

            <li class="event_menu all_manu"><a href="<%=request.getContextPath()%>/Event?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Event" title="Event">
                    <span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li>

            <li class="message_menu all_manu"><a href="<%=request.getContextPath()%>/Message?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Message" title="Message">
                    <span class="icone"> <img src="ing/message-logo.png"></span><span class="title">Message</span></a>
            </li>

            <li class="ambulance_menu all_manu"><a href="<%=request.getContextPath()%>/Ambulance?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
                    <span class="icone"> <img src="ing/Ambulance-logo.png"></span><span
                        class="title">Ambulance</span></a></li>
                       
            <li class="instrument_menu all_manu"><a
                    href="<%=request.getContextPath()%>/InstrumentManagement?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="instrument" title="instrument">
                    <span class="icone"> <img src="ing/Instrument-logo.png"></span><span
                        class="title">Instrument</span></a></li>
                       
            <li class="report_menu all_manu"><a href="" class="left-tooltip" data-tooltip="Report" title="Report">
                    <span class="icone"> <img src="ing/Report-logo.png"></span><span class="title">Report</span></a>
            </li>
            <li class="Account_menu all_manu"><a href="" class="left-tooltip" data-tooltip="Account" title="Account"><span
                        class="icone"> <img src="ing/account-logo.png"></span><span class="title">Account</span></a>
            </li>
        </ul>
    </c:forEach>

    <div style="margin-left:15%;padding:1px 16px; margin-top: -110%;">
        <div class="row right_side " style="padding-right: 14px;">
            <!-- start dashboard content div-->
            <!---start new dashboard------>
            <c:forEach items="${sessionScope.dashboarddata }" var="a" end="0">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 patientRegistration_menu all_manu">
                        <a href="<%=request.getContextPath()%>/PatientRegistration?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body patient">
                                    <div class="info-box-stats">
                                        <p class="patientcounter">${a.patient }</p>

                                        <span class="info-box-title">Patient</span>
                                    </div>
                                    <img src="ing/patient.png" class="dashboard_background">

                                </div>
                            </div>
                        </a></div><a href="">

                    </a>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 doctor_menu all_manu" ><a href="">
                        </a><a href="<%=request.getContextPath()%>/Doctor?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body doctor">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.doctor }</p>
                                        <span class="info-box-title">Doctor</span>
                                    </div>
                                    <img src="ing/doctor.png" class="dashboard_background">

                                </div>
                            </div>
                        </a></div><a href="">

                    </a>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 nurse_menu all_manu"><a href="">
                        </a><a href="<%=request.getContextPath()%>/Nurse?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body nurse">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.nurse }</p>
                                        <span class="info-box-title">Nurse</span>
                                    </div>
                                    <img src="ing/nurse.png" class="dashboard_background">

                                </div>
                            </div>
                        </a></div><a href="">

                    </a>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 supportstaff_menu all_manu"><a href="">
                        </a><a href="<%=request.getContextPath()%>/SupportStaff?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body receptionist">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.supportingstaff }</p>

                                        <span class="info-box-title">Support Staff</span>
                                    </div>
                                    <img src="ing/support-staft.png" class="dashboard_background">
                                </div>
                            </div>
                        </a></div><a href="">


                    </a>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 message_menu all_manu"><a href="">
                        </a><a href="<%=request.getContextPath()%>/Message?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body message">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.message }</p>

                                        <span class="info-box-title">Message</span>
                                    </div>
                                    <img src="ing/message.png" class="dashboard_background">

                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 ">
                        <a href="">
                            <div class="panel info-box panel-white">
                                <div class="panel-body setting">
                                    <div class="info-box-stats">
                                        <p class="counter"> &nbsp;</p>
                                        <span class="info-box-title">Setting</span>
                                    </div>
                                    <img src="ing/setting-image.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 appointment_menu all_manu">
                        <a href="">
                            <div class="panel info-box panel-white">
                                <div class="panel-body appointment">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.appointment }</p>
                                        <span class="info-box-title">Appointment</span>
                                    </div>
                                    <img src="ing/appointment-image.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 prescription_menu all_manu">
                        <a href="<%=request.getContextPath()%>/Prescription?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body prescription">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.prescription }</p>

                                        <span class="info-box-title">Prescription</span>
                                    </div>
                                    <img src="ing/preseription-image.png" class="dashboard_background">

                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 assginaddbed_menu all_manu">
                        <a href="<%=request.getContextPath()%>/BadMenegement?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body assignbed">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.assginbed }</p>

                                        <span class="info-box-title">Assign <br> Bed/Nurse</span>
                                    </div>
                                    <img src="ing/assign-bed-image.png" class="dashboard_background">

                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 treatment_menu all_manu">
                        <a href="<%=request.getContextPath()%>/TreatmentUpdate?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body treatment">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.treatment }</p>

                                        <span class="info-box-title">Treatment</span>
                                    </div>
                                    <img src="ing/tretment-image.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 event_menu all_manu">
                        <a href="<%=request.getContextPath()%>/Event?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body eventnotice">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.event }</p>

                                        <span class="info-box-title">Events/ <br> Notice</span>
                                    </div>
                                    <img src="ing/notice-event-image.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
                        <a href="">
                            <div class="panel info-box panel-white">
                                <div class="panel-body operation_report">
                                    <div class="info-box-stats">
                                        <p class="counter">&nbsp;</p>

                                        <span class="info-box-title">Report</span>
                                    </div>
                                    <img src="ing/report.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 pharmacist_menu all_manu">
                        <a href="<%=request.getContextPath()%>/Pharmacist?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body pharmacist">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.pharmacist }</p>

                                        <span class="info-box-title">Pharmacist</span>
                                    </div>
                                    <img src="ing/pharmacist.png" class="dashboard_background">
                                </div>
                            </div>
                        </a></div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 medicine_menu all_manu">
                        </a><a href="<%=request.getContextPath()%>/Medicine?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body medicine">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.medicine }</p>
                                        <span class="info-box-title">Medicine</span>
                                    </div>
                                    <img src="ing/medicine.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>
                    <a href="">
                    </a>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 laboratory_menu all_manu"><a href="">
                        </a><a href="<%=request.getContextPath()%>/Laboratory?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body laboratorist">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.laboratorystaff }</p>

                                        <span class="info-box-title">Laboratory <br> Staff</span>
                                    </div>
                                    <img src="ing/laboratorist.png" class="dashboard_background">
                                </div>
                            </div>
                        </a></div><a href="">
                    </a>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 diagnosis_menu all_manu"><a href="">
                        </a><a href="">
                            <div class="panel info-box panel-white">
                                <div class="panel-body diagnosis">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.diagnosisreport }</p>

                                        <span class="info-box-title">Diagnosis <br> Report</span>
                                    </div>
                                    <img src="ing/diagnosis-image.png" class="dashboard_background">

                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 account_menu all_manu">
                        <a href="<%=request.getContextPath()%>/AccountantStaff?flag=insert&id=${a.adminid.id }">
                            <div class="panel info-box panel-white">
                                <div class="panel-body accountant">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.account }</p>
                                        <span class="info-box-title">Accountant</span>
                                    </div>
                                    <img src="ing/accountant.png" class="dashboard_background">

                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3 invoice_menu all_manu ">
                        <a href="">
                            <div class="panel info-box panel-white">
                                <div class="panel-body invoice">
                                    <div class="info-box-stats">
                                        <p class="counter">${a.invoice }</p>
                                        <span class="info-box-title">Invoice</span>
                                    </div>
                                    <img src="ing/invoice.png" class="dashboard_background">
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row dashboard_panel_heading_border">
                    <div class="col-md-6 no-paddingR">
                        <!--  Start Prescription Box -->
                        <div class="panel panel-white event priscription">
                            <div class="panel-heading ">
                                <img src="ing/Prescription-logo.png">
                                <h3 class="panel-title">Prescription</h3>
                            </div>
                            <div class="panel-body">
                                <div class="events">

                                    <div class="calendar-event">
                                        <p class="remainder_title_pr Bold viewpriscription show_task_event" id="359"
                                            model="Prescription Details"> Patient Name :
                                            Himanshu Patel </p>
                                        <p class="remainder_date_pr"> 2020-09-14 </p>
                                        <p class="remainder_title_pr viewpriscription"> Description : Lorem ipsum dolor
                                            sit amet, consectetur adipiscing elit. Aenean vitae laoreet eros. Fusce
                                            rhoncus urna ut egestas facilisis. Proin nulla augue, temp</p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title_pr Bold viewpriscription show_task_event" id="358"
                                            model="Prescription Details"> Patient Name :
                                            A Kuddus </p>
                                        <p class="remainder_date_pr"> 2020-09-14 </p>
                                        <p class="remainder_title_pr viewpriscription"> Description : Paciente llega a
                                            centro con dolor en el culo, se visualiza lo que a priori parece un hamster
                                            en la cavidad anal</p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title_pr Bold viewpriscription show_task_event" id="357"
                                            model="Prescription Details"> Patient Name :
                                            A Kuddus </p>
                                        <p class="remainder_date_pr"> 2020-09-14 </p>
                                        <p class="remainder_title_pr viewpriscription"> Description : dolor de nariz</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- End Prescription Box -->

                        <!--  Start Operation Box -->
                        <div class="panel panel-white event operation">
                            <div class="panel-heading ">
                                <img src="ing/Operation-List-logo.png">
                                <h3 class="panel-title">Operation</h3>
                            </div>
                            <div class="panel-body">
                                <div class="events">
                                    <div class="calendar-event">
                                        <p class="remainder_title_pr Bold viewoperation show_task_event" id="17"
                                            model="Operation Details"> Patient Name : koly kamrunnaher</p>
                                        <p class="remainder_date_pr"> 2020-04-12 </p>

                                        <p class="remainder_title_pr  viewoperation"> Operation Name: brain operationnn
                                        </p>
                                    </div>
                                    <div class="calendar-event">
                                        <p class="remainder_title_pr Bold viewoperation show_task_event" id="16"
                                            model="Operation Details"> Patient Name : uu ui</p>
                                        <p class="remainder_date_pr"> 2020-02-20 </p>

                                        <p class="remainder_title_pr  viewoperation"> Operation Name: brain operationnn
                                        </p>
                                    </div>
                                    <div class="calendar-event">
                                        <p class="remainder_title_pr Bold viewoperation show_task_event" id="15"
                                            model="Operation Details"> Patient Name : Abhijit Borgohain</p>
                                        <p class="remainder_date_pr"> 2020-02-27 </p>

                                        <p class="remainder_title_pr  viewoperation"> Operation Name: Brain Surgery1</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- End Operation Box -->

                        <!-- start calendar Box -->
                        <div class="panel panel-white">
                            <div class="panel-heading" style="margin-bottom: 15px;">
                                <img src="ing/notice-logo.png">
                                <h3 class="panel-title">Calendar</h3>
                            </div>
                            <div class="panel-body">
                                <div id="calendar" class="fc fc-ltr fc-unthemed">
                                    <div class="fc-toolbar">
                                        <div class="fc-left">
                                            <div class="fc-button-group"><button type="button"
                                                    class="fc-prev-button fc-button fc-state-default fc-corner-left"><span
                                                        class="fc-icon fc-icon-left-single-arrow"></span></button><button
                                                    type="button"
                                                    class="fc-next-button fc-button fc-state-default fc-corner-right"><span
                                                        class="fc-icon fc-icon-right-single-arrow"></span></button>
                                            </div><button type="button"
                                                class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
                                                disabled="disabled">today</button>
                                        </div>
                                        <div class="fc-right">
                                            <div class="fc-button-group"><button type="button"
                                                    class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button><button
                                                    type="button"
                                                    class="fc-agendaWeek-button fc-button fc-state-default">week</button><button
                                                    type="button"
                                                    class="fc-agendaDay-button fc-button fc-state-default fc-corner-right">day</button>
                                            </div>
                                        </div>
                                        <div class="fc-center">
                                            <h2>September 2020</h2>
                                        </div>
                                        <div class="fc-clear"></div>
                                    </div>
                                    <div class="fc-view-container" style="">
                                        <div class="fc-view fc-month-view fc-basic-view" style="">
                                            <table>
                                                <thead class="fc-head">
                                                    <tr>
                                                        <td class="fc-widget-header">
                                                            <div class="fc-row fc-widget-header">
                                                                <table>
                                                                    <thead>
                                                                        <tr>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-sun">
                                                                                Sun</th>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-mon">
                                                                                Mon</th>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-tue">
                                                                                Tue</th>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-wed">
                                                                                Wed</th>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-thu">
                                                                                Thu</th>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-fri">
                                                                                Fri</th>
                                                                            <th
                                                                                class="fc-day-header fc-widget-header fc-sat">
                                                                                Sat</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody class="fc-body">
                                                    <tr>
                                                        <td class="fc-widget-content">
                                                            <div class="fc-day-grid-container" style="">
                                                                <div class="fc-day-grid">
                                                                    <div class="fc-row fc-week fc-widget-content"
                                                                        style="height: 68px;">
                                                                        <div class="fc-bg">
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
                                                                                            data-date="2020-08-30"></td>
                                                                                        <td class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
                                                                                            data-date="2020-08-31"></td>
                                                                                        <td class="fc-day fc-widget-content fc-tue fc-past"
                                                                                            data-date="2020-09-01"></td>
                                                                                        <td class="fc-day fc-widget-content fc-wed fc-past"
                                                                                            data-date="2020-09-02"></td>
                                                                                        <td class="fc-day fc-widget-content fc-thu fc-past"
                                                                                            data-date="2020-09-03"></td>
                                                                                        <td class="fc-day fc-widget-content fc-fri fc-past"
                                                                                            data-date="2020-09-04"></td>
                                                                                        <td class="fc-day fc-widget-content fc-sat fc-past"
                                                                                            data-date="2020-09-05"></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="fc-content-skeleton">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td class="fc-day-number fc-sun fc-other-month fc-past"
                                                                                            data-date="2020-08-30">30
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-mon fc-other-month fc-past"
                                                                                            data-date="2020-08-31">31
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-tue fc-past"
                                                                                            data-date="2020-09-01">1
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-wed fc-past"
                                                                                            data-date="2020-09-02">2
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-thu fc-past"
                                                                                            data-date="2020-09-03">3
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-fri fc-past"
                                                                                            data-date="2020-09-04">4
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-sat fc-past"
                                                                                            data-date="2020-09-05">5
                                                                                        </td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="fc-row fc-week fc-widget-content"
                                                                        style="height: 68px;">
                                                                        <div class="fc-bg">
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="fc-day fc-widget-content fc-sun fc-past"
                                                                                            data-date="2020-09-06"></td>
                                                                                        <td class="fc-day fc-widget-content fc-mon fc-past"
                                                                                            data-date="2020-09-07"></td>
                                                                                        <td class="fc-day fc-widget-content fc-tue fc-past"
                                                                                            data-date="2020-09-08"></td>
                                                                                        <td class="fc-day fc-widget-content fc-wed fc-past"
                                                                                            data-date="2020-09-09"></td>
                                                                                        <td class="fc-day fc-widget-content fc-thu fc-past"
                                                                                            data-date="2020-09-10"></td>
                                                                                        <td class="fc-day fc-widget-content fc-fri fc-past"
                                                                                            data-date="2020-09-11"></td>
                                                                                        <td class="fc-day fc-widget-content fc-sat fc-past"
                                                                                            data-date="2020-09-12"></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="fc-content-skeleton">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td class="fc-day-number fc-sun fc-past"
                                                                                            data-date="2020-09-06">6
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-mon fc-past"
                                                                                            data-date="2020-09-07">7
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-tue fc-past"
                                                                                            data-date="2020-09-08">8
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-wed fc-past"
                                                                                            data-date="2020-09-09">9
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-thu fc-past"
                                                                                            data-date="2020-09-10">10
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-fri fc-past"
                                                                                            data-date="2020-09-11">11
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-sat fc-past"
                                                                                            data-date="2020-09-12">12
                                                                                        </td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td class="fc-event-container">
                                                                                            <a
                                                                                                class="fc-day-grid-event fc-h-event fc-event fc-start fc-end">
                                                                                                <div class="fc-content">
                                                                                                    <span
                                                                                                        class="fc-time">10:15AM</span>
                                                                                                    <span
                                                                                                        class="fc-title">Detail
                                                                                                        :Fernando
                                                                                                        Therrien
                                                                                                        :Himanshu
                                                                                                        Patel(P970919),
                                                                                                    </span></div>
                                                                                            </a></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="fc-row fc-week fc-widget-content"
                                                                        style="height: 68px;">
                                                                        <div class="fc-bg">
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="fc-day fc-widget-content fc-sun fc-past"
                                                                                            data-date="2020-09-13"></td>
                                                                                        <td class="fc-day fc-widget-content fc-mon fc-past"
                                                                                            data-date="2020-09-14"></td>
                                                                                        <td class="fc-day fc-widget-content fc-tue fc-past"
                                                                                            data-date="2020-09-15"></td>
                                                                                        <td class="fc-day fc-widget-content fc-wed fc-past"
                                                                                            data-date="2020-09-16"></td>
                                                                                        <td class="fc-day fc-widget-content fc-thu fc-today fc-state-highlight"
                                                                                            data-date="2020-09-17"></td>
                                                                                        <td class="fc-day fc-widget-content fc-fri fc-future"
                                                                                            data-date="2020-09-18"></td>
                                                                                        <td class="fc-day fc-widget-content fc-sat fc-future"
                                                                                            data-date="2020-09-19"></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="fc-content-skeleton">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td class="fc-day-number fc-sun fc-past"
                                                                                            data-date="2020-09-13">13
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-mon fc-past"
                                                                                            data-date="2020-09-14">14
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-tue fc-past"
                                                                                            data-date="2020-09-15">15
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-wed fc-past"
                                                                                            data-date="2020-09-16">16
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-thu fc-today fc-state-highlight"
                                                                                            data-date="2020-09-17">17
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-fri fc-future"
                                                                                            data-date="2020-09-18">18
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-sat fc-future"
                                                                                            data-date="2020-09-19">19
                                                                                        </td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="fc-row fc-week fc-widget-content"
                                                                        style="height: 68px;">
                                                                        <div class="fc-bg">
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="fc-day fc-widget-content fc-sun fc-future"
                                                                                            data-date="2020-09-20"></td>
                                                                                        <td class="fc-day fc-widget-content fc-mon fc-future"
                                                                                            data-date="2020-09-21"></td>
                                                                                        <td class="fc-day fc-widget-content fc-tue fc-future"
                                                                                            data-date="2020-09-22"></td>
                                                                                        <td class="fc-day fc-widget-content fc-wed fc-future"
                                                                                            data-date="2020-09-23"></td>
                                                                                        <td class="fc-day fc-widget-content fc-thu fc-future"
                                                                                            data-date="2020-09-24"></td>
                                                                                        <td class="fc-day fc-widget-content fc-fri fc-future"
                                                                                            data-date="2020-09-25"></td>
                                                                                        <td class="fc-day fc-widget-content fc-sat fc-future"
                                                                                            data-date="2020-09-26"></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="fc-content-skeleton">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td class="fc-day-number fc-sun fc-future"
                                                                                            data-date="2020-09-20">20
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-mon fc-future"
                                                                                            data-date="2020-09-21">21
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-tue fc-future"
                                                                                            data-date="2020-09-22">22
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-wed fc-future"
                                                                                            data-date="2020-09-23">23
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-thu fc-future"
                                                                                            data-date="2020-09-24">24
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-fri fc-future"
                                                                                            data-date="2020-09-25">25
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-sat fc-future"
                                                                                            data-date="2020-09-26">26
                                                                                        </td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="fc-row fc-week fc-widget-content"
                                                                        style="height: 68px;">
                                                                        <div class="fc-bg">
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="fc-day fc-widget-content fc-sun fc-future"
                                                                                            data-date="2020-09-27"></td>
                                                                                        <td class="fc-day fc-widget-content fc-mon fc-future"
                                                                                            data-date="2020-09-28"></td>
                                                                                        <td class="fc-day fc-widget-content fc-tue fc-future"
                                                                                            data-date="2020-09-29"></td>
                                                                                        <td class="fc-day fc-widget-content fc-wed fc-future"
                                                                                            data-date="2020-09-30"></td>
                                                                                        <td class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
                                                                                            data-date="2020-10-01"></td>
                                                                                        <td class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
                                                                                            data-date="2020-10-02"></td>
                                                                                        <td class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
                                                                                            data-date="2020-10-03"></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="fc-content-skeleton">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td class="fc-day-number fc-sun fc-future"
                                                                                            data-date="2020-09-27">27
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-mon fc-future"
                                                                                            data-date="2020-09-28">28
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-tue fc-future"
                                                                                            data-date="2020-09-29">29
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-wed fc-future"
                                                                                            data-date="2020-09-30">30
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-thu fc-other-month fc-future"
                                                                                            data-date="2020-10-01">1
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-fri fc-other-month fc-future"
                                                                                            data-date="2020-10-02">2
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-sat fc-other-month fc-future"
                                                                                            data-date="2020-10-03">3
                                                                                        </td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="fc-row fc-week fc-widget-content"
                                                                        style="height: 73px;">
                                                                        <div class="fc-bg">
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
                                                                                            data-date="2020-10-04"></td>
                                                                                        <td class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
                                                                                            data-date="2020-10-05"></td>
                                                                                        <td class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
                                                                                            data-date="2020-10-06"></td>
                                                                                        <td class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
                                                                                            data-date="2020-10-07"></td>
                                                                                        <td class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
                                                                                            data-date="2020-10-08"></td>
                                                                                        <td class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
                                                                                            data-date="2020-10-09"></td>
                                                                                        <td class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
                                                                                            data-date="2020-10-10"></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div class="fc-content-skeleton">
                                                                            <table>
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td class="fc-day-number fc-sun fc-other-month fc-future"
                                                                                            data-date="2020-10-04">4
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-mon fc-other-month fc-future"
                                                                                            data-date="2020-10-05">5
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-tue fc-other-month fc-future"
                                                                                            data-date="2020-10-06">6
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-wed fc-other-month fc-future"
                                                                                            data-date="2020-10-07">7
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-thu fc-other-month fc-future"
                                                                                            data-date="2020-10-08">8
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-fri fc-other-month fc-future"
                                                                                            data-date="2020-10-09">9
                                                                                        </td>
                                                                                        <td class="fc-day-number fc-sat fc-other-month fc-future"
                                                                                            data-date="2020-10-10">10
                                                                                        </td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end calendar Box -->
                    </div>
                    <div class="col-md-6">
                        <!-- Start Appointment Box -->
                        <div class="panel panel-white Appoinment">
                            <div class="panel-heading">
                                <img src="ing/Appointment-logo.png">
                                <h3 class="panel-title">Appointment</h3>

                            </div>
                            <div class="panel-body">
                                <div class="events">

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold save1 show_task_event" id="176"
                                            model="Appointment Details">
                                            Patient Name : Himanshu Patel </p>
                                        <p class="remainder_date" style="width: 160px;background-position: 85px;">
                                            2020-09-09 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:15AM </p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold save1 show_task_event" id="173"
                                            model="Appointment Details">
                                            Patient Name : koly kamrunnaher </p>
                                        <p class="remainder_date" style="width: 160px;background-position: 85px;">
                                            2020-07-25 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:45AM </p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold save1 show_task_event" id="172"
                                            model="Appointment Details">
                                            Patient Name : Miha Demo </p>
                                        <p class="remainder_date" style="width: 160px;background-position: 85px;">
                                            2020-07-25 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:30AM </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--  End Appoinment box -->

                        <!--  Start assigned bed Box -->
                        <div class="panel panel-white event assignbed">
                            <div class="panel-heading">
                                <img src="ing/Assign-Bed-logo.png">
                                <h3 class="panel-title">Assigned Bed</h3>
                            </div>
                            <div class="panel-body">
                                <div class="events">

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewbedlist show_task_event" id="21"
                                            model="Assigned Bed Details"> Patient Name :
                                            gar gar </p>
                                        <p class="remainder_date"> 2020-02-17 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            2020-02-20 </p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewbedlist show_task_event" id="16"
                                            model="Assigned Bed Details"> Patient Name :
                                            uu ui </p>
                                        <p class="remainder_date"> 2019-11-18 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            2019-11-19 </p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewbedlist show_task_event" id="15"
                                            model="Assigned Bed Details"> Patient Name :
                                            king hytrd </p>
                                        <p class="remainder_date"> 2019-11-17 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            2019-11-28 </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- End assigned bed Box -->
                        <!--  Start Event Box -->
                        <div class="panel panel-white event">
                            <div class="panel-heading ">
                                <img src="ing/Appointment-logo.png">
                                <h3 class="panel-title">Events</h3>
                            </div>
                            <div class="panel-body">
                                <div class="events">
                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewdetail show_task_event" id="309"
                                            model="Event Details">
                                            zxvdvhvy </p>
                                        <p class="remainder_date">
                                            2020-01-15 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-01-22 </p>
                                        <p class="remainder_title viewdetail">
                                            sdjvhfhvbjhcbvvefuybaovhsbgsvdhv zdyvbsjdvygdzvbsdzn vbVBIDvbSD cabhvbayuuvh
                                            aguvahvjhvfgavaiceqvfugvashbcgoegvfab </p>
                                    </div>
                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewdetail show_task_event" id="308"
                                            model="Event Details">
                                            Hello all this event for </p>
                                        <p class="remainder_date">
                                            2020-01-20 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-01-22 </p>
                                        <p class="remainder_title viewdetail">
                                            hekbvuuvyzvcoryriizkujrzdhyepgyhobhayuhldybhkobzcgasobdvhknzxgeubhbzvyelxeivaigiafylvdcvudvsyhjzbvhdcvdtfjozhevpdffobryvtktoTboPUrevbbhbyauefh
                                        </p>
                                    </div>
                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewdetail show_task_event" id="307"
                                            model="Event Details">
                                            XYZ </p>
                                        <p class="remainder_date">
                                            2020-01-16 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-01-18 </p>
                                        <p class="remainder_title viewdetail">
                                            basbfhvudfgvashvdfhsdvcasucvasvvhuahschxibciahuhbchgvashdbahbihvhgvgvjZIxvashbiua
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Event Box -->
                        <!--  Start Notice box -->
                        <div class="panel panel-white nt">
                            <div class="panel-heading">
                                <img src="ing/notice1.png">
                                <h3 class="panel-title">Notice</h3>
                            </div>
                            <div class="panel-body">
                                <div class="events">

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewdetail show_task_event" id="478"
                                            model="Notice Details">
                                            notice test
                                        </p>
                                        <p class="remainder_date"> 2020-07-07 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            2020-07-30</p>
                                        <p class="remainder_title viewdetail">hhhhhhhhhhkkkkkkkkkkkkkkk</p>
                                    </div>

                                    <div class="calendar-event">
                                        <p class="remainder_title Bold viewdetail show_task_event" id="456"
                                            model="Notice Details">
                                            corona
                                        </p>
                                        <p class="remainder_date"> 2020-07-03 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            2020-07-15</p>
                                        <p class="remainder_title viewdetail">hhhhhhhhhhhhhhhh</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  End Notice box -->
                    </div>
                </div>
            </c:forEach>
            <!---End new dashboard------>
        </div>
    </div>
</body>
</html>
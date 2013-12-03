// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require_tree .

$(document).ready(function(){
	$("[data-behaviour~='datepicker1']").datepicker({
	    "format": "dd.mm.yyyy",
	    "language":"de",
	    "weekStart": 1,
	    "startView":2,
	    "autoclose": true
	});
	$("[data-behaviour~='datepicker2']").datepicker({
	    "format": "dd.mm.yyyy",
	    "language":"de",
	    "weekStart": 1,
	    "autoclose": true
	});
});

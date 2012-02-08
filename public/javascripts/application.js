// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {

 var profiles = {window800:{height:400,width:500,center:1,scrollbars:0,menubar:0,toolbars:0,location:0,status:0,resizable:0,onUnload:unloadcallback}};
 $( function() {
	 $(".auth_popup").popupwindow(profiles); 
 });
 // callback for above function
 function unloadcallback(){
	location.reload();
	document.getElementById('coolframe').contentWindow.history.back(-1);
 };

 $('.short-text').click(function() {
	$('.expand-bottom').slideDown(0.1);
	return false;
 });
 
 // $(".alert-message").alert()

});
audiojs.events.ready(function() {
    var as = audiojs.createAll();
});
$(document).ready(function() {  
	// change location of comment box
				var $tog = "1"	
  $(".comment-location :checkbox").change(function() {
			
			if (!$tog){
				console.log($tog)
				var $tog = "1"
				alert("hey")
				console.log($tog)
			}
			else
			{
				
			}
			
				// var wtf = $("#blog-frame").contents().find("#iavouch_mast");
	  			// var iavow = $("#blog-frame").contents().find("#iavouch");
	  			// $(wtf).remove();
				// $(wtf).clone().prependTo(iavow); //appendTo prependTo	
				// var tog = "1";		

				

			
  });  
	// toggle between banner and blog style
  $(".comment-style :checkbox").change(function() {
			$('.blog-style-embed').toggle();  
			$('.banner-style-embed').toggle(); 
			$('.comment-location').toggle();
			$('.var-embed-type').toggle();
			
  });
	// change width of banner and blog elements
	$("#pixel-width").focusout(function(){
		var widget_width = $(this).val();
		$('#var-review-width').text(widget_width);     
		
		// change blog size
		$("#blog-frame").contents().find(".container").width(widget_width);  	
		$("#blog-frame").contents().find('.audiojs').width(widget_width - 78);  
		$("#blog-frame").contents().find('.audiojs .loaded').width(widget_width - 232); 
		$("#blog-frame").contents().find('.audiojs .scrubber').width(widget_width - 232);
		$("#blog-frame").contents().find('.iavouch_3').width(widget_width);  
		$("#blog-frame").contents().find('.comments').width(widget_width);
		$("#blog-frame").contents().find('.comments .comments-header').width(widget_width);
		$("#blog-frame").contents().find('.comments .review-each').width(widget_width - 78);
		$("#blog-frame").contents().find('#coolframe').width(widget_width);
		
		// change banner size
		$("#banner-frame").contents().find('.audiojs').width(widget_width - 82);  
	  	$("#banner-frame").contents().find('.audiojs .loaded').width(widget_width - 232);  
	  	$("#banner-frame").contents().find('.audiojs .scrubber').width(widget_width - 232);
	  	$("#banner-frame").contents().find('#iavouch-container').width(widget_width); 
	  	$("#banner-frame").contents().find('.iavouch-scroll-container').width(widget_width); 
	  	$("#banner-frame").contents().find('.iavouch-scroll-container div.iavouch-comment-container').width(widget_width + 18); 
	  	$("#banner-frame").contents().find('.short-text').width(widget_width - 167); 
	  	$("#banner-frame").contents().find('#navtoreview').css('padding-left', widget_width - 105);
	  	$("#banner-frame").contents().find('.iavouch-review-details').width(widget_width - 82); 
	  	$("#banner-frame").contents().find('.optional-text').width(widget_width - 62);                                          
		$("#banner-frame").contents().find('#coolframe').width(widget_width);
	});                                                                             

  $(function() {

      $(window).scroll(function() {
          var nav = $("#sidebar-menu");

          // Remember the original starting top of #sub-nav
          var original_top = nav.data("original_top");
          if (!original_top) {
              original_top = nav.offset().top;
              nav.data("original_top", original_top);
          }

          // Remember the original starting margin top of #sub-nav
          var original_margin_top = nav.data("original_margin_top");
          if (!original_margin_top) {
              original_margin_top = nav.css("margin-top");
              nav.data("original_margin_top", original_margin_top);
          }

          var buffer = 15;

          if ($(window).scrollTop() > (original_top - buffer)) {
              // Here, we've scrolled past the original top of the nav
              nav.css({
                  "position": "fixed",
                  "margin-top": buffer + -88 + "px"     // need 7 px for body border-top
              });
              // $("#main-content").css("padding-left", 240);
          } else {
              nav.css({
                  "position": "relative",
                  "margin-top": original_margin_top
              });
              // $("#main-content").css("padding-left", 0);    
          }
      });


      $(window).scroll();
  });
	
});	
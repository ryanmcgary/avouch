
$(document).ready(function() {
      var timeOut;
      $('#iavouch-container').hover(
            function() { //when mouse hovers in
                  clearTimeout(timeOut);
                  $('.iavouch-scroll-navigation').show(0.1);
                  //maybe some code here to hide other tooltips if not needed
            },
            function() { //when mouse hovers out
                  timeOut = setTimeout(hideToolTip, 1);
            }
      );

      function hideToolTip() {
            $('.iavouch-scroll-navigation').hide(10);
      }
});

audiojs.events.ready(function() {
  var as = audiojs.createAll();  
  var mydiv = document.getElementById("iavouch-container"); 
  var curr_width = parseInt(mydiv.style.width); // removes the "px" at the end
  $('.audiojs').width(curr_width - 82);  
  $('.audiojs .loaded').width(curr_width - 232);  
  $('.audiojs .scrubber').width(curr_width - 232);
  $('.iavouch-scroll-container').width(curr_width); 
  $('.iavouch-scroll-container div.iavouch-comment-container').width(curr_width + 18); 
  $('.short-text').width(curr_width - 167); 
  $('.iavouch-review-details').width(curr_width - 82); 
  $('.optional-text').width(curr_width - 62);

/* this is for scroll container */

  var $panels = $('#iavouch-container .iavouch-scroll-scroller .iavouch-comment-container');

	var $container = $('#iavouch-container .iavouch-scroll-scroller');

	// if false, we'll float all the panels left and fix the width 
	// of the container
	var horizontal = true;

	// float the panels left if we're going horizontal

	// collect the scroll object, at the same time apply the hidden overflow
	// to remove the default scrollbars that will appear
	var $scroll = $('#iavouch-container .iavouch-scroll-container').css('overflow', 'hidden');

	// apply our left + right buttons


	// handle nav selection
	function selectNav() {
	  $(this)
	    .parents('ul:first')
	      .find('a')
	        .removeClass('selected')
	      .end()
	    .end()
	    .addClass('selected');
	}

	$('#iavouch-container .iavouch-navigation-list').find('a').click(selectNav);

	// go find the navigation link that has this target and select the nav
	function trigger(data) {
	  var el = $('#iavouch-container .iavouch-navigation-list').find('a[href$="' + data.id + '"]').get(0);
	  selectNav.call(el);
	}

	if (window.location.hash) {
	  trigger({ id : window.location.hash.substr(1) });
	} else {
	  $('ul.iavouch-navigation-list a:first').click();
	}

	// offset is used to move to *exactly* the right place, since I'm using
	// padding on my example, I need to subtract the amount of padding to
	// the offset.  Try removing this to get a good idea of the effect
	var offset = parseInt((horizontal ? 
	  $container.css('paddingTop') : 
	  $container.css('paddingLeft')) 
	  || 0) * -1;


	var scrollOptions = {
	  target: $scroll, // the element that has the overflow
	  
	  // can be a selector which will be relative to the target
	  items: $panels,
	  
	  navigation: '.iavouch-navigation-list a',
	  
	  // selectors are NOT relative to document, i.e. make sure they're unique
	  prev: 'a.iavouch-nav-prev', 
	  next: 'a.iavouch-nav-next',
	  
	  // allow the scroll effect to run both directions
	  axis: 'xy',
	  
	  onAfter: trigger, // our final callback
	  
	  offset: offset,
	  
	  // duration of the sliding effect
	  duration: 500,
	  
	  // easing - can be used with the easing plugin: 
	  // http://gsgd.co.uk/sandbox/jquery/easing/
	  easing: 'swing'
	};

	// apply serialScroll to the slider - we chose this plugin because it 
	// supports// the indexed next and previous scroll along with hooking 
	// in to our navigation.
	$('#iavouch-container').serialScroll(scrollOptions);

	// now apply localScroll to hook any other arbitrary links to trigger 
	// the effect
	$.localScroll(scrollOptions);

	// finally, if the URL has a hash, move the slider in to position, 
	// setting the duration to 1 because I don't want it to scroll in the
	// very first page load.  We don't always need this, but it ensures
	// the positioning is absolutely spot on when the pages loads.
	scrollOptions.duration = 1;
	$.localScroll.hash(scrollOptions);

});
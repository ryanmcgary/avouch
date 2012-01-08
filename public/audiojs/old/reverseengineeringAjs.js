// cross browser shim for html5, may not be needed
function(audiojs, audiojsInstance, container) {
	// global object to create "audiojs"
	container[audiojs] = {
		
		instanceCount: 0, 

		settings: {
			loop: false 
		},
		

		// `createAll()`  
    // Creates multiple `audiojs` instances.  
    // If `elements` is `null`, then automatically find any `<audio>` tags on the page and create `audiojs` instances for them.
    /* Calls this function first Grabs audio elements on page and creates unique instance for each tag it finds */
    createAll: function(options, elements) {
      var audioElements = elements || document.getElementsByTagName('audio'),
          instances = []
          options = options || {};
      for (var i = 0, ii = audioElements.length; i < ii; i++) {
        instances.push(this.newInstance(audioElements[i], options));
      }
      return instances;
    },


    // Used to create a single `audiojs` instance.  
    // If an array is passed then it calls back to `createAll()`.  
    // Otherwise, it creates a single instance and returns it.  
		/* Will redirct to createAll if array detectedotherwise will GOTO newInstance */
		create: function(element, options) {  
			var options = options || {} // if var options not defined create empty string
			if (element.length) { // if element exist return this. to array w/ length
			  return this.createAll(options, element); // calls createAll with this. returned
			} else { // if element doesn't exist or have length
				return this.newInstance(element, options); // send this. to new instance
			}
		},

    // ### Creating and returning a new instance
    // This goes through all the steps required to build out a usable `audiojs` instance.
    newInstance: function(element, options) {
      var element = element,
          s = this.helpers.clone(this.settings),
          id = 'audiojs'+this.instanceCount,
          wrapperId = 'audiojs_wrapper'+this.instanceCount,
          instanceCount = this.instanceCount++;
      // Check for `autoplay`, `loop` and `preload` attributes and write them into the settings.
      if (element.getAttribute('autoplay') != null) s.autoplay = true;	
	};
}


console.log(options);
var options = options || {};
console.log(options);
options[options.length] = 'this';
options[options.length] = { fish:
hair : 'red',
age : 32,
city : 'London'
};

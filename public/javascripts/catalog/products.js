var Product = (function(){
	var imageContainerId = "#";
	var initialize = function(containerId){
		imageContainerId += containerId;
		var thumbs = _('#thumbs').children();
		var image = _(thumbs.first());
		nextImage(image.attr('link'), image.attr('original'));
		thumbs.each(function(index, image){
			_(image).click(function(){
				_(imageContainerId).addClass('loading').html("");
				nextImage(_(image).attr('link'),_(image).attr('original'));
			});
		});
	};
	
	var nextImage = function(link, original){
		var img = new Image();
		_(img).load(function () {
	      _(this).hide();
	    	_(imageContainerId).removeClass('loading').append(this);
	      // fade our image in to create a nice effect
	      _(this).show();
	    }).error(function () {
	      // notify the user that the image could not be loaded
	    }).attr('src', link).attr('rel', original).attr('id', 'imageView');
		return false;
	};
		
	return {
		'initialize': initialize
	};
})();
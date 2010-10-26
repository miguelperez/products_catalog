var Product = (function(){
	var initialize = function(){
		var thumbs = _('#thumbs').children();
		var image = _(thumbs.first());
		nextImage(image.attr('link'), image.attr('original'));
		thumbs.each(function(index, image){
			_(image).click(function(){
				_('#selected_image').addClass('loading').html("");
				nextImage(_(image).attr('link'),_(image).attr('original'));
			});
		});
	};
	
	var nextImage = function(link, original){
		var img = new Image();
		_(img).load(function () {
	      _(this).hide();
	    	_('#selected_image').removeClass('loading').append(this);
	      // fade our image in to create a nice effect
	      _(this).fadeIn();
				applyZoom();
	    }).error(function () {
	      // notify the user that the image could not be loaded
	    }).attr('src', link).attr('rel', original).attr('id', 'imageView');
		return false;
	};
	
	var applyZoom = function(){
		_('#selected_image').imageView({width: 300, height:300});
	};
	
	return {
		'initialize': initialize
	};
})();

Product.initialize();
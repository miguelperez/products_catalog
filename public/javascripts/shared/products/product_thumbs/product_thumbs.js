var Product = Product || {};
Product.thumbs = (function(){
  
  // We receive the id of the div that contains the ul with the products thumbs. We need to append another ul with the 
  // buttons to trigger the list or grid view.
  //contaierID is the container that will hold the buttons.
  //productThumbs is the container that will be modified
  var initialize = function(containerId, productThumbs){
    _("#" + containerId).prepend(generateButtons(containerId, productThumbs));
  };
  
  //generates an UL which have buttons for interacting with the product thumbs
  //contaierID is the container that will hold the buttons.
  //productThumbs is the container that will be modified
  var generateButtons = function(containerId, productThumbs){
    var ul = _("<ul class='thumb_buttons'></ul>");
    ul.append(generateButton("list", productThumbs));
    ul.append(generateButton("grid", productThumbs));
    return ul;
  };
  
  //returns a ready to use thumb button.
  //receives the title of the button, that will be use to fetch the image that will have the same name.
  //receives the container over which the actions will be applied.
  var generateButton = function(title, productThumbs){
    var link = _("<a href='#' class='thumb_button'>" + title + "</a>");
    
    link.click(function(){
      var productThumbList = _("." + productThumbs);
      productThumbList.removeClass();
      productThumbList.addClass(title + " " + productThumbs);
      return false;
    });
    return link;
  };
  
  return {
    'initialize': initialize
  };
})();
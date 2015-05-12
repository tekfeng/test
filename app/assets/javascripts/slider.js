(function($, window){
  
  $.fn.slider = function(){
    return this.each(function(){
      var $container = $(this).children().eq(0);
      var prev = $(this).parent().find(".prev").eq(0);
      var next = $(this).parent().find(".next").eq(0);
      
      if (!$container) return;
      
      var $slides = $container.children(),
          len = $slides.length,
          i = $slides.outerWidth(true),
          inSlider = Math.floor($(this).width() / i),
          firstItem = 1,
          isMoving = false;
     
      $container.css('width', (len + inSlider) * i);
      
      for (var j = 0; j < inSlider; j++){
        $container.append($slides.eq(j).clone());
      }
      
      $(next).click(function(e){
        e.preventDefault();
        
        if(firstItem > len){
          firstItem = 2;
          $container.css("left","0px")
        }
        else firstItem++;
        
        // console.log(firstItem);
        
        if (!isMoving){
          isMoving = true;
          $container.animate({
            left: '-=' + i
          },
          'swing',
          function(){
              isMoving = false;
          });
        }
      });
      
      $(prev).click(function(e){
         e.preventDefault();
        
        if(firstItem === 1){
          $container.css("left", len * i * -1);
          firstItem = len;
        }
        else firstItem --;
        
        if (!isMoving){
          isMoving = true;
          $container.animate({
            left: '+=' + i
          },
          'swing',
          function(){
            isMoving = false;
          });
        }
      });
    });
  }
  
})(jQuery, window);
$(document).ready(function(){

		$('#brand_dropdown select').selectmenu({
				width: 200
		});

	
		/* NOTICE */
		$('#noticeMain').click(function(){
				$(this).fadeOut('slow');				
				$.cookie( "rackjamnotice", "closed", { expires: 2 } ); 	
		})
		
		/* ISOTOPE */
  	$('#results.items.grid').isotope({
    	itemSelector: '.item',
			layoutMode : 'fitRows',
			animationOptions: {
		     duration: 500,
		     easing: 'linear',
		     queue: false
		   }
    });		

		$("#box").jCarouselLite({
				auto: 10000,
				speed: 700,
				circular: true,
				visible: 1,
				easing: 'easeInOutCubic',
				start: Math.floor(Math.random()*$("#box ul li").length)
				// vertical: true
    });

		/*
		$('#box').hover(
			function() {
				$(this).fadeTo('slow', 1);
			}, 
			function() {
				$(this).fadeTo('slow', 0.7);
			}
		)
		*/
				
});


$(document).ready(function() {
	
	    $('.form span.defaultValue').each(function() {
    
	        var defaultValue = $(this).text();
	        var inputField = $(this).siblings('input');
        
	        inputField.attr("default",defaultValue) /* add the default attribute ~ <input type="" default="dd/mm/yyy" */
	        if (inputField.val() == '' || inputField.val() == defaultValue) {
	            inputField.val(defaultValue).addClass('defaultValueFields').addClass('initValue')
	        } 
	    });
     
	    /* Handle a click on a defaultValue field */
	    $(".defaultValueFields").live('focus',function() {   
	        $(this).removeClass('initValue')
    
	        if( $(this).val() == $(this).attr("default") ) {
	            $(this).val('');
	        }
	    }).blur(function() {
	        if( !$(this).val().length ) {
	            $(this).val($(this).attr("default")).addClass('initValue');
	        }
	    });  
	
		  /* Hover functions */
  		function hoveredItem(){ 
					$.ajax({
					  url: "/interests.js",
						data: { id: $(this).attr('id'), value: + "1" }
					});
			}
			
			function clickedItem(id){ 
					$.ajax({
					  url: "/interests.js",
						data:  { id: id, value: + "3" }
					});
			}
			
			function someFunc() {  }
			
			var config = {    
				over: someFunc, // function = onMouseOver callback (REQUIRED)    
				timeout: 2500, // number = milliseconds delay before onMouseOut    
				out: hoveredItem, // function = onMouseOut callback (REQUIRED)    
				interval: 75
			};
			
			$("#results li").hoverIntent(config)
			$("#results li").click(function(){ clickedItem($(this).attr('id')); })
	
});	

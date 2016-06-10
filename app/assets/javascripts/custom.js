$(document).on('ready', function(){


        	 var wizard = $("#wizard").steps({
				headerTag: "h1",
				bodyTag: "section",
				transitionEffect: "fade",
				enablePagination:false,
				onStepChanged:function (event, currentIndex, priorIndex) { 
					if(currentIndex==8 | currentIndex==9){
						 $("#wizard").addClass("wizard_bg");
					} else  $("#wizard").removeClass("wizard_bg");
					
				}, 
				onInit: function () { 
					resizeSliderContent();
				}
				// onStepChanged:function (event, currentIndex, priorIndex) { 
				//     var height= $(".steps").height() + $("footer").height() ;
				//     $("#wizard .content").height(height);
				// }
			});
        
 

    	$(".brands .dknow_btn label").on('click', function(){
    		$(".brands .multiselect_item").removeClass('checked');
    	})
   		$(".brands .multiselect_item").on('click', function(){
   			$(".brands .dknow_btn input").prop('checked',false);
   			var value=$(".brands input.fieldset-data").attr("value").replace('dont_know,','').replace('dont_know','');
   			$(".brands input.fieldset-data").attr("value",value);
   			})
		
		$("button[type=submit]").click(function(){
			var validate=true;
			$("form input").removeClass("error"); 
			$("form input").each(function( index ) { 
				if($(this).val()=="") 
				{
					$(this).addClass("error"); 
					validate=false;
				}
			});
			if ($("form input#password").val()!=$("form input#confirmpassword").val())
			{
				$("form input#confirmpassword").addClass("error"); 
				validate=false;
			}
			if (validate==true) {
				$("#wizard").steps("next");
			}
			return false;
		});
		
		
		
		$(".man_select").click(function(){	
			var name=$(this).attr("name"), value=$(this).attr("value");
			$("section.current input.fieldset-data").attr("value",value);
			changeGender();
			$(".woman_block").css("display","none");
			$(".man_block").css("display","block");

		});
		
		$(".woman_select").click(function(){
					var name=$(this).attr("name"), value=$(this).attr("value");
					$("section.current input.fieldset-data").attr("value",value);
					changeGender();
					$(".man_block").css("display","none");
					$(".woman_block").css("display","block");						
	
			});
		
		
		
		
		

		
			$(".multiselect_item").click(function(){
				var name=$(this).attr("name"), value=$(this).attr("value");				
				var cur_value=$("section.current input.fieldset-data").attr("value")+", "+value;
				$("section.current input.fieldset-data").attr("name",name);


				var ind=$("#wizard").steps("getCurrentIndex")+1;
				
				
				if($(this).hasClass("checked"))
				{
					$(this).removeClass("checked");
					var val=$("section.current input.fieldset-data").attr("value");
					 var v= ", "+value
					 val.replace(v,""); 
					 $("section.current input.fieldset-data").attr("value",val);
				}
				else {
					$(this).addClass("checked");
					$("section.current input.fieldset-data").attr("value",cur_value);
				}
				$("#wizard").steps("next");
			});
			
			$("#dont_know_brand").click(function(){
				$("#wizard").steps("next");
				$("section.brands input.fieldset-data").attr("value","dont_know");
				});

			$(".select_item").click(function(){
				var name=$(this).attr("name"), value=$(this).attr("value");				
				$("section.current input.fieldset-data").attr("value",value);
				$("section.current input.fieldset-data").attr("name",name);
				$("section.current .checked").removeClass("checked");
				$(this).addClass("checked");
				$("#wizard").steps("next");
			
			});
			
			$(".select_items").click(function(){
				var name=$(this).attr("name"), value=$(this).attr("value");var next=1;
				name = name.replace('_w', '');
				$("section.current input[name='"+name+"'][type='hidden']").attr("value",value);
				
				$("section.current input[type='hidden']").each(function( index ) {
				  if($( this ).attr("value")=="") {
				  next=0;
				  return false;}
				});
				 if(next==1) $("#wizard").steps("next");
			});

		
		
		function changeGender(){
			$("section input.fieldset-data:not(input[name='user[gender]'])").attr("value","");
			$('#wizard input[type="radio"]:checked').prop("checked", false); 
			$("ul[role=tablist] li.done").not(":first").addClass("disabled");
			$("ul[role=tablist] li.done").not(":first").attr("aria-disabled","true");
			$("ul[role=tablist] li.done").not(":first").removeClass("done");
		}
		
	});	


function resizeSliderContent(){
	var win_height = window.innerHeight, steps=$(".steps").outerHeight(true) , footer=$("footer").outerHeight(true), nav=$(".navbar").outerHeight(true);
	
	
	$("#wizard .content section").each(function( index ) {
		titleheight =  $(this).find("h4.step_title").outerHeight(true);
		if(index!=0){
			$(this).css({'visibility':'hidden', 'display':'block'});
			titleheight =  $(this).find("h4.step_title").outerHeight(true);
			if(index==5) 
			{
				titleheight =  $(this).find("h4.step_title").parent().outerHeight(true);
			}
			$(this).css({'visibility':'visible', 'display':'none'});
		}

		var height= Math.floor(win_height- steps - footer - nav - titleheight);
		$(this).find("div.slider_content").height(height);	 
	});
}




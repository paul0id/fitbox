$(document).on('ready', function(){
        	 $("#wizard").steps({
				headerTag: "h1",
				bodyTag: "section",
				transitionEffect: "fade",
				enablePagination:false,
				onStepChanged:function (event, currentIndex, priorIndex) { 
					if(currentIndex==8 | currentIndex==9){
						 $("#wizard").addClass("wizard_bg");
					} else  $("#wizard").removeClass("wizard_bg");
				}, 
			});
        
          

          
   
		
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
				$(	$("ul[role='tablist'] li")[ind]).removeClass("disabled");
				$(	$("ul[role='tablist'] li")[ind]).addClass("done");
				
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

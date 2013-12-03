function toggle_types_description(id){
	
	var item; 
	$.each( window.cost_types, function(i, obj) {
	  if (obj.id == id) 
	  	item = obj;
	});

	$("#title").text(item.title);
	$("#description").text(item.description);
	$("#prize").text(item.prize+'€');
	if(item.type_class=="hourly"){
		$("#times_div").css({"visibility":"visible"});
		$("#quantity_div").css({"visibility":"hidden"});
	}else if(item.type_class=="driving"){
		$("#quantity_div").css({"visibility":"visible"});
		$("#times_div").css({"visibility":"hidden"});
	}else{
		$("#quantity_div").css({"visibility":"hidden"});
		$("#times_div").css({"visibility":"hidden"});
	}
}

$(document).ready(function(){
	var start_time = "12:00";
	var end_time = "13:00";

	if((typeof(window.cost_item) != "undefined")){
		if(window.cost_item.startTime != null){
			start_time= window.cost_item.startTime.split("T")[1];
		}
		var end_time = "13:00";
		if(window.cost_item.endTime != null){
			end_time= window.cost_item.endTime.split("T")[1];
		}
	}

	$('.timepicker_start').timepicker({
                template: 'modal',
                defaultTime: start_time,
                showSeconds: true,
                showMeridian: false
	});
	$('.timepicker_end').timepicker({
                template: 'modal',
                defaultTime: end_time,
                showSeconds: true,
                showMeridian: false
	});
});
function toggle_interval_field(selection){
		if(selection=="hourly"){
			$("#interval_field").css({"visibility":"visible"});
		}else{
			$("#interval_field").css({"visibility":"hidden"});
		}
	}
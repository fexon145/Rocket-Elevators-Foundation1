Document.ready

//building
$("#intervention_building_id").prop("disabled", true);
$("#intervention_customer_id").change(function(){
  	var building = $(this).val();
  	if(building == ''){
  		$("#intervention_building_id").prop("disabled", true);
  	}else{
  		$("#intervention_building_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/building_take/" + building,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#intervention_building_id").empty();

	      	$("#intervention_building_id").append('<option>Select a Building</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_building_id").append('<option value="' + tasks[i]["id"] + '">' + "Building with id: " +tasks[i]["id"] + '</option>');
	      	}
	    }
  	});
});

// battery

$("#intervention_battery_id").prop("disabled", true);
$("#intervention_building_id").change(function(){
  	var battery = $(this).val();
  	if(battery == ''){
  		$("#intervention_battery_id").prop("disabled", true);

		// $("#intervention_battery_id").empty();
		// $("#intervention_column_id").empty();
		// $("#intervention_elevator_id").empty();
  	}else{
  		$("#intervention_battery_id").prop("disabled", false);

		// $("#intervention_column_id").empty();
		// $("#intervention_elevator_id").empty();
  	}
  	$.ajax({
	    url: "/battery_take/" + battery,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#intervention_battery_id").empty();

	      	$("#intervention_battery_id").append('<option>Select a Battery</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_battery_id").append('<option value="' + tasks[i]["id"] + '">' + "Battery with id: " +tasks[i]["id"] + '</option>');
	      	}
	    }
  	});
});

// //column
$("#intervention_column_id").prop("disabled", true);
$("#intervention_battery_id").change(function(){
  	var column = $(this).val();
  	if(column == ''){
  		$("#intervention_column_id").prop("disabled", true);
  	}else{
  		$("#intervention_column_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/column_take/" + column,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#intervention_column_id").empty();

	      	$("#intervention_column_id").append('<option>Select a Column</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_column_id").append('<option value="' + tasks[i]["id"] + '">' + "Column with id: " + tasks[i]["id"] + '</option>');
	      	}
	    }
  	});
});


// //elevator
$("#intervention_elevator_id").prop("disabled", true);
$("#intervention_column_id").change(function(){
  	var column = $(this).val();
  	if(column == ''){
  		$("#intervention_elevator_id").prop("disabled", true);
  	}else{
  		$("#intervention_elevator_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/elevator_take/" + column,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#intervention_elevator_id").empty();

	      	$("#intervention_elevator_id").append('<option>Select a Elevator</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_elevator_id").append('<option value="' + tasks[i]["id"] + '">' + "Elevator with id: " +tasks[i]["id"] + '</option>');
	      	}
	    }
  	});
});

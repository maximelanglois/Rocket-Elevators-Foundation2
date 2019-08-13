$(document).ready(function(){
	//alert("jQuery est prêt !");
  //console.log("Hello");
  
  $('.hide_select').hide();

  //########################## BUILDING ################ REF from : CUSTOMER ######################
  $("#customer_list").change(function(){
    var customer_id = $(this).val();
    $.ajax({
      url: "building_select",
      method: "POST",
      dataType: "json",
      data: {
        customer_id: customer_id,
      },
      error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
        var buildings = response["buildings"];
        $("#building_list").empty().append('<option>Select</option>');
        for(var i=0; i < buildings.length; i++){
          $("#building_list").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');
        }
        $('#building_show').show();
      }
    });
  });
  //########################## BATTERY ################## REF from : BUILDING ######################
  $("#building_list").change(function(){
    var building_id = $(this).val();
    $.ajax({
      url: "battery_select",
      method: "POST",
      dataType: "json",
      data: {
        building_id: building_id,
      },
      error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
        var batteries = response["batteries"];
        $("#battery_list").empty().append('<option>Select</option>');
        for(var i=0; i < batteries.length; i++){
          $("#battery_list").append('<option value="' + batteries[i]["id"] + '">' + batteries[i]["id"] + '</option>');
        }
        $('#battery_show').show();
      }
    });
  });
  //########################## COLUMN ################### REF from : BATTERY ######################
  $("#battery_list").change(function(){
    var battery_id = $(this).val();
    $.ajax({
      url: "column_select",
      method: "POST",
      dataType: "json",
      data: {
        battery_id: battery_id,
      },
      error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
        var columns = response["columns"];
        $("#column_list").empty().append('<option>Select</option>');
        for(var i=0; i < columns.length; i++){
          $("#column_list").append('<option value="' + columns[i]["id"] + '">' + columns[i]["id"] + '</option>');
        }
        $('#column_show').show();
      }
    });
  });
  //########################## ELEVATOR ################### REF from : COLUMN ######################
  $("#column_list").change(function(){
    var column_id = $(this).val();
    $.ajax({
      url: "elevator_select",
      method: "POST",
      dataType: "json",
      data: {
        column_id: column_id,
      },
      error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
        var elevators = response["elevators"];
        $("#elevator_list").empty().append('<option>Select</option>');
        for(var i=0; i < elevators.length; i++){
          $("#elevator_list").append('<option value="' + elevators[i]["id"] + '">' + elevators[i]["id"] + '</option>');
        }
        $('#elevator_show').show();
      }
    });
  });

});

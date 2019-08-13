//Prices according to project type

var strdUnit = 7565;
var strdInst = 0.1;
var premUnit = 12345;
var premInst = 0.13;
var excelUnit = 15400;
var excelInst = 0.16;

//Initialize default value to standard at page load

var optradioval = $("input[name=optradio]:checked").val();
var unitprice = strdUnit;
var instprice = strdInst;

//Setting pricing vars according to radio selectors

$(function() {
  $("#quotebody").change(function() {
    optradioval = $("input[name=optradio]:checked").val();
    if (optradioval === "standard") {
      unitprice = strdUnit;
      instprice = strdInst;
    } else if (optradioval === "premium") {
      unitprice = premUnit;
      instprice = premInst;
    } else {
      unitprice = excelUnit;
      instprice = excelInst;
    }
  });
});

//Prevent negative and decimal input

function restrictMinusDecimal(e) {
  var inputKeyCode = e.keyCode ? e.keyCode : e.which;
  if (inputKeyCode !== null) {
    if (inputKeyCode === 45 || inputKeyCode === 46) e.preventDefault();
  }
}

//Force max business hours  value to 24 

$(function() {
  $("#hbhours").change(function() {
    var businessHours = $("#hbhours").val();
    if (businessHours > 24) {
      $("#hbhours").val("24");
    } else $("#hbhours").val(businessHours);
  });
});

//Type selection formating

$(document).ready(
  $(function() {
    $("#type_selector").change(function() {
      $(".typeq").hide();
      $("." + $(this).val()).show();
    });
  })
);

//Type selection validation

$(function() {
  $("#quotebody").change(function() {
    var pType = $("#type_selector").val();

    if (pType === "residentialq") {
      residentialBill();
    } else if (pType === "commercialq") {
      commercialBill();
    } else if (pType === "corporateq") {
      corporateBill();
    } else if (pType === "hybridq") {
      hybribBill();
    } else alert("Start by selecting a project type");
  });
});

//Residential bill

function residentialBill() {
  var rappqty = $("#rappqty").val();
  var rfloorqty = parseInt($("#rfloorqty").val()) || 0;
  var rugfloorsqty = parseInt($("#rugfloorsqty").val()) || 0;
  var rtotalfloor = rfloorqty + rugfloorsqty;
  if (rappqty < 1 || rfloorqty < 1) {
    $("#rerror").text("***Fill all required fields***");
    $("#rshaftresult").val("---");
    $("#rtotalcost").val("---");
  } else {
    var averageapp = rappqty / rfloorqty;
    var rsix = Math.ceil(averageapp / 6);
    var rtwenty = Math.ceil(rtotalfloor / 20);
    var rshafts = rsix * rtwenty;
    var rtotal = rshafts * unitprice * (1 + instprice);
    var routput =
      rtotal.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "$";
    $("#rshaftresult").val(rshafts);
    $("#rtotalcost").val(routput);
    $("#rerror").text("");
  }
}

//Commercial bill

function commercialBill() {
  var cshafts = $("#cshaftqty").val();
  if (cshafts < 1) {
    $("#cerror").text("***Fill all required fields***");
    $("#cshaftresult").val("---");
    $("#ctotalcost").val("---");
  } else {
    var ctotal = cshafts * unitprice * (1 + instprice);
    var coutput =
      ctotal.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "$";
    $("#cshaftresult").val(cshafts);
    $("#ctotalcost").val(coutput);
    $("#cerror").text("");
  }
}
//Corporate bill

function corporateBill() {
  var bfloorqty = parseInt($("#bfloorqty").val()) || 0;
  var bugfloorqty = parseInt($("#bugfloorqty").val()) || 0;
  var bmaxoccqty = $("#bmaxoccqty").val() || 0;
  var btotalfloors = bfloorqty + bugfloorqty;
  if (bfloorqty < 1 || bmaxoccqty < 1) {
    $("#berror").text("***Fill all required fields***");
    $("#bshaftresult").val("---");
    $("#btotalcost").val("---");
  } else {
    var btotocc = bmaxoccqty * btotalfloors;
    var bprelimshafts = Math.ceil(btotocc / 1000);
    var bcolqty = Math.ceil(btotalfloors / 20);
    var bshaftbycol = Math.ceil(bprelimshafts / bcolqty);
    var bfinalshafts = bcolqty * bshaftbycol;
    var btotal = bfinalshafts * unitprice * (1 + instprice);
    var boutput =
      btotal.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "$";
    $("#bshaftresult").val(bfinalshafts);
    $("#btotalcost").val(boutput);
    $("#berror").text("");
  }
}

//Hybrid bill

function hybribBill() {
  var hfloorqty = parseInt($("#hfloorqty").val()) || 0;
  var hugfloorqty = parseInt($("#hugfloorqty").val()) || 0;
  var hmaxoccqty = $("#hmaxoccqty").val();
  var htotalfloors = parseInt(hfloorqty) + parseInt(hugfloorqty);

  if (hfloorqty < 1 || hmaxoccqty < 1) {
    $("#herror").text("***Fill all required fields***");
    $("#hshaftresult").val("---");
    $("#htotalcost").val("---");
  } else {
    var htotocc = hmaxoccqty * htotalfloors;
    var hprelimshafts = Math.ceil(htotocc / 1000);
    var hcolqty = Math.ceil(htotalfloors / 20);
    var hshaftbycol = Math.ceil(hprelimshafts / hcolqty);
    var hfinalshafts = hshaftbycol * hcolqty;
    var htotal = hfinalshafts * unitprice * (1 + instprice);
    var houtput =
      htotal.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "$";
    $("#hshaftresult").val(hfinalshafts);
    $("#htotalcost").val(houtput);
    $("#herror").text("");
  }
}

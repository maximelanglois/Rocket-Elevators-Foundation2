//Prices according to project type

var strdUnit = 7565;
var strdInst = 0.1;
var premUnit = 12345;
var premInst = 0.13;
var excelUnit = 15400;
var excelInst = 0.16;

var send = false;


 
function sendQuote(){
  
    var email = document.getElementById("email_customer").value;
    var company = document.getElementById("company_name").value;
    if(email != "" & company != "" & (grecaptcha.getResponse().length !== 0)){
      redirectToSuccess();
      send = true;
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
}   else alert("To send a quote input an e-mail and a company name and check the reCapatcha!")
}

function redirectToSuccess(){  
  window.location.href = "/quote_received.html";
}

//Initialize default value to standard at page load

var optradioval = $("input[name=optradio]:checked").val();
let unitprice;
var instprice = strdInst;

//Setting pricing vars according to radio selectors

$(function() {
  $("#quotebody").change(function() {
    optradioval = $("input[name=optradio]:checked").val();
    if (optradioval === "standard") {
      unitprice = "standard";
      instprice = strdInst;
    } else if (optradioval === "premium") {
      unitprice = "premium";
      instprice = premInst;
    } else {
      unitprice = "excelium";
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
  apiCall("residential")
}

//Commercial bill

function commercialBill() {
  apiCall("commercial")
}
//Corporate bill

function corporateBill() {
  apiCall("corporate")
}

//Hybrid bill

function hybribBill() {
  apiCall("hybrid")
}

function apiCall(customerType){
  if(send == null){
    send = false
  }
  var rrooms = $("#rappqty").val();
  var rfloors = parseInt($("#rfloorqty").val()) || 0;
  var rbasements = parseInt($("#rugfloorsqty").val()) || 0;

  var hfloors = parseInt($("#hfloorqty").val()) || 0;
  var hbasements = parseInt($("#hugfloorqty").val()) || 0;
  var hmax = $("#hmaxoccqty").val();

  var cofloors = parseInt($("#bfloorqty").val()) || 0;
  var cobasements = parseInt($("#bugfloorqty").val()) || 0;
  var comax = $("#bmaxoccqty").val() || 0;

  var cmcages = $("#cshaftqty").val();

  let parkingSpaces;
  if(customerType == "commercial"){
    parkingSpaces = parseInt(document.getElementById("cparkqty").value);
  }else if(customerType == "corporate"){
    parkingSpaces = parseInt(document.getElementById("bparkqty").value);
  }else if(customerType == "hybrid"){
    parkingSpaces = parseInt(document.getElementById("hparkqty").value);
  }
  let storesAndShops;
  if(customerType == "commercial"){
    storesAndShops = parseInt(document.getElementById("storeqty").value);
  }else if(customerType == "hybrid"){
    storesAndShops = parseInt(document.getElementById("hstoreqty").value);
  }

  let reqObj = {
    "customerType": customerType,
    "qualityTier": unitprice,

    "rfloors": rfloors,
    "rbasements": rbasements,
    "rrooms": rrooms,

    "cmcages": cmcages,

    "cofloors": cofloors,
    "cobasements": cobasements,
    "comax": comax,

    "hfloors": hfloors,
    "hbasements": hbasements,
    "hmax": hmax,

    "stores_and_shops": storesAndShops,
    "parking_spaces": parkingSpaces,

    "send": send,

    "email": document.getElementById("email_customer").value,
    "company": document.getElementById("company_name").value,
    "host"     : "codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com" ,
    "user"     : "codeboxx" ,
    "password" : "Codeboxx1!" ,
    "database" : "maximelanglois" ,
    "port"     : "3306" 

  }
  let request = JSON.stringify(reqObj);
  apiSend(request, customerType);
}

function apiSend(request, customerType){
  
  var http = new XMLHttpRequest();
  var url = 'https://vast-beyond-19698.herokuapp.com/';
  http.open('POST', url, true);
  http.setRequestHeader('Content-type', 'application/json');
  http.setRequestHeader('Access-Control-Allow-Origin', '*')

  http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
        let response = JSON.parse(http.responseText);
        switch(customerType){
          case "residential":
            $("#rshaftresult").val(response.cages);
            $("#rtotalcost").val(response.price);
            $("#rerror").text("");
            break
          case "commercial":
            $("#cshaftresult").val(response.cages);
            $("#ctotalcost").val(response.price);
            $("#cerror").text("");
            break
          case "corporate":
            $("#bshaftresult").val(response.cages);
            $("#btotalcost").val(response.price);
            $("#berror").text("");
            break
          case "hybrid":
            $("#hshaftresult").val(response.cages);
            $("#htotalcost").val(response.price);
            $("#herror").text("");
            break
        }
      }
  }
  http.send(request);
  
}

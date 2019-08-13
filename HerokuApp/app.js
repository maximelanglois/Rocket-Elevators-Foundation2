const express    = require('express'),
      app        = express(),
      mysql      = require('mysql'),
      bodyParser = require("body-parser"),
      cors       = require('cors'),
      port       = parseInt(process.env.PORT, 10) || 3000;
let   appartments,
      floors,
      underground_floors,
      shafts_required,
      total_cost,
      stores_and_shops,
      parking_spaces,
      elevator_shafts_required,
      businesses,
      max_nb_occ_by_floor,
      business_hours

app.use(cors());
app.use(bodyParser.json());
app.listen(port);

app.post("/", function(req, res) {
  let customerType = req.body.customerType;
  let qualityTier = req.body.qualityTier;
  let response = calcPrice(qualityTier, customerType, req);

  res.header("Access-Control-Allow-Origin", "*");
  res.header ('Access-Control-Allow-Credentials', true);
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.send(response);
});
function calcPrice(qualityTier, customerType, req){
  let install = 0;
  let price = 0;
  let finalPrice = "All required fields must be completed";
  let finalCages = "All required fields must be completed";
  let finalCols = "All required fields must be completed";
  switch (qualityTier) {
    case "standard":
      price = 7565;
      install = 0.1;
      break;
    case "premium":
      price = 12345;
      install = 0.13;
      break;
    case "excelium":
      price = 15400;
      install = 0.16;
      break;
  }
  switch (customerType) {
    case "residential":
      
      let rfloors = req.body.rfloors;
      let rbasements = req.body.rbasements;
      let rrooms = req.body.rrooms;
      floors = rfloors;
      underground_floors = rbasements;
      appartments = rrooms
  
      if((!rfloors && rfloors != 0) && (!rbasements && rbasements != 0)){break};
      if(!rrooms && rrooms != 0){break};
      if(!rfloors){rfloors = 0};
      if(!rbasements){rbasements = 0};

      let rtotFloors = rfloors + rbasements;
      let moy = Math.ceil(rrooms / rfloors);
      let rcages = Math.ceil(moy / 6);

      let rcols = 0;
      if(rcages > 0){rcols = 1};

      if(rfloors > 20){
        rcols *= Math.ceil(rtotFloors / 20);
      }

      rcages *= rcols;

      if(rtotFloors < 1){
        rcages = 0;
        rcols = 0;
      }
      if(rrooms < 1){rcols = 1};

      finalPrice = rcages * price;
      finalPrice += install * finalPrice;
      finalPrice += " $"
      finalCages = rcages;
      finalCols = rcols;
      break;
    case "commercial":
      

      let cmfloors = req.body.cmfloors;
      let cmbasements = req.body.cmbasements;
      let cmcages = req.body.cmcages;

      floors = cmfloors;
      underground_floors = cmbasements;
      appartments = null;
      elevator_shafts_required = cmcages;
     
      if(!cmcages && cmcages != 0){break};
      if(!cmfloors){cmfloors = 0};
      if(!cmbasements){cmbasements = 0};

      let cmtotFloors = cmfloors + cmbasements;

      finalPrice = cmcages * price;
      finalPrice += finalPrice * install;
      finalPrice += " $";
      finalCages = cmcages;
      finalCols = 1;
      break;
    case "corporate":
      
      let cofloors = req.body.cofloors;
      let cobasements = req.body.cobasements;
      let comax = req.body.comax;
      
      floors = cofloors;
      underground_floors = cobasements;
      max_nb_occ_by_floor = comax;
      appartments = null;

      if((!cofloors && cofloors != 0) && (!cobasements && cobasements != 0)){break};
      if(!comax && comax != 0){break};
      if(!cofloors){cofloors = 0};
      if(!cobasements){cobasements = 0};

      let cototFloors = cofloors + cobasements;

      let cocages1 = Math.ceil((comax * cototFloors) / 1000);
      let cocols = Math.ceil(cototFloors / 20);
      let cocages = Math.ceil(cocages1 / cocols);
      if(!cocages){cocages = 0};

      cocages *= cocols;

      finalPrice = cocages * price;
      finalPrice += finalPrice * install;
      finalPrice += " $"
      finalCols = cocols;
      finalCages = cocages;
      break;
    case "hybrid":
      
      let hfloors = req.body.hfloors;
      let hbasements = req.body.hbasements;
      let hmax = req.body.hmax;

      floors = hfloors;
      underground_floors = hbasements;
      max_nb_occ_by_floor = hmax;
      appartments = null;

      if((!hfloors && hfloors != 0) && (!hbasements && hbasements != 0)){break};
      if(!hmax && hmax != 0){break};
      if(!hfloors){hfloors = 0};
      if(!hbasements){hbasements = 0};

      let htotFloors = hfloors + hbasements;

      let hcages1 = Math.ceil((hmax * htotFloors) / 1000);
      let hcols = Math.ceil(htotFloors / 20);
      let hcages = Math.ceil(hcages1 / hcols);
      if(!hcages){hcages = 0};

      hcages *= hcols;

      finalPrice = hcages * price;
      finalPrice += finalPrice * install;
      finalPrice += " $"
      finalCols = hcols;
      finalCages = hcages;
      break;
  }
  var resObj = {
    "price": finalPrice,
    "cols": finalCols,
    "cages": finalCages
  }
  total_cost = finalPrice;
  shafts_required = finalCages;
  stores_and_shops = req.body.stores_and_shops;
  parking_spaces = req.body.parking_spaces;


  if(req.body.send){
    var connection = mysql.createConnection({

      host     : 'codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com',
      user     : 'codeboxx',
      password : 'Codeboxx1!',
      database : 'maximelanglois',
      port     : '3306'
    
    });

    connection.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
      var sql = "INSERT INTO quotes (project_type, created_at, updated_at, product_range, appartments, floors, underground_floors, shafts_required, total_cost, stores_and_shops, parking_spaces, elevator_shafts_required, businesses, max_nb_occ_by_floor, business_hours) VALUES ?";
      var values = [
        [req.body.customerType, new Date(), new Date(), req.body.qualityTier, appartments, floors, underground_floors, shafts_required, total_cost, stores_and_shops, parking_spaces, elevator_shafts_required, businesses, max_nb_occ_by_floor, business_hours]
      ]
      connection.query(sql,[values], function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
      });
    });
    return "sent"
  }else{
    return JSON.stringify(resObj);
  }
}

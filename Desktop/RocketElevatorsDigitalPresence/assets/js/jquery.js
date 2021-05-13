Document.ready

var apartments = $("#number-of-apartments")
var floors = $("#number-of-floors")
var basements = $("#number-of-basements")
var corp = $("#number-of-corporations")
var parking = $("#number-of-parking-space")
var cage = $("#number-of-elevator-cages")
var occupents = $("#maximum-occupancy")
var comp = $("#number-of-companies")
var bish = $("#business-hours")
var elevatorcage =$("#number-of-cages")

function hideQuestions() {
    apartments.hide()
    floors.hide()
    basements.hide()
    corp.hide()
    parking.hide()
    cage.hide()
    occupents.hide()
    comp.hide()
    bish.hide()
    elevatorcage.hide()
}

hideQuestions()

var buildtype = $("#buildtype")

$(buildtype).on("change", function() {
    var build = buildtype.val()
    if (build == "res1") {
        apartments.show()
        floors.show()
        basements.show()
        comp.hide()
        parking.hide()
        bish.hide()
        occupents.hide()
        corp.hide()
        cage.hide()
        elevatorcage.show()

    } else if (build == "com1"){
        floors.show()
        basements.show()
        corp.hide()
        parking.show()
        cage.show()
        bish.hide()
        occupents.hide()
        comp.show()
        apartments.hide()
        elevatorcage.show()

    }else if (build == "cor1"){
        floors.show()
        basements.show()
        corp.show()
        parking.show()
        cage.hide()
        bish.hide()
        occupents.show()
        comp.hide()
        apartments.hide()
        elevatorcage.show()

    }else if (build == "hyb1"){
        floors.show()
        basements.show()
        corp.hide()
        parking.show()
        cage.hide()
        bish.show()
        occupents.show()
        comp.show()
        apartments.hide()
        elevatorcage.show()

    } else {
        hideQuestions()
    }
})

var floor = $("#floor")  //number-of-floors
var aparts = $("#app")   //number-of-apartments
var numcage = $("#cage") //number-of-elevator-cages
var base = $("#base")    //number-of-basements
var park = $("#parki")   //number-of-parking-space
var compa = $("#compa")  //number-of-companies(businesses)
var occup = $("#occup")  //maximum-occupancy
var hour = $("#hour")    //business-hours
var corpo = $("#corpo")  //number-of-corporations
var elevatorcag =$("#elevatorcage") //num-of-cage

//function cal

function maincalc(){
  var buildtype = document.getElementById("buildtype")
  var build = buildtype.value
  if (build === "res1"){
    residentialcal()
    totalelevat()
    unitprinc()
    elevtotalcost()
    instalfee()
    totcost()
  }


  else if (build === "com1"){
    commercialcal()
    totalelevat()
    unitprinc()
    elevtotalcost()
    instalfee()
    totcost()
  }
    else if (build === "cor1") {
    corphybcal()
    totalelevat()
    unitprinc()
    elevtotalcost()
    instalfee()
    totcost()
  }
    else if (build === "hyb1"){
    corphybcal()
    totalelevat()
    unitprinc()
    elevtotalcost()
    instalfee()
    totcost()
    
 }
    else{

    }


}
var cageco = document.getElementById("elevatorcage")
function residentialcal() {
    var app = document.getElementById("app").value;
    var floor = document.getElementById("floor").value;
    averageperfloor = app / floor;
    eleva = Math.ceil(averageperfloor / 6);
    Columns = Math.ceil(floor / 20);
    numbelevator = Columns * 3;
    cageco.value = numbelevator;
    return cageco;

}

function commercialcal() {
    var elevat = document.getElementById("cage").value;
    cageco.value = elevat;
    return cageco;

}



function corphybcal() {
    var floor = document.getElementById("floor").value;
    var occupants = document.getElementById("occup").value;
    var basement = document.getElementById("base").value;
    totalfloor = Number(floor) + Number(basement)
    occupflor = (totalfloor * occupants);
    numbelevator = Math.floor(occupflor / 1000);
    columns = Math.ceil(totalfloor / 20);
    elevatorcol = Math.ceil(numbelevator / columns);
    totalelevator = elevatorcol * columns;
    cageco.value = totalelevator;
    return cageco;


}
var standard = document.getElementById("Standard");
var Premium = document.getElementById("Premium");
var Excelium = document.getElementById("Excelium");



function unitprinc(){
    var unitpric = document.getElementById("UnitPrice");
    if (standard.checked){
        unitpric.value = 7565.00;
    }

    else if (Premium.checked){
    unitpric.value = 12345.00;

    }
    else if (Excelium.checked){
    unitpric.value = 15400.00;

    }
}

function elevtotalcost(){
    var elevcost = document.getElementById("UnitPriceQuality");
    var lastotal = document.getElementById("totalelev");
    var unprices  = document.getElementById("UnitPrice");
    elevcost.value = lastotal.value * unprices.value;
    return elevcost;

}

function instalfee(){
    var instalfe = document.getElementById("InstallCost");
    var eletotalcost = document.getElementById("UnitPriceQuality").value;
    if (standard.checked){
        instalfe.value = eletotalcost * 0.1

    }
    else if (Premium.checked){
        instalfe.value = eletotalcost * 0.13

    }
    else if (Excelium.checked){
        instalfe.value = eletotalcost * 0.16

    }

}


function totalelevat(){
    var rec = document.getElementById("elevatorcage").value;
    var totalelev = document.getElementById("totalelev");
    totalelev.value = rec;
    return totalelev;

}

function totcost(){
var Totcost = document.getElementById("UnitPriceQuality").value;
var Insfee = document.getElementById("InstallCost").value;
var Totall = document.getElementById("Total");
    Totall.value = Number(Totcost) + Number(Insfee);
    return Totall

}

function ValReset() {
     var floor = document.getElementById("floor") 
     var aparts = document.getElementById("app") 
     var numcage = document.getElementById("cage") 
     var base = document.getElementById("base") 
     var park = document.getElementById("parki") 
     var compa = document.getElementById("compa") 
     var occup = document.getElementById("occup") 
     var hour = document.getElementById("hour") 
     var corpo = document.getElementById("corpo") 
     var elevatorcag = document.getElementById("elevatorcage") 

     floor.value = 0;
     aparts.value = 0;
     numcage.value = 0;
     cage.value = 0;
     base.value = 0;
     park.value = 0;
     compa.value = 0;
     occup.value = 0;
     hour.value = 0;
     corpo.value = 0;
     elevatorcag.value = 0;
     return floor.value, apartments.value, numcage.value, base.value, base.value, park.value, compa.value, occup.value, hour.value, corpo.value, elevatorcag.value;

}
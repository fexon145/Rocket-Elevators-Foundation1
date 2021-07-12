Document.ready
var apartments = $("#number-of-apartments")
var floors = $("#number-of-floors")
var basements = $("#number-of-basements")
var companies = $("#number-of-companies")
var parking = $("#number-of-parking-spots")
var elevators = $("#number-of-elevators")
var corpo = $("#number-of-corporations")
var maxocc = $("#maximum-occupancy")
var bush = $("#business-hours")
var cage = $("#number-of-lift-cages")
var Eleamountcalc = document.getElementById("elevator-amount");
var Eleunitpricecalc = document.getElementById("elevator-unit-price");
var Eletotalpricecalc = document.getElementById("elevator-total-price");
var Instalfeecalc = document.getElementById("installation-fees");
var FinalPricecalc = document.getElementById("final-price");
var standard = document.getElementById("standard");
var premium = document.getElementById("premium");
var excelium = document.getElementById("excelium");
var Cname = document.getElementById("company-name")
var Email = document.getElementById("email")


function hideQuestions() {
apartments.hide()
floors.hide()
basements.hide()
companies.hide()
parking.hide()
elevators.hide()
corpo.hide()
maxocc.hide()
bush.hide()
cage.hide()
}

hideQuestions()

var buildingType = $("#buildingType")

$(buildingType).on("change", function() {
    var building = buildingType.val()
    if (building == "residential") {
        apartments.show()
        floors.show()
        basements.show()
        companies.hide()
        parking.hide()
        elevators.hide()
        corpo.hide()
        maxocc.hide()
        bush.hide()
        cage.show()
        
    } else if (building == "commercial"){
        apartments.hide()
        floors.show()
        basements.show()
        companies.show()
        parking.show()
        elevators.show()
        corpo.hide()
        maxocc.hide()
        bush.hide()
        cage.show()
    } else if (building == "corporate"){   
        apartments.hide()
        floors.show()
        basements.show()
        companies.hide()
        parking.show()
        elevators.hide()
        corpo.show()
        maxocc.show()
        bush.hide()
        cage.show()
    } else if (building == "hybrid"){   
        apartments.hide()
        floors.show()
        basements.show()
        companies.show()
        parking.show()
        elevators.hide()
        corpo.hide()
        maxocc.show()
        bush.show()
        cage.show()
    } else {
        hideQuestions()
    }
})

var cagecom = document.getElementById("cages")
var app = document.getElementById("app")
var flo = document.getElementById("flo")
var bas = document.getElementById("bas")
var com = document.getElementById("com")
var par = document.getElementById("par")
var ele = document.getElementById("ele")
var cor = document.getElementById("cor")
var moc = document.getElementById("moc")
var bus = document.getElementById("bus")
var elea = document.getElementById("ElevatorAmount")
var eleup = document.getElementById("unit-price")
var eletp = document.getElementById("total-price")
var InFe = document.getElementById("Instal-Fees")
var FinP = document.getElementById("Final-Price")
var EleUnitPrice = document.getElementById("unit-price").value;
var EletotalPrice = document.getElementById("total-price").value;
var EleInstalFee = document.getElementById("Instal-Fees").value;
var EleFinalPrice = document.getElementById("Final-Price").value;

function CageCalc() {
    var building = document.getElementById("buildingType")
    var build = building.value 
    if (build === "residential") {
        ResidentialCalc();
        
        if (flo.value > 1 && app.value > 1) { 
            AmountOfElevator();
        }
            if (standard.checked || premium.checked || excelium.checked){
                ShowCalc();
                UnitPriceSelect();
                ElevatorTotalPrice();        
                InstalFees();        
                FinalPrice();
                formatNumbers( Number(EleUnitPrice), Number(EletotalPrice), Number(EleInstalFee), Number(EleFinalPrice)); }
    }
    else if (build === "commercial") {
        CommercialCalc();
       
        if (ele.value > 1) {
            AmountOfElevator(); }
            if (standard.checked || premium.checked || excelium.checked) {
                ShowCalc();
                UnitPriceSelect();
                ElevatorTotalPrice();
                InstalFees();
                FinalPrice();
                formatNumbers( Number(EleUnitPrice), Number(EletotalPrice), Number(EleInstalFee), Number(EleFinalPrice)); }
    }
    else if (build === "corporate") {
        CorpoHybCalc();
        
        if (flo.value > 1 && bas.value > 1 && moc.value > 1) {
            AmountOfElevator(); }
            if (standard.checked || premium.checked || excelium.checked) {
                ShowCalc();
                UnitPriceSelect();
                ElevatorTotalPrice();
                InstalFees();
                FinalPrice();
                formatNumbers( Number(EleUnitPrice), Number(EletotalPrice), Number(EleInstalFee), Number(EleFinalPrice)); }
    }
    else if (build === "hybrid"){
        CorpoHybCalc();
        if (flo.value > 1 && bas.value > 1 && moc.value > 1) {
            AmountOfElevator(); }
            if (standard.checked || premium.checked || excelium.checked) {
                ShowCalc();
                UnitPriceSelect();
                ElevatorTotalPrice();
                InstalFees();
                FinalPrice();
                formatNumbers( Number(EleUnitPrice), Number(EletotalPrice), Number(EleInstalFee), Number(EleFinalPrice)); }
    }
    else {
        return
    }

}

function ResidentialCalc() {
    var AppRes = document.getElementById("app").value;
    var FloRes = document.getElementById("flo").value;
    Averagedoorperfloor = AppRes / FloRes;
    Elevat = Math.ceil(Averagedoorperfloor / 6);
    Columns = Math.ceil(FloRes / 20);
    NbElevator = Columns * Elevat;
    cagecom.value = NbElevator;
    return cagecom;
}




function CommercialCalc() {
    var elevator = document.getElementById("ele").value;
    cagecom.value = elevator;
    return cagecom;
}

function CorpoHybCalc() {
    var Occupants = document.getElementById("moc").value;
    var floor = document.getElementById("flo").value;
    var basement = document.getElementById("bas").value;
    var Totalfloors = Number(floor) + Number(basement);
    var TotalOccupants = Occupants * Totalfloors;
    var NbElevators = Math.floor(TotalOccupants / 1000);
    var NbElevatorsCol = Math.ceil(Totalfloors / 20);
    var NbElevatorsPerCol = Math.ceil(NbElevators / NbElevatorsCol);
    cagecom.value = NbElevatorsPerCol * NbElevatorsCol;
    return cagecom;
}
function Hidecalc() {
    if (Eleamountcalc.style.display === "block") {
        Eleamountcalc.style.display = "none";
    }
    if (Eleunitpricecalc.style.display === "block") {
        Eleunitpricecalc.style.display = "none";
    }
    if (Eletotalpricecalc.style.display === "block") {
        Eletotalpricecalc.style.display = "none";
    }
    if (Instalfeecalc.style.display === "block") {
        Instalfeecalc.style.display = "none";
    }
    if (FinalPricecalc.style.display === "block") {
        FinalPricecalc.style.display = "none";
    }
    if (Cname.style.display === "block") {
        Cname.style.display = "none";
    }
    if (Email.style.display === "block") {
        Email.style.display = "none";
    }
    else {
        return
    }   
}

function ShowCalc() {
    if (Eleamountcalc.style.display === "none") {
        Eleamountcalc.style.display = "block";
    }
    if (Eleunitpricecalc.style.display === "none") {
        Eleunitpricecalc.style.display = "block";
    }
    if (Eletotalpricecalc.style.display === "none") {
        Eletotalpricecalc.style.display = "block";
    }
    if (Instalfeecalc.style.display === "none") {
        Instalfeecalc.style.display = "block";
    }
    if (FinalPricecalc.style.display === "none") {
        FinalPricecalc.style.display = "block";
    }
    if (Cname.style.display === "none") {
        Cname.style.display = "block";
    }
    if (Email.style.display === "none") {
        Email.style.display = "block";
    }
    else {
        return 
    }
}

function UnitPriceSelect() {
    var UnitPrice = document.getElementById("unit-price")
    if (standard.checked) {
        UnitPrice.value = 7565.00; 
    }
    else if (premium.checked) {
        UnitPrice.value = 12345.00; 
    }
    else if (excelium.checked) {
        UnitPrice.value = 15400.00;
    }
}

function AmountOfElevator() {
    var Recommended = document.getElementById("cages").value;
    var ElevatorAmount = document.getElementById("ElevatorAmount");
        ElevatorAmount.value = Recommended;
        return ElevatorAmount
}

function ElevatorTotalPrice() {
    var TotalPrice = document.getElementById("total-price");
    var ElevatorAmount = document.getElementById("ElevatorAmount");
    var UnitPrice = document.getElementById("unit-price");
    TotalPrice.value = ElevatorAmount.value * UnitPrice.value; 
        return TotalPrice; 
}

function InstalFees() {
    var InstallationFees = document.getElementById("Instal-Fees")
    var ElevatorTotalPrice = document.getElementById("total-price").value
    if (standard.checked) {
        InstallationFees.value = ElevatorTotalPrice * 0.1
    }
    else if (premium.checked) {
        InstallationFees.value = ElevatorTotalPrice * 0.13
    }
    else if (excelium.checked) {
        InstallationFees.value = ElevatorTotalPrice * 0.16
    }
    else {
        return
    }
}

function FinalPrice() {
    var TotalPrice = document.getElementById("total-price").value;
    var InstalFee = document.getElementById("Instal-Fees").value;
    var FinalPrice = document.getElementById("Final-Price");
    

    FinalPrice.value = Number(TotalPrice) + Number(InstalFee);


    EleUnitPrice = document.getElementById("unit-price").value;
    EletotalPrice = document.getElementById("total-price").value;
    EleInstalFee = document.getElementById("Instal-Fees").value;
    EleFinalPrice = document.getElementById("Final-Price").value;
}

function ValReset() {
    app.value = 0;
    flo.value = 0;
    bas.value = 0;
    com.value = 0;
    par.value = 0;
    ele.value = 0;
    cor.value = 0;
    moc.value = 0;
    bus.value = 0;
    cagecom.value = 0;
    eletp.value = 0;
    InFe.value = 0;
    FinP.value = 0;
    elea.value = 0;
    eleup.value = 0;
    standard.checked = false;
    premium.checked = false;
    excelium.checked = false;
    return 

}

function formatNumbers(EleUnitPrice, EletotalPrice, EleInstalFee, EleFinalPrice) {

    var arrayOfargs = [arguments[0], arguments[1], arguments[2], arguments[3]]


    for (var j = 0; j < arrayOfargs.length; j++) {
        var number;

        switch(j) {
            case 0:
                number = EleUnitPrice
                break;
            case 1:
                number = EletotalPrice
                break;
            case 2:
                number = EleInstalFee
                break;
            case 3:
                number = EleFinalPrice
                break;
            default:
        }

        var partedPrice = number.toFixed(2).toString().split(".")

        partedPrice[0].replace(",", "")

        partedPrice[0] = partedPrice[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",")

        var priceWithoutDollarSign = partedPrice.join(".")

        var displayedPrice = `${priceWithoutDollarSign}$`

        switch(j){
            case 0:
                document.getElementById("unit-price").value = displayedPrice
                break;
            case 1:
                document.getElementById("total-price").value = displayedPrice
                break;
            case 2:
                document.getElementById("Instal-Fees").value = displayedPrice
                break;
            case 3:
                document.getElementById("Final-Price").value = displayedPrice
                break;
            default:
        }
    }
}




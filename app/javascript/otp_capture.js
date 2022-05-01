function httpGet(theUrl)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}


var count = 5; //decrement at every error
var otp="";
var api="otp_yubico?otp=";
console.log("Start of listening");
document.addEventListener("keypress", function onPress(event) {
if(event.key == "Enter") {
    //console.log(otp);
    var r = api + otp;
    var answer = (httpGet(r));
    var j = JSON.parse(answer);
    console.log(j);
    //if this returns ok, do local verification using SHA1-HMAC 
    //if SHA1-HMAC is ok, navigate to '/otp_verify'
    if(j['status'] == 'status=OK') {
        window.location.href='/uploads/index'
        //alert("Yubikey OK");
    } else {
        alert("Error with the yubikey, please try again");
    }
    otp = "";
    
    
} else {
    otp = otp.concat(event.key);
}
});
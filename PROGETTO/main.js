$(document).ready(function(){
/* funzione cambio fronte retro */

$("#retro").click(function() {
    $("#foto").animate({width: '88%', height: '68%'});
    $("#CimgC").css({"margin-left":"10%"});
    $("#CimgC").css({"margin-top":"-2%"});
});

$("#fronte").click(function() {
    $("#foto").animate({width: '80%', height: '90%'});
    $("#CimgC").css({"margin-left":"20%"});
    $("#CimgC").css({"margin-top":"4%"});
});

});

function gestoreClickFronte(){
  try{
    rotazione_img = 0;
    nodoFotoRuota = document.getElementById("foto").setAttribute("class", 'ruota0');
    nodoFotoRuota = document.getElementById("foto").style.marginTop = "0";
    nodoFoto.setAttribute("src", nodoIdF + ".jpg");
    document.getElementById("infoR").style.display = "none";
    document.getElementById("contenutiR").style.display = "none";
    document.getElementById("infoF").style.display = "block";
    k=0;
    }catch(e){
      alert("gestoreClickFronte " + e);
  }
}

function gestoreClickRetro(){
  try{
    rotazione_img = 0;
    nodoFotoRuota = document.getElementById("foto").setAttribute("class", 'ruota0');
    nodoFotoRuota = document.getElementById("foto").style.marginTop = "100px";
    nodoFoto.setAttribute("src", nodoIdR + ".jpg");
    document.getElementById("infoF").style.display = "none";
    document.getElementById("contenutiF").style.display = "none";
    document.getElementById("infoR").style.display = "block";
    k=1;
    }catch(e){
      alert("gestoreClickRetro " + e);
  }
}

function gestoreClickButInfo(){
  try{
    if(k==0){
      document.getElementById("infoF").style.display = "block";
      document.getElementById("infoR").style.display = "none";
      document.getElementById("contenutiF").style.display = "none";
      document.getElementById("contenutiR").style.display = "none";
    }else {
      document.getElementById("infoF").style.display = "none";
      document.getElementById("infoR").style.display = "block";
      document.getElementById("contenutiF").style.display = "none";
      document.getElementById("contenutiR").style.display = "none";
    }
    }catch(e){
      alert("gestoreClickButInfo " + e);
  }
}

function gestoreClickButCont(){
  try{
    if(k==0){
      document.getElementById("infoF").style.display = "none";
      document.getElementById("infoR").style.display = "none";
      document.getElementById("contenutiF").style.display = "block";
      document.getElementById("contenutiR").style.display = "none";
    }else {
      document.getElementById("infoF").style.display = "none";
      document.getElementById("infoR").style.display = "none";
      document.getElementById("contenutiF").style.display = "none";
      document.getElementById("contenutiR").style.display = "block";
    }
    }catch(e){
      alert("gestoreClickButInfo " + e);
  }
}

  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /* Get the x and y positions of the image: */
    a = img.getBoundingClientRect();
    /* Calculate the cursor's x and y coordinates, relative to the image: */
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /* Consider any page scrolling: */
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }


function gestoreClickButRuota(){
  try{
    rotazione_img += 90;
    nodoFotoRuota = document.getElementById("foto").setAttribute("class", 'ruota' + rotazione_img % 360);
    }catch(e){
      alert("gestoreClickButRuota " + e);
  }
}

var rotazione_img = 0;
var nodoFotoRuota;
var nodoDef;
var k = 0;
var nodoIdF;
var nodoIdR;
var nodoFoto;
var nodoFronte;
var nodoRetro;
var nodoButInfo;
var nodoButCont;
var nodoButRuota;

function gestoreLoad () {
  try {
    nodoDef= document.getElementById("infoF").style.display = "block";
    nodoIdF = document.getElementById("fronte").getAttribute("value");
    nodoIdR = document.getElementById("retro").getAttribute("value");
    nodoFoto = document.getElementById("foto");
    nodoFronte = document.getElementById("fronte");
    nodoRetro = document.getElementById("retro");
    nodoButInfo = document.getElementById("butInfo");
    nodoButCont = document.getElementById("butCont");
    nodoButRuota = document.getElementById("butRuota");
    nodoFotoRuota = document.getElementById("foto");
    nodoFronte.onclick = gestoreClickFronte;
    nodoRetro.onclick = gestoreClickRetro;
    nodoButInfo.onclick = gestoreClickButInfo;
    nodoButCont.onclick = gestoreClickButCont;
    nodoButRuota.onclick = gestoreClickButRuota;
  } catch ( e ) {
  alert ("gestoreLoad " + e);
  }
}
window.onload = gestoreLoad;

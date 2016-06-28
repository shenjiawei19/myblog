/**
 * Created by User on 2016/4/8.
 */
window.onload=function(){
    var edit=document.getElementById('#edit');
    var oBtn=document.getElementById('btn');
    var kg=true;
    oBtn.onclick=function(){
    if(kg){
    oSr.disabled=false;
    }else{
    oSr.disabled=true;
    }
    kg=!kg;
    }
    }

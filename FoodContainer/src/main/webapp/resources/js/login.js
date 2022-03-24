/* 자동방지입*/
var keylist="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
var temp="";

function generatepass(plength){
    temp="";
    for(i=0;i<plength;i++)
        temp+=keylist.charAt(Math.floor(Math.random()*keylist.length));
        return temp;
    
}
function populateform(enterlength){
    document.frm.output.value=generatepass(enterlength);
}

function check(){
    if(temp==document.frm.che.value){
        alert("같다");
    }else{
        alert("틀리다");
    }
}



/* */

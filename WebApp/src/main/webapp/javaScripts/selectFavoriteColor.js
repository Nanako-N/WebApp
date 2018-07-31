/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function selectFavoriteColor(me, array) {
    var mainColor = document.getElementsByName("selectedMainColorIndex");
    mainColor[0].value = me.value;
    
    var elementList = document.getElementsByName("selectBaseColor");
    var colorNames = document.getElementsByName("colorName");
    
    var num = Number(me.value);
    for (var i = 0; i < 5; i++) {
        var index = num*25+i*5;
        elementList[i].value = array[index];
        elementList[i].style = "background-color:" + array[index];
        colorNames[i].innerHTML = array[index+1];
    }
}
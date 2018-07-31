/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function selectBaseColor(me, array) {
    //好きな色選択で選んだボタンのインデックスを取得 -> 数値に変換
    var element = document.getElementsByName("selectedMainColorIndex");
    var mainIndex = Number(element[0].value);
    
    //servletに送信するパラメータにベースカラーのrgb値を設定
    var baseRGB = document.getElementsByName("selectedBaseColor");
    baseRGB[0].value = me.value;
    //同じくservletに送信するパラメータに色の名前も設定
    var baseName = document.getElementsByName("selectedBaseColorName");
    var baseIndex = Number(me.id);  //ベースカラー選択で選んだボタンのインデックス
    var index = mainIndex*25+baseIndex*5;
    baseName[0].value = array[index+1];
    
    //ベースカラーの何番目が選択されているかをパラメータに設定
    var baseColorIndex = document.getElementsByName("baseColorIndex");
    var baseNumber = mainIndex*5+baseIndex;
    baseColorIndex[0].value = String(baseNumber);
    
    var themes = document.getElementsByName("themeName");
    for(var i=0; i<3; i++) {
        themes[i].innerHTML = array[index+i+2];
    }
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    String[] bcsAndThms = (String[]) request.getAttribute("data1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Color palette</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Limelight" rel="stylesheet">
<title>Insert title here</title>
<style>
            <%--ボタンの青い枠が出力されないようにするための処理--%>
            *:focus {
                outline: none;
            }
            
            <%--使い方をアラート文で表示するためのボタン--%>
            .btn_alert{
                display: inline-block;
                text-decoration: none;
                background: #e2841a;
                color: rgba(255, 255, 255, 0.47);
                font-weight: bold;
                width: 120px;
                height: 120px;
                line-height: 120px;
                border-radius: 50%;
                text-align: center;
                vertical-align: middle;
                overflow: hidden;
                box-shadow: 0px 0px 0px 5px #e2841a;
                border: solid 2px rgba(255, 255, 255, 0.47);
                transition: .4s;
            }

            .btn_alert:hover{
                border-style: dashed;
            }

            <%--最初の色の系統を選択するためのボタンの仕様--%>
            .button {
                display: inline-block;
                width: 80px;
                height: 80px;
                line-height: 80px;
                border-radius: 50%;
                color: #fff;
                text-decoration: none;
                text-align: center;
                text-indent: -9999px;
            }
            .button:hover {
                -webkit-animation: scale .3s ease-in-out;
                animation: scale .3s ease-in-out;
            }
            @-webkit-keyframes scale {
                50% { -webkit-transform: scale(1.1); }
            }
            @keyframes scale {
                50% { transform: scale(1.1); }
            }



            @import url('https://fonts.googleapis.com/css?family=Limelight');
            <%--フォントのインポート--%>
            html,
            body {
                font-family: 'Limelight';
            }

            <%--ベースカラーの設定の際に用いるボタン--%>
            .btn {
                line-height: 50px;
                height: 50px;
                text-align: center;
                width: 700px;
                cursor: pointer;
            }

            .btn-one {
                transition: all 0.3s;
                position: relative;
            }
            .btn-one span {
                transition: all 0.3s;
            }
            .btn-one::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 1;
                opacity: 0;
                transition: all 0.3s;
                border-top-width: 1px;
                border-bottom-width: 1px;
                border-top-style: solid;
                border-bottom-style: solid;
                border-top-color: rgba(255,255,255,0.5);
                border-bottom-color: rgba(255,255,255,0.5);
                transform: scale(0.1, 1);
            }
            .btn-one:hover span {
                letter-spacing: 2px;
            }
            .btn-one:hover::before {
                opacity: 1; 
                transform: scale(1, 1); 
            }
            .btn-one::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 1;
                transition: all 0.3s;
                background-color: rgba(255,255,255,0.1);
            }
            .btn-one:hover::after {
                opacity: 0; 
                transform: scale(0.1, 1);
            }
            
            <%--3つ目のテーマ選択のボタン--%>
            .square_btn{
                position: relative;
                display: inline-block;
                font-weight: bold;
                padding: 0.25em 0;
                text-decoration: none;
                color: #A1C3E7;   
            }

            .square_btn:before{
                position: absolute;
                content: '';
                width: 100%;
                height: 4px;
                top:100%;
                left: 0;
                border-radius: 3px;
                background:#A1C3E7;
                transition: .2s;
            }

            .square_btn:hover:before {
                top: -webkit-calc(100% - 3px);
                top: calc(100% - 3px);
            }
            
            <%--テーマ選択の際の見出し--%>
            h2 {
                position: relative;
                padding-left: 1.2em;/*アイコン分のスペース*/
                line-height: 1.4;
            }

            h2:before{ font-family: "Font Awesome 5 Free";
                       content: "\f00c";/*アイコンのユニコード*/
                       position: absolute;/*絶対位置*/
                       font-size: 1em;/*サイズ*/
                       left: 5%;/*アイコンの位置*/
                       top: 0;/*アイコンの位置*/
                       color: #5ab9ff; /*アイコン色*/
            }
            
            <%--次のページへ進むためのボタンのデザイン--%>
            .button2{
                position: relative;
                display: inline-block;
                padding: .65em 4em;
                border: 2px solid #333;
                color: #333;
                text-decoration: none;
                text-align: center;
                -webkit-transition: .3s ease-in-out;
                transition: .3s ease-in-out;
            }
            .button2::after {
                position: absolute;
                top: 5px;
                left: 5px;
                z-index: -1;
                content: '';
                width: 101%;
                height: 105%;
                background-color: #F7DC8D;
                -webkit-transition: .3s ease-in-out;
                transition: .3s ease-in-out;
            }
            .button2:hover {
                color: #949495;
            }
            .button2:hover::after {
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
        </style>
        
        <script type="text/javascript">
            function ShowAlert() {
                alert("1 1番でベースカラー（基本色）の色系統を選択\n2 2番でベースカラーの決定\n3 テーマを選択して次のページにとぶと・・・？ ");
            }
        </script>
</head>

　　 <script type="text/javascript">
        DD = new Date();
        Time = DD.getHours();
    </script>
    <%
        Calendar cTime = Calendar.getInstance();
        int hour = cTime.get(Calendar.HOUR_OF_DAY);
    %>
	<% if (hour >= 4 && hour <= 10) { %>
	    <body background="background/morning.jpg">
	<%} else if (hour >= 11 && hour <= 15) {%>
	    <body background="background/afternoon.jpg">
	<%} else if (hour >= 16 && hour <= 18) {%>
	    <body background="background/evening.jpg">
	<%} else {%>
	    <body background="background/night.jpg">
	<%}%>

    <center>
        <div style="background-color:#000000 ; width:100%; border: 0px solid #000000; height:100％; padding-left:10px; padding-right:10px; padding-top:10px; padding-bottom:10px;position: absolute; top: 0%;">
            <font size="50" color="#F9F8F7">Color palette</font>
            <br>
            <font size="5"color="#F9F8F7">-What's your favorite color?-</font>
        </div>
    </center>
    <br><br><br><br><br><br><br><br>
    
    <%--好きな色選択--%>
    &ensp;&ensp;&ensp;&ensp;<font size="20" color="#E1DBEC">1&ensp;Which color do you like?</font>
    <%
        int[] xPos = {240, 290, 370, 500, 630, 710, 760};
        int[] yPos = {500, 410, 330, 290, 330, 410, 500};
        String[] types = {"#67BE8D", "#FFA500", "#FF0000", "#FF00FF", "#0000FF", "#814336", "#808080"};
    %>

    <script>
        //ベースカラー一覧(java配列) -> scriptで使える配列に変換
        var array = [<% for (int i = 0; i < bcsAndThms.length; i++) {
                if (i != 0) {
                    out.print(",");
                }
                out.print("'" + bcsAndThms[i] + "'");
            }
        %>];
    </script>
    
    <% for (int i = 0; i < 7; i++) {%>
    <input type="submit" class="button" value="<%= String.valueOf(i)%>"
           style="background-color:<%= types[i]%> ;position: absolute; left: <%= xPos[i]%>px; top: <%= yPos[i]%>px;"
           onclick="selectFavoriteColor(this, array)">
    <% } %>
    <input type="hidden" value="" name="selectedMainColorIndex">
    <br><br><br>
    
    <%--使い方のアラート文を表示させるボタン--%>
    <a class="btn_alert" href="javascript:void(0)" onclick="ShowAlert();" style="position: absolute; right:10%; top: 120px;">How to...?</a>
    <br><br><br><br><br><br>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    <%--ベースカラー選択--%>

    &ensp;&ensp;&ensp;&ensp;<font size="20" color="#E1DBEC">2&ensp;BaseColor Select</font><br><br>
    <center>
        <% String defaultBaseColor = "#dcdcdc";%>
        <% for (int i = 0; i < 5; i++) {%>
        <div class="box-1">
            <div input type="radio" class="btn btn-one" value="#FF0000" id="<%= String.valueOf(i)%>"
                 name="selectBaseColor" style="background-color:<%= defaultBaseColor%>"
                 onclick="selectBaseColor(this, array)">
                <span name="colorName">?</span>
            </div>
        </div>
        <% }%>
    </center>
    <br><br><br><br>
    
    &ensp;&ensp;&ensp;&ensp;<font size="20" color="#E1DBEC">3&ensp;Theme</font><br>
    
<form action="/MainServlet" method="post">
		&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="radio" value="0" name="theme"><font size="6" name="themeName">...</font><br>
		&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="radio" value="1" name="theme"><font size="6" name="themeName">...</font><br>
		&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="radio" value="2" name="theme"><font size="6" name="themeName">...</font><br>
		<br><br>
		
		<input type="hidden" value="" name="selectedBaseColor">
		<input type="hidden" value="" name="selectedBaseColorName">
		<input type="hidden" value="" name="baseColorIndex">

        <%--次のページへ進むためのボタン--%>
        <center>
            <input type="submit" class="button2" id="goMain" name="color" value="Palette is...">
        </center>
</form>
<script type="text/javascript" src="javaScripts/selectFavoriteColor.js"></script>
    <script type="text/javascript" src="javaScripts/selectBaseColor.js"></script>
</body>
</html>
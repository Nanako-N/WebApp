<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.ColorPalette"%>
<%@page import="java.util.*"%>
<%
	//カラーパレットを取得
	ColorPalette colorPalette = (ColorPalette) request.getAttribute("colorPalette");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Limelight" rel="stylesheet">
<title>Color palette</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Limelight');
            <%--フォントのインポート--%>
            html,
            body {
                font-family: 'Limelight';
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

            <%--半円のCSS--%>
            .half-circle-lo {
                margin: 40px 0;
                margin: 2.5rem 0;
            }
            .half-circle-mod {

                height:200px;
                width: 400px;
                behavior: url(/PIE.htc);
            }
            .half-circle-lo__half-circle-mod {
                -moz-border-radius: 200px 200px 0 0;
                -webkit-border-radius: 200px 200px 0 0;
                -o-border-radius: 200px 200px 0 0;
                -ms-border-radius: 200px 200px 0 0;
                border-radius: 200px 200px 0 0;
            }
            
            <%--Topに戻るためのボタンのデザイン--%>
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
                alert("＊図の見方＊\n背景色・・・ベースカラー（基本色）\n四分円・・・アソートカラー\n（配色に変化をつけたい時にベースの次に大きな面積で使うとgood!）\n半円・・・アクセントカラー（引き締め役の色）");
            }
        </script>
</head>
    <%
	    //背景決定用に時間取得
		Calendar cTime = Calendar.getInstance();
		int hour = cTime.get(Calendar.HOUR_OF_DAY);
	%>
    <%--背景色の決定--%>
	<%if (hour >= 4 && hour <= 10) { %>
	    <body background="background/morning.jpg">
	<%} else if (hour >= 11 && hour <= 15) {%>
	    <body background="background/afternoon.jpg">
	<%} else if (hour >= 16 && hour <= 18) {%>
	    <body background="background/evening.jpg">
	<%} else {%>
	    <body background="background/night.jpg">
	<%}%>
	
	<%--使い方のアラート文を表示させるボタン--%>
    <a class="btn_alert" href="javascript:void(0)" onclick="ShowAlert();"
    style="position: absolute; right:5%; top: 120px;">How to...?</a>
    
    <center>
        <div style="background-color:#000000 ; width:100%; border: 0px solid #000000; height:100％; padding-left:10px; padding-right:10px; padding-top:10px; padding-bottom:10px;position: absolute; top: 0%;">
            <font class="theme" size="50" color="#F9F8F7">Color palette</font>
            <br>
            <font class="theme" size="5"color="#F9F8F7">-What's your favorite color?-</font>
        </div>
    </center>
    <br><br><br><br><br><br>
    
    <%--出力結果--%>
    &ensp;&ensp;&ensp;&ensp;<font size="20" color="#E1DBEC">&ensp;Today's your color is ・・・</font>
    <center>
        <%--出力結果の背景の角が丸い四角--%>  
        <br><br>                   <%--↓ここの色を他のクラスから渡す--%>
        <div style="background-color: <%= colorPalette.getBaseColor() %>; border-radius: 10px;padding: 50px;height: 400px;width:700px"></div>
    </center>
    <%--アソートカラーの四分円--%>
    <div style="background-color: <%= colorPalette.getAssortColor() %>; border-top-left-radius:400px ;border-bottom-right-radius:10px; font-size: 20px; padding: 20px;height: 365px;width:365px;position: absolute; left: 561px; top: 335px">
    </div>
    <%--アクセントカラーの半円--%>
    <div class="Codetank-20160816 Codetank__source">
        <div class="half-circle-lo">                                                              <%--↓ここの色を他のクラスから渡す--%>
            <div class="half-circle-lo__half-circle-mod  half-circle-mod" style="background-color: <%= colorPalette.getAccentColor() %>;position: absolute; left:169px; top: 540px"></div>
        </div>
    </div>
    
    <%--色の説明--%>        
    <br><br>
    <font size="6" Color="#E1DBEC" style="position: absolute;  top: 800px">
    &ensp;&ensp;Base Color: <%= colorPalette.getBaseName() %><br><br>
    &ensp;&ensp;Assort Color: <%= colorPalette.getAssortName() %><br><br>
    &ensp;&ensp;Accent Color: <%= colorPalette.getAccentName() %><br><br>
    </font>
    
    <%--Topに戻るボタン--%>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    <center>
    <a href="#" class="button2">↑Top</a>
    </center>
</body>
</html>
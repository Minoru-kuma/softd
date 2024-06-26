<%-- 
    Document   : storeMap
    Created on : 2024/01/25, 10:28:34
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>住所の表示</title>
        <!-- Google Maps APIを読み込む -->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCum_9V4uwOC2mP5Hh4YM6_RYUO2a7cRTY"></script>
        <script type="text/javascript" src="maps.js"></script>

    </head>
    <body onload="initialize()">
        <header>
            <h1>店の住所の表示</h1>
        </header>
        <article>
            <div id="map_canvas" style="float:right; width:500px; height: 300px"></div>           

        </article>
    </body>
</html>

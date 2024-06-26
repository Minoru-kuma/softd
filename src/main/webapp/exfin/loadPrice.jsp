<%-- 
    Document   : loadPrice
    Created on : 2024/01/22, 17:50:05
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="price" scope="session" class="exfinal.PriceDB"/>
<!DOCTYPE html>
<% /* エンコード */



 /* データ一覧の取得メソッド */
    try {

        price.dataload();

%>

<jsp:forward page="priceList.jsp" />

<%} catch (Exception e) {
    e.printStackTrace();
%>



<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>エラーの表示</title>

    </head>

    <body>

        <header>

            <h1>エラーの表示</h1>

        </header>

        <article>

            データベースに接続できませんでした。

        </article>

    </body>

</html>



<%  }

%>

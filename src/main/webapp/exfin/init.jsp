<%-- 
    Document   : init
    Created on : 2024/01/19, 12:59:03
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="product" scope="session" class="exfinal.ProductDB" />
<jsp:useBean id="store" scope="session" class="exfinal.StoreDB" />



<% /* エンコード */



 /* データ一覧の取得メソッド */
    try {

        product.dataload();
        store.dataload();

%>

<jsp:forward page="mainPage.jsp" />

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



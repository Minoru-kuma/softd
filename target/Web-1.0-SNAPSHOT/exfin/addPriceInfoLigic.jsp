<%-- 
    Document   : addPriceInfoLigic
    Created on : 2024/01/22, 17:27:07
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="price" scope="session" class="exfinal.PriceDB"/>
<% /* エンコード */

    request.setCharacterEncoding("UTF-8");

    /* 変数の宣言　*/
    int storeid = 0;
    int productid = 0;
    int itemprice = 0;

    /* パラメータの取得 */
    if (request.getParameter("storeid") != null) {
        storeid = Integer.parseInt(request.getParameter("storeid"));
    }
    if (request.getParameter("productid") != null) {
        productid = Integer.parseInt(request.getParameter("productid"));
    }
    if (request.getParameter("price") != null) {
        itemprice = Integer.parseInt(request.getParameter("price"));
    }


    /* データ一覧の取得メソッド */
    try {
        price.insert(productid,storeid,itemprice);

%>
<jsp:forward page="loadPrice.jsp" />
<%} catch (Exception e) {
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

<%
    }
%>

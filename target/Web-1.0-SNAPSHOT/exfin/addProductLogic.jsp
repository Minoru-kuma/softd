<%-- 
    Document   : addProductLogic
    Created on : 2024/01/23, 15:06:57
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="product" scope="session" class="exfinal.ProductDB" />
<% /* エンコード */

    request.setCharacterEncoding("UTF-8");

    /* 変数の宣言　*/
    String itemname = "";
    String maker = "";

    /* パラメータの取得 */
    if (request.getParameter("itemname") != null) {
        itemname = request.getParameter("itemname");
    }
    if (request.getParameter("maker") != null) {
        maker = request.getParameter("maker");
    }


    /* データ一覧の取得メソッド */
    try {
        product.insert(itemname,maker);

%>
<jsp:forward page="init.jsp" />
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

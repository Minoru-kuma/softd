<%-- 
    Document   : roadMapInfo
    Created on : 2024/01/25, 10:24:04
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="store" scope="session" class="exfinal.StoreDB" />

<% /* エンコード */

    request.setCharacterEncoding("UTF-8");

    /* 変数の宣言　*/
    int id = 0;

    /* パラメータの取得 */
    if (request.getParameter("storeid") != null) {
        id = Integer.parseInt(request.getParameter("storeid"));
    }

    /* データ一覧の取得メソッド */
    try {
        store.getName(id);
%>
<jsp:forward page="3.jsp" />
<%
} catch (Exception e) {
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
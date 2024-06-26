<%-- 
    Document   : addStoreLogic
    Created on : 2024/01/23, 15:07:07
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="store" scope="session" class="exfinal.StoreDB" />
<!DOCTYPE html>
<% /* エンコード */

    request.setCharacterEncoding("UTF-8");

    /* 変数の宣言　*/
    String storename = "";
    String maker = "";
    int tel = 0;

    /* パラメータの取得 */
    if (request.getParameter("storename") != null) {
        storename = request.getParameter("storename");
    }
    if (request.getParameter("address") != null) {
        maker = request.getParameter("address");
    }
    


    /* データ一覧の取得メソッド */
    try {
        store.insert(storename, maker);

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

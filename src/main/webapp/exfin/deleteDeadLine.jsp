<%-- 
    Document   : addDeadlineLogic
    Created on : 2024/01/23, 15:06:39
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.Date"%>
<jsp:useBean id="deadline" scope="session" class="exfinal.DeadlineDB"/>"

<% /* エンコード */
    

    request.setCharacterEncoding("UTF-8");

    /* 変数の宣言　*/
    int deadline_id = 0;
    

    /* パラメータの取得 */  
    if (request.getParameter("ID"
    + "") != null) {
        deadline_id = Integer.parseInt(request.getParameter("ID"));
    }
    

    /* データ一覧の取得メソッド */
    try {
        deadline.delete(deadline_id);

%>
<jsp:forward page="loadDeadline.jsp" />
<!DOCTYPE html>
<%} catch (Exception e) {
%>
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

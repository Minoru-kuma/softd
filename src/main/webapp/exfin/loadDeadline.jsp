<%-- 
    Document   : loadDeadline
    Created on : 2024/01/23, 15:03:09
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="deadline" scope="session" class="exfinal.DeadlineDB"/>"
<!DOCTYPE html>
<%
    try {

        deadline.dataload();
%>
<jsp:forward page="deadlineList.jsp" />
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
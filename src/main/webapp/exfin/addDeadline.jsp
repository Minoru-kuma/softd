<%-- 
    Document   : adddeadline
    Created on : 2024/01/19, 12:59:18
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="product" scope="session" class="exfinal.ProductDB" />
//商品の情報の取得
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>消費期限登録</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>消費期限を登録する</h1>
        <article>
            <table class="gdesign" border = 1>
                <tr>
                    <th>ID</th>
                    <th>商品名</th>
                    <th>製造メーカー</th>
                </tr>
                <% for (int i = 0; i < product.getNum(); i++) {%>

                <tr>
                    <td><%= product.getId(i)%></td>
                    <td><%= product.getName(i)%></td>
                    <td><%= product.getMaker(i)%></td>
                </tr>

                <% }%>
            </table>      

        </article>
        <form action="addDeadlineLogic.jsp" method="post">

            <div>
                <p class="input_box">
                    製品ID：
                    <input type="text" name="productid" value="" size="30" />
                </p>
                <p class="input_box">
                    消費期限：
                    <input type="date" name="deadline" value="" size="30" />
                </p>
            </div>
            <br/>
              <c:out value="This is a JSTL log.">/
            <input class="btn" type="submit" value="登録する"/>
          
        </form>
        <a href="init.jsp" class="btn_back">戻る</a>
    </body>
</html>

<%-- 
    Document   : deadlineList
    Created on : 2024/01/19, 13:00:44
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="deadline" scope="session" class="exfinal.DeadlineDB"/>
<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>消費期限確認</title>
        <link rel="stylesheet" href="style.css"/>

    </head>

    <body>

        <header>

            <h1>消費期限を確認する</h1>

        </header>

        <article>

           

            <table class=gdesign border="1">

                <tr>
                    <th>ID</th>
                    <th>商品名</th>
                    <th>製造元</th>
                    <th>消費期限</th>
                </tr>

                <% for (int i = 0; i < deadline.getNum(); i++) {%>

                <tr>
                    <td><%= deadline.getId(i)%></td>
                    <td><%= deadline.getName(i)%></td> 
                    <td><%= deadline.getMaker(i)%></td>
                    <td><%= deadline.getDeadline(i)%></td>
                </tr>

                <% }%>

            </table>
                
                
        


                
        </article>
                <br/>
         
         <a href="addDeadline.jsp" class="btn">追加する</a>
         <a href="init.jsp" class="btn_back">戻る</a>
         <br/>
         <form action="deleteDeadLine.jsp" method="post">

            <div>
                <p class="input_box">
                    ID
                    <input type="text" name="ID" value="" size="30" />
                </p>
            </div>            
            <input class="btn" type="submit" value="削除する"/>
          
        </form>
    </body>

</html>


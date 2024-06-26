<%-- 
    Document   : priceList
    Created on : 2024/01/19, 13:00:28
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="price" scope="session" class="exfinal.PriceDB" />



<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>製品価格</title>
        <link rel="stylesheet" href="style.css"/>

    </head>

    <body>

        <header>

            <h1>価格情報を確認する</h1>

        </header>

        <article>

            <div class="infowindow">データ件数：<%= price.getNum()%></div>

            <table class="gdesign" border="1">

                <tr>
                    <th>商品名</th>
                    <th>販売店</th>
                    <th>製造元</th>
                    <th>価格</th>
                    <th>追加日</th>
                </tr>

                <% for (int i = 0; i < price.getNum(); i++) {%>

                <tr>
                    <td><%= price.getName(i)%></td> 
                    <td><%= price.getStoreName(i)%></td>
                    <td><%= price.getMaker(i)%></td>
                    <td><%= price.getPrice(i)%> 円</td>
                    <td><%= price.getDate(i)%></td>
                </tr>

                <% }%>

            </table>
                
                
        


                
        </article>
                <br/>
         
         <a href="addPriceInfo.jsp" class="btn">追加する</a>
         <a href="init.jsp" class="btn_back">戻る</a>
    </body>

</html>

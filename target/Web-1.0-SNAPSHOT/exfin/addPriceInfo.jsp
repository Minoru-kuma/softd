<%-- 
    Document   : addPriceInfo
    Created on : 2024/01/19, 12:59:32
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="product" scope="session" class="exfinal.ProductDB" />
<jsp:useBean id="store" scope="session" class="exfinal.StoreDB" />
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>価格登録</title>
        <link rel="stylesheet" href="style.css"/>

    </head>

    <body>

        <header>

            <h1>価格を登録する</h1>

        </header>

        <article>

            <table  border ="0">
                <tr>
                    <th>店舗</th>
                    <th>商品</th>
                </tr>
                <tr>
                    <td>
                        <table class="gdesign" border = 1>
                            <tr>
                                <th>ID</th>
                                <th>店舗名</th>
                            </tr>
                            <% for (int i = 0; i < store.getNum(); i++) {%>

                            <tr>
                                <td><%= store.getId(i)%></td>
                                <td><%= store.getName(i)%></td>
                            </tr>

                            <% }%>
                        </table>
                    </td>
                    <td>
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
                    </td>
                </tr>
            </table>    
        </table>
        <form action="addPriceInfoLigic.jsp" method="post">

            <div>
                <p class="input_box">
                    店舗ID：
                    <input type="text" name="storeid" value="" size="30" />
                </p>
                <p class="input_box">
                    製品ID：
                    <input type="text" name="productid" value="" size="30" />
                </p>
                <p id="input_box">
                    価格：半角数字
                    <input type="text" name="price" value="" size="30">
                </p>
            </div>
            <br/>
            <input class="btn" type="submit" value="登録する"/>
        </form>
        
        <a href="priceList.jsp" class="btn_back">戻る</a>
    </article>
</body>
</html>

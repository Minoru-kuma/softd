<%-- 
    Document   : mainPage
    Created on : 2024/01/19, 13:00:11
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="product" scope="session" class="exfinal.ProductDB" />
<jsp:useBean id="store" scope="session" class="exfinal.StoreDB" />
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>メインページ</title>
        <link rel="stylesheet" href="style.css"/>

    </head>

    <body>

        <header>

            <h1 id="maintitle">メインページ</h1>

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
                                <th>住所</th>
                            </tr>
                            <% for (int i = 0; i < store.getNum(); i++) {%>

                            <tr>
                                <td><%= store.getId(i)%></td>
                                <td><%= store.getName(i)%></td>
                                <td><%= store.getAddress(i)%></td>
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
        <br/>
        <a href="loadPrice.jsp" class="btn">価格確認</a>
        <a href="loadDeadline.jsp" class="btn">消費期限確認</a>
        <a href="addProduct.jsp" class="btn">商品追加</a>
        <a href="addStore.jsp" class="btn">店舗追加</a>
        <br/> 
        


    </article>

</body>

</html>


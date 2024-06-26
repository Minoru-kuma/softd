<%-- 
    Document   : addProduct
    Created on : 2024/01/22, 16:44:20
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品追加</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>商品追加</h1>
        <form action="addProductLogic.jsp" method="post">

            <div>
                <p class="input_box">
                    製品名：
                    <input type="text" name="itemname" value="" size="30" />
                </p>
                <p class="input_box">
                    製造元：
                    <input type="text" name="maker" value="" size="30" />
                </p>
            </div>
            <br/>
              <c:out value="This is a JSTL log.">
            <input class="btn" type="submit" value="登録する"/>
          
        </form>
        <a href="init.jsp" class="btn_back">戻る</a>
    </body>
</html>

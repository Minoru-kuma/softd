<%-- 
    Document   : addStore
    Created on : 2024/01/22, 16:44:08
    Author     : minor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>店舗追加</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>店舗追加</h1>
        <form action="addStoreLogic.jsp" method="post">

            <div>
                <p class="input_box">
                    店名：
                    <input type="text" name="storename" value="" size="30" />
                </p>
                <p class="input_box">
                    住所：
                    <input type="text" name="address" value="" size="30" />
                </p>
            </div>
            <br/>
            <input class="btn" type="submit" value="登録する"/>
          
        </form>
        <a href="init.jsp" class="btn_back">戻る</a>
    </body>
</html>

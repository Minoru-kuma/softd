package exfinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author minor
 */
public class PriceDB {
    protected int id[] = new int[100];//製品No.
    protected int price[] = new int[100];//価格
    protected String store_name[] = new String[100];
    protected String name[] = new String[100];//製品名
    protected String maker[] = new String[100];//製造元
    protected Date insertdate[] = new Date[100];//追加日
    protected int num;//データ取得件数
    
    /*
        以下メソッド：ここではデータベースからデータの取得を行う
    */
    
    /* 2.1 データベースからのデータ取得メソッド */
    public void dataload() throws Exception { //エラー処理が必要にする

        /* 2.1.1 データベースに接続 */
        num = 0; //取得件数の初期化

        Class.forName("com.mysql.jdbc.Driver").newInstance(); //com.mysql.jdbc.Driverはドライバのクラス名

        String url = "jdbc:mysql://localhost/exam?characterEncoding=UTF-8"; //データベース名：文字エンコードはUTF-8

        Connection conn = DriverManager.getConnection(url, "softd", "softd"); //上記URL設定でユーザ名とパスワードを使って接続

        /* 2.1.2 SELECT文の実行 */ 
        String sql = "select price_id,store_name,name,maker,itemprice,created FROM (select price_id,store_id,product.name,product.maker,itemprice,created from price_info left join product on price_info.product_id = product.product_id) as priceinfo left join store on priceinfo.store_id = store.store_id;"; //SQL文の設定 ?などパラメータが必要がない場合は通常のStatementを利用

        PreparedStatement stmt = conn.prepareStatement(sql); //JDBCのステートメント（SQL文）の作成


        stmt.setMaxRows(100); //最大の数を制限

        ResultSet rs = stmt.executeQuery(); //ステートメントを実行しリザルトセットに代入

        /* 2.1.3 結果の取り出しと表示 */
        while (rs.next()) { //リザルトセットを1行進める．ない場合は終了

            this.id[num] = rs.getInt("price_id");
            
            this.store_name[num] = rs.getString("store_name");
            
            this.price[num] = rs.getInt("itemprice");
            
            this.name[num] = rs.getString("name");
            
            this.maker[num]=rs.getString("maker");     
            
            this.insertdate[num] = rs.getDate("created");

            num++;

        }

        /* 2.1.4 データベースからの切断 */
        rs.close(); //開いた順に閉じる

        stmt.close();

        conn.close();

    }
    
    public int insert(int product_id, int store_id, int price) {

        int count = 0; //登録件数のカウント

        try {

            /* 2.2.1 データベースに接続 */
            Class.forName("com.mysql.jdbc.Driver").newInstance(); // SELECTの時と同じ

            String url = "jdbc:mysql://localhost/exam?characterEncoding=UTF-8";

            Connection conn = DriverManager.getConnection(url, "softd", "softd");

            /* 2.2.2 INSERT文の実行 */
                String sql = "INSERT INTO price_info (product_id,store_id,itemprice) VALUES (?,?,?)"; //SQL文の設定 INSERTはパラメータが必要なことが多い

            PreparedStatement stmt = conn.prepareStatement(sql); //JDBCのステートメント（SQL文）の作成

            stmt.setInt(1, product_id); //1つ目の？に引数をセットする
            stmt.setInt(2, store_id);
            stmt.setInt(3,price);

            /* 2.2.3 実行（UpdateやDeleteも同じメソッドを使う） */
            count = stmt.executeUpdate();

            /* 2.2.4 データベースからの切断 */
            stmt.close();

            conn.close();

            return count;

        } catch (Exception e) {

            return -1;

        }

    }

    public int getId(int i) {
        if (i >= 0 && num > i) {

            return id[i];

        } else {

            return 0;

        }
    }
    
    public int getPrice(int i){
        if(i >= 0 && num > i){
            return price[i];
        }
        else{
            return 0;
        }
    }
    
    public String getStoreName(int i){
        if (i >= 0 && num > i) {

            return store_name[i];

        } else {

            return null;

        }
    }
    
    public String getName(int i) {
        if (i >= 0 && num > i) {

            return name[i];

        } else {

            return null;

        }
    }

    public String getMaker(int i) {
       if (i >= 0 && num > i) {

            return maker[i];

        } else {

            return null;

        }
    }
    
    public Date getDate(int i){
        if(i >= 0 && num > i){
            return insertdate[i];
        }
        else{
            return null;
        }
    }

    public int getNum() {
        return num;
    }
}   

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exfinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

/**
 *
 * @author minor
 */
public class DeadlineDB {

    protected int id[] = new int[100];//製品No.
    protected String name[] = new String[100];//製品名
    protected String maker[] = new String[100];//製造元
    protected Date deadline[] = new Date[100];//追加日
    protected int num;//データ取得件数

    public void dataload() throws Exception { //エラー処理が必要にする

        /* 2.1.1 データベースに接続 */
        num = 0; //取得件数の初期化

        Class.forName("com.mysql.jdbc.Driver").newInstance(); //com.mysql.jdbc.Driverはドライバのクラス名

        String url = "jdbc:mysql://localhost/exam?characterEncoding=UTF-8"; //データベース名：文字エンコードはUTF-8

        Connection conn = DriverManager.getConnection(url, "softd", "softd"); //上記URL設定でユーザ名とパスワードを使って接続

        /* 2.1.2 SELECT文の実行 */
        String sql = "SELECT deadline_id,name,maker,deadline from deadline left join product on deadline.product_id = product.product_id;"; //SQL文の設定 ?などパラメータが必要がない場合は通常のStatementを利用

        PreparedStatement stmt = conn.prepareStatement(sql); //JDBCのステートメント（SQL文）の作成

        stmt.setMaxRows(100); //最大の数を制限

        ResultSet rs = stmt.executeQuery(); //ステートメントを実行しリザルトセットに代入

        /* 2.1.3 結果の取り出しと表示 */
        while (rs.next()) { //リザルトセットを1行進める．ない場合は終了

            this.id[num] = rs.getInt("deadline_id");

            this.name[num] = rs.getString("name");

            this.maker[num] = rs.getString("maker");

            this.deadline[num] = rs.getDate("deadline");

            num++;

        }

        /* 2.1.4 データベースからの切断 */
        rs.close(); //開いた順に閉じる

        stmt.close();

        conn.close();

    }
    public int insert(int product_id, Date deadline) {

        int count = 0; //登録件数のカウント

        try {

            /* 2.2.1 データベースに接続 */
            Class.forName("com.mysql.jdbc.Driver").newInstance(); // SELECTの時と同じ

            String url = "jdbc:mysql://localhost/exam?characterEncoding=UTF-8";

            Connection conn = DriverManager.getConnection(url, "softd", "softd");

            /* 2.2.2 INSERT文の実行 */
                String sql = "insert into deadline(product_id, deadline) VALUES (?,?)"; //SQL文の設定 INSERTはパラメータが必要なことが多い

            PreparedStatement stmt = conn.prepareStatement(sql); //JDBCのステートメント（SQL文）の作成

            stmt.setInt(1, product_id); //1つ目の？に引数をセットする
            stmt.setDate(2, deadline);

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
    public int delete(int id){
         int count = 0; //登録件数のカウント

        try {

            /* 2.2.1 データベースに接続 */
            Class.forName("com.mysql.jdbc.Driver").newInstance(); // SELECTの時と同じ

            String url = "jdbc:mysql://localhost/exam?characterEncoding=UTF-8";

            Connection conn = DriverManager.getConnection(url, "softd", "softd");

            /* 2.2.2 INSERT文の実行 */
                String sql = "delete from deadline where deadline_id = ?"; //SQL文の設定 INSERTはパラメータが必要なことが多い

            PreparedStatement stmt = conn.prepareStatement(sql); //JDBCのステートメント（SQL文）の作成

            stmt.setInt(1, id); 

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
    
    public java.util.Date getDeadline(int i){
        if(i >= 0 && num > i){
            return deadline[i];
        }
        else{
            return null;
        }
    }

    public int getNum() {
        return num;
    }
}   



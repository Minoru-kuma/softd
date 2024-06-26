/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exfinal;

import com.ibm.icu.text.Transliterator;
import exfinal.PriceDB;
import exfinal.StoreDB;

/**
 *
 * @author minor
 */
public class main {

    public static void main(String[] args) {
        //input→かな文字はいったん見送り（原則以下トランスレータ使用の元全角カナに変換してから検索を行う予定）
        //しかし、誤検知増加が予想されるため要検討必須（3段階の分割のまま検索が必要になるかも・・・）

// オブジェクトの生成
        //PriceDB test = new PriceDB();
        StoreDB test = new StoreDB();
        try {
            test.insert("前潟","盛岡市前潟");
            
        } catch (Exception e) {
            System.out.println("例外発生：" + e.getMessage());
        }

// データロードメソッドを実行する
        try {
            test.dataload();
        } catch (Exception e) {
            System.out.println("例外発生：" + e.getMessage());
        }

// プリントアウトする
        for (int i = 0; i < test.getNum(); i++) {
            System.out.printf("id:%d,store:%s\n", test.getId(i),test.getName(i));
        }
        if (test.getNum() == 0) {
            System.out.println("データ無し（POPUP処理追加予定）");
        }
        /*
        for (int i = 0; i < test.getNum(); i++) {
            System.out.printf("id:%d,maker:%s,name:%s,price:%d,date:%s\n", test.getId(i), test.getMaker(i), test.getName(i), test.getPrice(i), test.getDate(i));
        }
        if (test.getNum() == 0) {
            System.out.println("データ無し（POPUP処理追加予定）");
        }
         */
    }
}

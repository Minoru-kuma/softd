/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

var geocoder;
var geocoder;
var map;
function initialize() {
//ジオコーダー（住所→経度緯度）を行うオブジェクトのインスタンス化
    geocoder = new google.maps.Geocoder();
//中心座標の経度・緯度の指定（岩手県立大学の座標）
    var latlng = new google.maps.LatLng(39.8012332, 141.1376046);
// optでは主に下記３つを指定し，Mapクラスのインスタンス作成の2番目の引数に指定する
    var opts = {
        zoom: 10, //倍率の指定（小さいほど広域）
        center: latlng, //中心座標
        mapTypeId: google.maps.MapTypeId.ROADMAP // 市街地図（ROADMAP）
    };
//地図オブジェクトの（Mapクラスのインスタンス）作成
    map = new google.maps.Map(document.getElementById("map_canvas"), opts);
//下記にある経度緯度変換関数の実行
    codeAddress();
}

function codeAddress() {
//<td>タグの要素「address0」のHTMLを取得
    var address = document.getElementById("address0").innerHTML;
// geocodeリクエストを実行。第1引数はGeocoderRequest。
// 住所をaddressプロパティに入れる。第２引数はコールバック関数。
    if (geocoder) {
        geocoder.geocode({'address': address, 'region': 'jp'},
                function (results, status) {
//コールバック関数で正常に値を取得している場合
                    if (status == google.maps.GeocoderStatus.OK) {
//取得した経度緯度の一番目の場所を地図の中心のセット
                        map.setCenter(results[0].geometry.location);
//表示範囲の設定オブジェクト
                        var bounds = new google.maps.LatLngBounds();
//複数検索された場合に対応
                        for (var r in results) {
                            if (results[r].geometry) {
                                var latlng = results[r].geometry.location;
//検索結果がすべて表示されるように表示を設定
                                bounds.extend(latlng);
//マーカーの設置
                                new google.maps.Marker({
                                    position: latlng, map: map
                                });
//HTMLへ緯度と経度を書き込み
                                document.getElementById('id_ido').innerHTML = latlng.lat();
                                document.getElementById('id_keido').innerHTML = latlng.lng();
                            }
                        }
//表示範囲を調整
                        map.fitBounds(bounds);
                    } else {
                        alert("Geocode 取得に失敗しました: " + status);
                    }
                });
    }
}
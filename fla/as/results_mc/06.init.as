// ================================================
//
//　　[変数初期化] フレーム番号:26
//
// ================================================
//
nextn = 0;
prevn = 0;
setProperty("_original",_visible,false);
loaded = 0;
success = 1;
error = "";
_visible = true;
//既に表示されている結果を削除
tmphit = hit;
for (i=0; i<tmphit; i++) eval("nm" add i) = "";
hit = 0;
gotoAndStop("default");
trace(1);
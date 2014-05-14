// ================================================
//
//　　[読み込み中] フレーム番号:21/23
//
// ================================================
//
if(results_mc.loaded == 1) {
	fscommand2("StartVibrate", 50, 10, 2);
	gotoAndStop(results_mc.success == 1? "list" : "error");
} else if(_currentframe == 23) {
	gotoAndPlay("loading");
}

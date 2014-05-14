// ================================================
//
//　　[初期設定] フレーム番号:1
//
// ================================================
//
_focusrect = false;
fscommand2("SetQuality", "high");
fscommand2("FullScreen", false);
//
//local時刻取得
//
localhour = fscommand2("GetTimeHours");
if(localhour >= 18 || localhour <= 2 ) {
	header_mc.frm = "dinner";
} else if(localhour >= 11 && localhour <= 14) {
	header_mc.frm = "lunch";
} else {
	header_mc.frm = "default";
}
tellTarget("results_mc") gotoAndStop("init");
tellTarget("header_mc") gotoAndStop(frm);
gotoAndStop("map");
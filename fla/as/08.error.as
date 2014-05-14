// ================================================
//
//　　[エラー表示] フレーム番号:41
//
// ================================================
//
stop();
tellTarget("header_mc/badge") {
	text = "";
	gotoAndStop(1);
}
errormsg = length(results_mc.error) > 0 ? results_mc.error : "エラー";
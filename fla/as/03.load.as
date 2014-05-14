// ================================================
//
//　　[リクエスト初期化] フレーム番号:16
//
// ================================================
//
stop();
_mode = "result";
tellTarget("header_mc/badge") {
	text = "";
	gotoAndStop(1);
}
//
if(gnr eq "all") gnr = "";
requri = "./proxy.php?x=" add xpos add "&y=" add ypos add "&gr=" add gnr add "&z=4&p=" add results_mc.page add "&";
switch(header_mc.frm) {
	case "dinner": requri = requri add "mml=1&"; break;
	case "lunch": requri = requri add "lnc=1&"; break;
}
//requri = "sample.txt";
loadVariables(requri, "results_mc");
gotoAndPlay("loading");
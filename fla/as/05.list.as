// ================================================
//
//　　[リスト初期化] フレーム番号:26
//
// ================================================
//
stop();
//既に表示されている結果を削除
if(results_mc.tmphit) {
	for (i=0; i<results_mc.tmphit; i++) {
		removeMovieClip("/results_mc/btn" add i);
	}
}
//デフォルトのY座標を取得
if (!results_mc.default_y) {
	results_mc.default_y = getProperty("/results_mc",_y);
}
//Y座標を初期化
setProperty("/results_mc",_y,results_mc.default_y);
//
//一覧を作成
tgy = 0;
hit = results_mc.hit;
if(results_mc.total>0 && _mode eq "result") {
	header_mc.badge.text = results_mc.total add "件\nあるよ";
	tellTarget("header_mc/badge") gotoAndPlay(1);
}
master = "/results_mc/_original";
for (i=0; i<hit; i++) {
	strn = "btn" add i;
	path = "/results_mc/" add strn;
	duplicateMovieClip(master, strn, hit+10-i);
	setProperty(path,_visible,true);
	setProperty(path,_y,tgy);
	//
	tellTarget(path) { stop(); }
	eval(path).n = i;
	//表出項目
	eval(path).name = results_mc["nm" add i];
	eval(path).link = results_mc["url" add i];
	eval(path).address = results_mc["ad" add i];
	eval(path).open = results_mc["op" add i];
	eval(path).sta = results_mc["st" add i];
	eval(path).bgd = results_mc["bg" add i];
	eval(path).scatch = results_mc["sc" add i];
	eval(path).code = results_mc["cd" add i];
	eval(path).xpos = results_mc["x" add i];
	eval(path).ypos = results_mc["y" add i];
	//ボタンの高さを加算
	tgy += 32;
}
//ページスクロールボタン
_next = Number(results_mc.nextn);
_prev = Number(results_mc.prevn);
pagenavi_mc.strnext = _next ? "次の" add _next add "件" : "";
pagenavi_mc.strprev = _prev ? "前の" add _prev add "件" : "もどる";
if( _next>0) {
	f = "both"; nn = 2;
} else if(_mode ne "map") {
	f = "prev"; nn = 1;
} else {
	f = "none"; nn = 0;
}
pagenavi_mc.frm = f;
tellTarget("pagenavi_mc") gotoAndStop(frm);
results_mc.navinum = nn;
//
tellTarget("results_mc") {
	btnnum = "";
	active = "";
	init = false;
}
//
gotoAndStop("listview");
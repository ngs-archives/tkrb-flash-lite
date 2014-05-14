// ================================================
//
// clearbtn_mcの中のボタンが押されたとき、
// 共通して実行されるスクリプト（フレームラベル）
//
// ================================================
//
tellTarget("/") {
	path = "results_mc/btn" add results_mc.active;
	switch(_mode) {
	case "map":
		xpos = eval(path).xpos;
		ypos = eval(path).ypos;
		tellTarget("/results_mc") gotoAndStop("init");
		gotoAndStop("genre");
		break;
	case "genre":
		gnr = eval(path).code;
		if(length(gnr) > 0) {
			tellTarget("/results_mc") gotoAndStop("init");
			gotoAndStop("load");
		} else if(getProperty("/pagenavi_mc/prevbtn",_currentframe) == 6) {
			tellTarget("/results_mc") gotoAndStop("init");
			gotoAndStop("map");
		}
		break;
	case "result":
		if(length(eval(path).name) > 0) {
			gotoAndStop("popup");
		} else if(getProperty("/pagenavi_mc/prevbtn",_currentframe) == 6) {
			if(results_mc.prevn > 0) {
				results_mc.page -=  10;
				tellTarget("/results_mc") gotoAndStop("init");
				gotoAndStop("load");
			} else {
				tellTarget("/results_mc") gotoAndStop("init");
				gotoAndStop("genre");
			}
		} else if(getProperty("/pagenavi_mc/nextbtn",_currentframe) == 6) {
			results_mc.page += 10;
			tellTarget("/results_mc") gotoAndStop("init");
			gotoAndStop("load");
		}
		break;
	}
}
gotoAndStop("default");
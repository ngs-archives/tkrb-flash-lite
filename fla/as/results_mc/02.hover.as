// ================================================
//
//　　[リスト項目選択時] フレーム番号:6
//
// ================================================
//
stop();
//
tellTarget("/pagenavi_mc/prevbtn") gotoAndStop("default");
tellTarget("/pagenavi_mc/nextbtn") gotoAndStop("default");
if(active>=hit) {
	switch(_parent.pagenavi_mc.frm) {
		case "prev": b = "prevbtn"; break;
		case "next": b = "nextbtn"; break;
		case "both":
			switch(active-hit) {
				case 0: b = "prevbtn"; break;
				case 1: b = "nextbtn"; break;
			}
			break;
		default: b = false; break;
	}
	tgy = default_y;
	tellTarget("/pagenavi_mc/" add b) gotoAndStop("hover");
	trace(b);
} else tgy = default_y - getProperty("btn" add active,_y);
//ボタンを選択状態に
for(i=0;i<hit;i++) {
	eval("btn" add i).f = i==active?"hover":"default";
	tellTarget("btn" add i) gotoAndStop(f);
}
//;
gotoAndPlay("ease");
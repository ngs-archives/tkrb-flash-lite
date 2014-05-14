// ================================================
//
//　　[下選択] フレーム番号:16
//
// ================================================
//
if(!init) {
	active = 0;
	init = true;
} else if(active < hit+navinum-1) {
	active++;
} else {
	active = 0;
}
if(active>=0) gotoAndPlay("hover");
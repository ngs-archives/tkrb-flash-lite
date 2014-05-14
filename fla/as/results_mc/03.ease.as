// ================================================
//
//　　[イージング処理] フレーム番号:11/12
//
// ================================================
//
mov = (tgy - _y)*0.3;
if(Math.abs(mov)>1) {
	_y += mov;
	if(_currentframe != 11) gotoAndPlay("ease");
} else {
	_y = tgy;
	gotoAndStop("default");
}
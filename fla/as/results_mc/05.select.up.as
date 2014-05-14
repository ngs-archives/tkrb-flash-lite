// ================================================
//
//　　[上選択] フレーム番号:21
//
// ================================================
//
if(!init) {
	active = hit + navinum -1; 
	init = true;
} else if(active > 0) {
	active--;
} else {
	active = hit + navinum -1;
}
if(active>=0) gotoAndPlay("hover");
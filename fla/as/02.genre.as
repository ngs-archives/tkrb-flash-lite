// ================================================
//
//　　[ジャンル表示] フレーム番号:11
//
// ================================================
//
_mode = "genre";
tellTarget("header_mc/badge") {
	text = "ジャンルを\n選んでね";
	gotoAndPlay(1);
}
//ローカル時刻でジャンル選択肢を出し分け
results_mc._time = header_mc.frm;
tellTarget("results_mc") {
	page = 0;
	switch(_time) {
	case "dinner":
		cd0 = "all";
		nm0 = "すべて";
		cd1 = "G001";
		nm1 = "居酒屋";
		cd2 = "G002";
		nm2 = "ダイニングバー";
		cd3 = "G003";
		nm3 = "創作料理";
		cd4 = "G008";
		nm4 = "焼肉・韓国料理";
		cd5 = "G011";
		nm5 = "カラオケ・パーティ";
		cd6 = "G012";
		nm6 = "バー・カクテル";
		hit = 7;
		break;
	case "lunch":
		cd0 = "all";
		nm0 = "すべて";
		cd1 = "G004";
		nm1 = "和食";
		cd2 = "G005";
		nm2 = "洋食";
		cd3 = "G006";
		nm3 = "イタリアン・フレンチ";
		cd4 = "G007";
		nm4 = "中華";
		hit = 5;
		break;
	default:
		cd0 = "all";
		nm0 = "すべて";
		cd1 = "G004";
		nm1 = "和食";
		cd2 = "G005";
		nm2 = "洋食";
		cd3 = "G006";
		nm3 = "イタリアン・フレンチ";
		cd4 = "G007";
		nm4 = "中華";
		hit = 5;
		break;
	}
}
gotoAndStop("list");
<?php
	@mb_internal_encoding("UTF-8");

	require_once("./inc/Hotpepper.class.php");
	//http://api.hotpepper.jp/reference.html#we34860a
	function proxy() {
		//モバイル用短縮パラメータ
		$alias = array(
			'sid' => 'ShopIdFront', 'skn' => 'ShopNameKana', 'snm' => 'ShopName', 'stl' => 'ShopTel', 
			'sad' => 'ShopAddress', 'ls' => 'LargeServiceAreaCD', 'sv' => 'ServiceAreaCD', 
			'la' => 'LargeAreaCD', 'ma' => 'MiddleAreaCD', 'sa' => 'SmallAreaCD','kw' => 'Keyword', 
			'x' => 'Latitude', 'y' => 'Longitude', 'z' => 'Range', 
			'dt' => 'Datum', 'kcp' => 'KtaiCoupon', 'gr' => 'GenreCD', 'fd' => 'FoodCD', 
			'bgc' => 'BudgetCD', 'pcap' => 'PartyCapacity', 'wd' => 'Wedding', 'cs' => 'Course',
			'fdr' => 'FreeDrink', 'ffd' => 'FreeFood', 'prv' => 'PrivateRoom', 
			'hgt' => 'Horigotatsu', 'ttm' => 'Tatami', 'cct' => 'Cocktail','sch' => 'Shochu', 
			'sake' => 'Sake', 'wine' => 'Wine', 'card' => 'Card', 'nsmk' => 'NonSmoking', 
			'chtr' => 'Charter', 'k' => 'Ktai', 'prk' => 'Parking','bfr' => 'BarrierFree', 
			'smm' => 'Sommelier', 'ngv' => 'NightView', 'oair' => 'OpenAir', 'show' => 'Show', 
			'eq' => 'Equipment', 'kok' => 'Karaoke','band' => 'Band', 'tv' => 'Tv', 
			'lnc' => 'Lunch', 'mdn' => 'Midnight', 'mml' => 'MidnightMeal', 'eng' => 'English',
			'pet' => 'Pet', 'chd' => 'Child', 'odr' => 'Order', 'p' => NULL
		);

		$paramobj = array();
		foreach($_GET as $k => $v) {
			if(!array_key_exists($k,$alias)&&isset($v))
				error("不正なパラメータ");
			else if($alias{$k})
				$paramobj{$alias{$k}} = $v;
		}
		
		$count = 10;
		$paramobj{Count} = $count;
		$page = @is_numeric($_GET{p}) ? $_GET{p} : 0;
		$paramobj{Start} = $page + 1;
	
		$gs = new GourmetSearch($paramobj);
		
		if($gs->userIsMobile()) header("Content-type: text/plain");
		
		if($gs->success) {
			if($gs->total > 0) {
				$output = "total="
					.$gs->total
					."&nextn=". $gs-> getNextResultsNum()
					."&prevn=". $gs-> getPrevResultsNum()
					."&hit=".count($gs->shops)
					."&curp=${page}&";
				$n = 0;
				foreach($gs->shops as $shop) {
					$nm = $shop->ShopName;
					if(strlen($nm)>50) $nm = substr($nm,0,49) . "...";
					$output .= "nm${n}=${nm}&"
							. "url${n}=".urlencode($shop->KtaiShopUrl)."&"
							. "ad${n}=".$shop->ShopAddress."&"
							. "op${n}=".$shop->Open
							. ($shop->Close?"\n定休日:".$shop->Close:"")."&"
							. "st${n}=".$shop->StationName."&"
							. "bg${n}=".$shop->BudgetDesc."&"
							. "sc${n}=".$shop->ShopCatch."&";
					$n++;
				}
				
				$output .= "success=1&loaded=1";

				echo kana($output);

			} else error("該当する結果が\n見つかりませんでした");

		} else error($gs->errormsg);
	}

	function kana($str) {
		return mb_convert_encoding(mb_convert_kana($str,'aknrs'), "SJIS", "auto");
	}

	function error($str) { die(kana("error=${str}&success=0&loaded=1")); }

	//
	
	proxy();
	
	exit;

?>
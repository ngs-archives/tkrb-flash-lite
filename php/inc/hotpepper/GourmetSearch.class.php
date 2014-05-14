<?php

class GourmetSearch extends Hotpepper {

	var $querylist = array(
		'ShopIdFront', 'ShopNameKana', 'ShopName', 'ShopTel', 'ShopAddress',
		'LargeServiceAreaCD', 'ServiceAreaCD', 'LargeAreaCD', 'MiddleAreaCD', 'SmallAreaCD',
		'Keyword', 'Latitude', 'Longitude', 'Range', 'Datum', 'KtaiCoupon',
		'GenreCD', 'FoodCD', 'BudgetCD', 'PartyCapacity', 'Wedding', 'Course',
		'FreeDrink', 'FreeFood', 'PrivateRoom', 'Horigotatsu', 'Tatami', 'Cocktail',
		'Shochu', 'Sake', 'Wine', 'Card', 'NonSmoking', 'Charter', 'Ktai', 'Parking',
		'BarrierFree', 'Sommelier', 'NightView', 'OpenAir', 'Show', 'Equipment', 'Karaoke',
		'Band', 'Tv', 'Lunch', 'Midnight', 'MidnightMeal', 'English',
		'Pet', 'Child', 'Order', 'Start', 'Count'
	);
	
	function GourmetSearch($params=array()) {
		if($this->validate($params,$this->querylist)) {
			$qstr = $this->paramString($params);
			$loc = $this->apihost . "GourmetSearch/" . $this->apiversion . "/?" .$qstr;
			$r = $this->getXMLObject($loc);
		} else if(!$this->errormsg) $this->errormsg = "不明なエラー";
	}	
}

?>
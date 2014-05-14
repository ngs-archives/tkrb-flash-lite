<?php

require_once(realpath(dirname(__FILE__))."/hotpepper/GourmetSearch.class.php");

class Hotpepper {
	var $apikey = "guest", $apiversion = "V110", $apihost = "http://api.hotpepper.jp/";
	var $areamaster = array();

	function Hotpepper() {  }
	
	function getXMLObject($url=NULL) {
		if(!$url) return 0;
		//
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt ($curl, CURLOPT_HEADER, 0);
		curl_setopt ($curl, CURLOPT_RETURNTRANSFER, 1);
		$f = curl_exec($curl);
		$cinfo = curl_getinfo($curl);
		$this->success = $cinfo{http_code} == "200" ? 1 : 0;
		curl_close($curl);
		$xml = @new SimpleXMLElement($f);
		//
		if($this->success) {
			$this->shops = $xml->Shop;
			$this->total = $xml->NumberOfResults;
			$this->count = $xml->DisplayPerPage;
			$this->current = $xml->DisplayFrom;
			$this->results = $xml;
			return $xml;
		} else {
			switch($cinfo{http_code}) {
				case "400":
				case "403":
				case "503":
					$msg = $xml->Message;
					$this->errormsg = $msg ? $msg : "不明なエラー";
					break;
				default:
					$this->errormsg = "ウェブサービスに接続できません。";
					break;
			}
			return 0;
		}
	}
	
	function getNextResultsNum() {
		$t = $this->total;
		$cu = $this->current;
		$co = $this->count;
		$n = ( $t > $t + $cu * 2 ) ? $co : ( $t - ($cu + $co) + 1 );
		return $n > 0 ? ( $co > $n ? $n : $co ) : 0;
	}

	function getPrevResultsNum() {
		$t = $this->total;
		$cu = $this->current;
		$co = $this->count;
		$n = $cu > $co ? $co : $cu -1;
		return $n > 0 ? ( $co > $n ? $n : $co ) : 0;
	}
	
	function paramString($params=array()) {
		$qstr = "key=".$this->apikey."&";
		foreach($params as $k => $v) $qstr .= "${k}=${v}&";
		return $qstr;
	}
	
	function validate($params=array(),$keys=array()) {
		foreach($params as $k => $v) {
			if($v&&!in_array($k, $keys)) return false;
		}
		return true;
	}
	
	function userIsMobile() {
		$e = $_SERVER{HTTP_USER_AGENT};
		$mcode = "/DoCoMo|J\-Phone|SoftBank|Vodafone|KDDI|UP\.Browser/i";
		if(preg_match($mcode,$e)) return true;
		return false;
	}
}

?>

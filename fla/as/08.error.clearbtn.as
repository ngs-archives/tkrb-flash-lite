on(press,keyPress "<Enter>") {
	switch(_mode) {
		case "result": gotoAndStop("genre"); break;
		default: gotoAndStop("map"); break;
	}
}
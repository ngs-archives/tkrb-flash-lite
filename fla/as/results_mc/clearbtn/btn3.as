on(rollOver) {
	tellTarget("/results_mc") {
		gotoAndStop(btnnum == 1?"select_down":"select_up");
		btnnum = 2;
	}
}
#include "btn.enter.as"
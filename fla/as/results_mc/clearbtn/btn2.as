on(rollOver) {
	tellTarget("/results_mc") {
		gotoAndStop(btnnum == 0?"select_down":"select_up");
		btnnum = 1;
	}
}
#include "btn.enter.as"
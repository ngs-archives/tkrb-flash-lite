on(rollOver) {
	tellTarget("/results_mc") {
		gotoAndStop(btnnum == 2 || btnnum == ""?"select_down":"select_up");
		btnnum = 0;
	}
}
#include "btn.enter.as"
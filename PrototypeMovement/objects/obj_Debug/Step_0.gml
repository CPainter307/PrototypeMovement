if (scr_get_input_pressed(inpt.aux)) {		//toggles freeze
	if (freeze == false) {					//freezes debugger
		freeze = true;
		line0 = "*FROZEN*";
		c0 = c_yellow;
	}
	else {									//unfreezes debugger
		freeze = false;	
		line0 = "Active";
		c0 = c_black;
	}
}

if (!freeze) {								//only updates debugger if not frozen
	line1 = string(global.squareID.speed);
	line2 = string(global.squareID.hspeed);
	line3 = string(global.squareID.vspeed);
	line4 = string(global.squareID.gravity);
	line5 = string(global.squareID.direction);

	//update colors
	//line1
	if (global.squareID.speed == 0) {
		c1 = c_red;
	}
	else {
		c1 = c_black;
	}
	//line2
	if (global.squareID.hspeed == 0) {
		c2 = c_red;
	}
	else {
		c2 = c_black;
	}
	//line3
	if (global.squareID.vspeed == 0) {
		c3 = c_red;
	}
	else {
		c3 = c_black;
	}
	//line4
	if (global.squareID.gravity == 0) {
		c4 = c_red;	
	}
	else {
		c4 = c_black;
	}
	//line5
	if (global.squareID.direction == 270) {
		c5 = c_red;
	}
	else {
		c5 = c_black;	
	}
	//line6
	if (global.squareID.dash_active) {	//dash active
		line6 = "Dash Active";
		c6 = c_red;
	}
	else {
		line6 = "Dash NOT Active";
		c6 = c_black;
	}
	//line7
	if (global.gamepad_active) {		//gamepad connected
		line7 = "Connected";
		c7 = c_black;
	}
	else {
		line7 = "Not Connected";
		c7 = c_black;
	}
}
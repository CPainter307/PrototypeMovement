//sets direction
//if (!jump_active) {
	/*if (scr_get_input(dir.up)) {
		motion_add(90, spd);
	}*/
	/*if (scr_get_input(dir.down)) {
		motion_add(270, spd);
	}*/
	if (scr_get_input(dir.left)) {
		motion_add(180, spd);
		hspeed = -spd;
	}
	if (scr_get_input(dir.right)) {
		motion_add(0, spd);
		hspeed = spd;
	}
//}

//sets speed
/*if (scr_any_dir_input()) {
	speed = spd;	
}
else {
	speed = 0;	
}*/

//jump
if (keyboard_check(global.input_jump) && !jump_active) {
	jump_active = true;	
}

if (jump_active) {
	if (!jump_started) {				//jump hasn't started yet
		jump_started = true;
		jump_rising = true;
		motion_add(90, jump_spd);
		//gravity = 0;
	}
	
	if (jump_rising) {					//jump should still be rising
		//motion_add(90, jump_spd);
		//speed = jump_spd;
		jump_i++;
		if (jump_i >= jump_time) {		//jump is active until step counter has reached limit
			jump_rising = false;
			jump_i = 0;
			//gravity = grav;
		}
		else if (!keyboard_check(global.input_jump)) {	//jump is active until jump key is not longer held
			jump_rising = false;
			jump_i = 0;
			//gravity = grav;
		}
	}
	else if (position_meeting(x, y+(sprite_width/2), obj_Block)) {		//checks to see if bottom of square collides with block
		//gravity = 0;
		if (keyboard_check(global.input_jump)) {	//jump still being held after falling
			//nothing
		}
		else {
			jump_started = false;
			jump_active = false;
		}
	}
}

if (position_meeting(x, y+(sprite_width/2), obj_Block)) {
	gravity = 0;	
}
else {
	gravity = grav;	
}
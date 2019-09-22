//sets direction
if (direction > 90 && direction < 270) {
	facing = dir.left;
}
else if (direction < 90 && direction > 270) {
	facing = dir.right;	
}
else {
	facing = dir.none;	
}


//horizontal speed
if (scr_get_input(inpt.left)) {		//if left input
	hspeed = -spd;	
}
	
if (scr_get_input(inpt.right)) {		//if right input
	hspeed = spd;	
}
	
if (scr_get_input(inpt.left) && scr_get_input(inpt.right)) {		//if left and right input
	hspeed = 0;
}
else if (!scr_get_input(inpt.left) && !scr_get_input(inpt.right)) {		//if no left and no right input
	if (hspeed < 0) {	//moving left
		hspeed += hori_fric;
		if (hspeed > 0) {	//speed wrapped around and now going right
			hspeed = 0;
		}
	}
	if (hspeed > 0) {	//moving right
		hspeed -= hori_fric;
		if (hspeed < 0) {	//speed wrapped around and now going left
			hspeed = 0;
		}
	}
	
}


//jump
if (scr_get_input(inpt.jump) && !jump_active) {
	jump_active = true;	
}

if (jump_active) {
	if (!jump_started) {				//jump hasn't started yet
		jump_started = true;
		jump_rising = true;
		vspeed = -jump_spd;
		//gravity = 0;
	}
	
	if (jump_rising) {					//jump should still be rising
		//motion_add(90, jump_spd);
		//speed = jump_spd;
		if (!scr_get_input(inpt.jump)) {	//jump is active until jump key is not longer held
			vspeed = 0;
		}
	}
	
	if (vspeed == 0) {
		jump_rising = false;	
	}
	
	if (position_meeting(x, y+(sprite_width/2), obj_Block)) {		//checks to see if bottom of square collides with block
		//gravity = 0;
		if (scr_get_input(inpt.jump)) {	//jump still being held after falling
			//nothing
		}
		else {
			jump_started = false;
			jump_active = false;
			jump_rising = false;
		}
	}
}

if (position_meeting(x, y+(sprite_width/2), obj_Block)) {		//bottom of square touching block
	gravity = 0;	
}
else {
	gravity = grav;	
}
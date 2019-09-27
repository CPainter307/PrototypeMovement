//Sets Facing Direction
if (direction > 90 && direction < 270) {
	facing = dir.left;
}
else if (direction < 90 && direction > 270) {
	facing = dir.right;	
}
else {
	//facing = dir.none;	
}


//Movement
if (!dash_active) {						//if dash isn't active, then apply movement code; else don't until dash is done
	//Horizontal Speed
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


	//Jump
	if (scr_get_input(inpt.jump) && !jump_active) {
		jump_active = true;	
	}

	if (jump_active) {
		if (!jump_started) {				//jump hasn't started yet
			jump_started = true;
			jump_rising = true;
			vspeed = -initial_jump_spd;
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
	
	//Special Checks

	//terminal velocity cap
	if (direction > 180 && direction < 360) {		//direction is somewhere below the x-axis
		if (abs(speed) > terminal_vel) {
			gravity = 0;	
		}
		else {
			gravity = grav;	
		}
	}
	else {
		gravity = grav;	
	}

	//gravity set to zero if bottom touching block
	if (position_meeting(x, y+(sprite_width/2) + 1, obj_Block)) {		//bottom of square touching block
		gravity = 0;
		if (!jump_active) {
			vspeed = 0;
		}
	}
	else {
		//gravity = grav;	
	}

	//max speed cap
	/*if (abs(speed) > max_spd) {		//speed is greater than max speed
		if (speed > 0) {			//speed is positive
			speed = max_spd;
		}
		else {						//speed is negative
			speed = -max_spd;
		}
	}*/
}
//end dash restricted code

//Dash
if (scr_get_input_pressed(inpt.dash)) {
	if (!dash_cooldown_active) {
		dash_dir = scr_8_dir_input();
		switch (dash_dir) {
			case dir.up:
				direction = 90;
				break;
			case dir.down:
				direction = 270;
				break;
			case dir.left:
				direction = 180;
				break;
			case dir.right:
				direction = 0;
				break;
			case dir.up_left:
				direction = 135;
				break;
			case dir.up_right:
				direction = 45;
				break;
			case dir.down_left:
				direction = 225;
				break;
			case dir.down_right:
				direction = 315;
				break;
			default:					//no input so dash in current facing direction
				if (facing == dir.left) {	//facing left so dash left
					direction = 180;
				}
				else {						//facing right so dash right
					direction = 0;
				}
		}
		pre_dash_speed = speed;
		speed = dash_spd;
		gravity = 0;
		dash_active = true;
		dash_cooldown_active = true;
		sprite_index = spr_square_cooldown;
	}
}

//Dash Timer
if (dash_active) {
	if (dash_i < dash_duration) {			//dash should still be going
		dash_i++;
	}
	else {								//dash should now stop
		speed = post_dash_speed;
		gravity = grav;
		dash_i = 0;
		dash_active = false;
	}
}

//Dash Cooldown Timer
if (dash_cooldown_active) {
	if (dash_cooldown_i < dash_cooldown_timer) {
		dash_cooldown_i++;	
	}
	else {
		dash_cooldown_i = 0;
		dash_cooldown_active = false;
		sprite_index = spr_square;
	}
}
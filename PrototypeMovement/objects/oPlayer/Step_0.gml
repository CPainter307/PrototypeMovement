//if xdir != previous_xdir {
//	skid_stop = false	
//}

if gamepad_is_connected(0) {
	xdir = gamepad_axis_value(0, gp_axislh)
	gamepad_set_axis_deadzone(0, .3)
	space_pressed = gamepad_button_check_pressed(0, gp_face1)
	space_released = gamepad_button_check_released(0, gp_face1)
} else {
	xdir = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	space_pressed = keyboard_check_pressed(vk_space)
	space_released = keyboard_check_released(vk_space)
}

//add gravity
if motiony < 0 and gamepad_button_check(0, gp_face1) {
	motiony += GRAVITY
} else {
	motiony += FALL_GRAVITY
}

//coyote buffer
if on_floor {
	coyote_buffer = JUMP_BUFFER_LENGTH
}
if coyote_buffer > 0 {
	coyote_buffer -= 1	
}

//ground jump buffer
if space_pressed {
	jump_buffer = JUMP_BUFFER_LENGTH
}
if jump_buffer > 0 {
	jump_buffer -= 1	
}

//moving
if on_floor or coyote_buffer > 0 {
	if xdir > 0 { // moving left
		if round(motionx) == -MAX_SPEED {
			skid_stop = true	
		}
		//show_debug_message(string(round(motionx)))
		if skid_stop and round(motionx) == 0 and !skid_started {
			show_debug_message("skid")
			skid_buffer = SKID_TIME
			skid_started = true
		}
		if skid_buffer > 0 {
			motionx = 0
			skid_buffer -= 1
			acceleration = 0;
		}
		if skid_buffer == 0 {
			show_debug_message("skid stop")
			skid_stop = false
			skid_buffer = -1
			acceleration = ACCELERATION
			skid_started = false
		}
		image_xscale = 1
		motionx = min(motionx+acceleration, MAX_SPEED)
	}
	if xdir < 0 { // moving right
		if round(motionx) == MAX_SPEED {
			skid_stop = true
		}
		//show_debug_message(string(round(motionx)))
		if skid_stop and round(motionx) == 0 and !skid_started {
			show_debug_message("skid")
			skid_buffer = SKID_TIME
			skid_started = true
		}
		if skid_buffer > 0 {
			motionx = 0
			skid_buffer -= 1
			acceleration = 0;
		}
		if skid_buffer == 0 {
			show_debug_message("skid stop")
			skid_stop = false
			skid_buffer = -1
			acceleration = ACCELERATION
			skid_started = false
		}
		image_xscale = -1
		motionx = max(motionx-acceleration, -MAX_SPEED)
	}
} else {
	if xdir > 0
		motionx = min(motionx+AIR_ACCELERATION, MAX_SPEED)
	if xdir < 0
		motionx = max(motionx-AIR_ACCELERATION, -MAX_SPEED)
}

//stop moving
if xdir == 0 {
	motionx = lerp(motionx, 0, DECCELRATION)
}

//jump
if (space_pressed or jump_buffer > 0) and (on_floor or coyote_buffer > 0) {
	motiony = -JUMP_SPEED
}
//release jump
if space_released and motiony < 0 {
	motiony = lerp(motiony, 0, JUMP_FALLOFF_SPEED)	
}

//collision
if (place_meeting(x+motionx, y, oWall)) {
	while (!place_meeting(x+sign(motionx), y, oWall)) {
		x += sign(motionx);
	}
	motionx = 0;
}
x += motionx

if (place_meeting(x, y+motiony, oWall)) {
	on_floor = true
	while (!place_meeting(x, y+sign(motiony), oWall)) {
		y += sign(motiony);
	}
	motiony = 0;
} else {
	on_floor = false	
}
y += motiony

//store xdir
previous_xdir = xdir
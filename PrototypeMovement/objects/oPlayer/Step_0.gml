if gamepad_is_connected(0) {
	xdir = gamepad_axis_value(0, gp_axislh)
	gamepad_set_axis_deadzone(0, .3)
	space_pressed = gamepad_button_check_pressed(0, gp_face1)
	space_released = gamepad_button_check_released(0, gp_face1)
} else {
	input_right = keyboard_check(ord("D"))
	input_left =  keyboard_check(ord("A"))
	xdir = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	space_pressed = keyboard_check_pressed(vk_space)
	space_held = keyboard_check(vk_space)
	space_released = keyboard_check_released(vk_space)
}

//add gravity
if motiony < 0 {
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

//release jump buffer
if space_released {
	release_buffer = JUMP_BUFFER_LENGTH
}
if release_buffer > 0 {
	release_buffer -= 1	
}


//decelerate
//
if ((!input_right and motionx > 0 ) or (!input_left and motionx < 0)) { //if try to change direction mid run, the decelleration still remains, switching directions faster.
	motionx = lerp(motionx, 0, DECCELRATION)
	if motionx < DECCEL_CUTOFF and motionx > -DECCEL_CUTOFF {
		motionx = 0	
	}
}

//moving
if on_floor or coyote_buffer > 0 {
	if input_right { // moving right
		motionx += ACCELERATION
		if motionx >= MAX_SPEED {
			motionx = MAX_SPEED
			at_max_speed = true
		}
	}
	if input_left { // moving left
		motionx -= ACCELERATION
		if motionx <= -MAX_SPEED {
			motionx = -MAX_SPEED
			at_max_speed = true
		}
	}
} else {
	if input_right { // moving right
		motionx += AIR_ACCELERATION
		if motionx >= MAX_SPEED {
			motionx = MAX_SPEED
		}
	}
	if input_left { // moving left
		motionx -= AIR_ACCELERATION
		if motionx <= -MAX_SPEED {
			motionx = -MAX_SPEED
		}
	}	
}


//dash buffer      
if (at_max_speed) {
	dash_buffer = DASH_BUFFER_LENGTH	
	at_max_speed = false
}
if dash_buffer > 0 {
	dash_buffer -= 1	
}


//jump

//inital jump
if (space_pressed or jump_buffer > 0) and (on_floor or coyote_buffer > 0) { 
	jump_buffer = 0
	coyote_buffer = 0
	jump_time = JUMP_TIME
	motiony = -JUMP_SPEED*2
		if (dash_buffer > 0 and (sign(input_left - input_right) = sign(motionx))) { //executes if the player was dashing and input a change in direction.
			motionx = 0	
		}
}
//held jump
if space_held and jump_time > 0 {
	motiony = -JUMP_SPEED
	jump_time--
}
//release jump 
if (space_released or release_buffer > 0) and motiony < 0 { 
	//motiony = lerp(motiony, 0, JUMP_FALLOFF_SPEED)	
	jump_time = 0
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
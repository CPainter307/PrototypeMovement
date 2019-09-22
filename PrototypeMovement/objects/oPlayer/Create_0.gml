#macro ACCELERATION .3
#macro MAX_SPEED 8
#macro DECCELRATION .1
#macro GRAVITY .7
#macro FALL_GRAVITY 1
#macro JUMP_FALLOFF_SPEED .5
#macro JUMP_SPEED 15
#macro AIR_ACCELERATION .3
#macro JUMP_BUFFER_LENGTH 7
#macro SKID_TIME 60

motionx = 0
motiony = 0
xdir = 0
ydir = 0

coyote_buffer = 0
jump_buffer = 0
jump_release_buffer = 0

acceleration = ACCELERATION
skid_buffer = -1
skid_started = false

on_floor = true
previous_xdir = 0

skid_stop = false



//if gamepad_is_connected(0) {
//	space_pressed = gamepad_button_check_pressed(0, gp_face1)
//	space_released = gamepad_button_check_released(0, gp_face1)
//} else {
//	space_pressed = keyboard_check_pressed(vk_space)
//	space_released = keyboard_check_released(vk_space)
//}
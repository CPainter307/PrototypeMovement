#macro ACCELERATION .2
#macro MAX_SPEED 7
#macro DECCELRATION .07
#macro DECCEL_CUTOFF 0.4
#macro GRAVITY .7
#macro FALL_GRAVITY 1
#macro PEAK_SPEED 15
#macro JUMP_FALLOFF_SPEED .5
#macro JUMP_SPEED 10
#macro AIR_ACCELERATION .3
#macro JUMP_BUFFER_LENGTH 7
#macro SKID_TIME 60
#macro JUMP_TIME 20

motionx = 0
motiony = 0
xdir = 0
ydir = 0

coyote_buffer = 0
jump_buffer = 0
release_buffer = 0

acceleration = ACCELERATION
skid_buffer = -1
skid_started = false

on_floor = true
previous_xdir = 0

jump_time = 0

skid_stop = false

#macro MAX_JOG_SPEED  4
#macro MAX_SPRINT_SPEED 11
#macro SPRINT_ACCELERATION  .3
#macro JOG_ACCELERATION  .2
#macro DECCELRATION .07
#macro DECCEL_CUTOFF 1
#macro GRAVITY .7
#macro FALL_GRAVITY 1
#macro PEAK_SPEED 15
#macro JUMP_FALLOFF_SPEED .5
#macro JUMP_SPEED 10
#macro SPRINT_AIR_ACCELERATION .40
#macro JOG_AIR_ACCELERATION .25
#macro JUMP_BUFFER_LENGTH 7
#macro SKID_TIME 60
#macro JUMP_TIME 18
#macro DASH_BUFFER_LENGTH 20

window_set_size(1920, 1080)

has_jumped = true

MAX_SPEED = 0
ACCELERATION = 0
AIR_ACCELERATION = 0;

motionx = 0
motiony = 0
xdir = 0
ydir = 0
at_max_speed = false

coyote_buffer = 0
jump_buffer = 0
release_buffer = 0
dash_buffer = 0


skid_buffer = -1
skid_started = false

on_floor = true
previous_xdir = 0

jump_time = 0

skid_stop = false
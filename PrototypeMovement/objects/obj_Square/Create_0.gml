global.squareID = id;
global.spawnX = x;
global.spawnY = y;

//Speed and Direction
spd = 12;
initial_jump_spd = 20;
max_spd = 20;
terminal_vel = 20;
grav = 0.75;
gravity = grav;
gravity_direction = 270;

//Jump Triggers
jump_started = false;
jump_active = false;
jump_rising = false;
jump_time = 64;				//number of steps jump will be active
jump_i = 0;					//counter to get to jump time;

//Left and Right Movement
fric = 2;
hori_fric = 1;
left_active = false;
right_active = false;
facing = dir.none;

//Dash
dash_dir = dir.none;
dash_spd = 30;
dash_active = false;
dash_i = 0;
dash_duration = 10;
pre_dash_speed = 0;
post_dash_speed = 5;
dash_cooldown_i = 0;
dash_cooldown_timer = 60;
dash_cooldown_active = false;

//Collision
bottom_collision = false;
top_collision = false;
left_collision = false;
right_collision = false;

init_bottom_collision = false;
init_top_collision = false;
init_left_collision = false;
init_right_collision = false;
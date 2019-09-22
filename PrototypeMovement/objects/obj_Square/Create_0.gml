up = false;
down = false;
left = false;
right = false;

spd = 10;
jump_spd = 20;
grav = 1;
gravity = grav;
gravity_direction = 270;

jump_started = false;
jump_active = false;
jump_rising = false;
jump_time = 64;				//number of steps jump will be active
jump_i = 0;					//counter to get to jump time;

fric = 4;
hori_fric = 1;
left_active = false;
right_active = false;
facing = dir.none;
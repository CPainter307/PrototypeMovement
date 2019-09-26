//IDs
global.squareID = pointer_null;
global.spawnX = pointer_null;
global.spawnY = pointer_null;

//Enumerators
enum dir {
	none,
	up,
	down,
	left,
	right,
	up_left,
	up_right,
	down_left,
	down_right
}

enum inpt {
	none,
	up,
	down,
	left,
	right,
	jump,
	dash
}

//global input variables
global.input_up = "W";
global.input_down = "S";
global.input_left = "A";
global.input_right = "D";
global.input_jump = vk_space;
global.input_dash = vk_shift;

if (gamepad_is_connected(0)) {
	global.input_up = gp_padu;
	global.input_down = gp_padd;
	global.input_left = gp_padl;
	global.input_right = gp_padr;
	global.input_jump = gp_face1;
	global.input_dash = gp_face2;
}
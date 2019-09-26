//IDs
global.squareID = pointer_null;
global.spawnX = pointer_null;
global.spawnY = pointer_null;
global.gamepad_slot = 0;
global.gamepad_active = false;
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
	dash,
	aux
}

//global input variables
global.input_up = "W";
global.input_down = "S";
global.input_left = "A";
global.input_right = "D";
global.input_jump = vk_space;
global.input_dash = vk_shift;
global.input_aux = vk_backspace;

var slot = 0;

while (slot < 12 && !global.gamepad_active) {	//runs until all slots have been checked or one is active
	if (gamepad_is_connected(slot)) {
		global.input_up = gp_padu;
		global.input_down = gp_padd;
		global.input_left = gp_padl;
		global.input_right = gp_padr;
		global.input_jump = gp_face1;
		global.input_dash = gp_face2;
		global.input_aux = gp_shoulderrb;
		
		global.gamepad_active = true;
		global.gamepad_slot = slot;
	}
	else {
		slot++;	
	}
}
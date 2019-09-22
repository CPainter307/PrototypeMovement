//takes in enum of input and returns true or false depending on input value
//currently only takes in keyboard input
var d = argument0;
var input = false;

switch (d) {
	case inpt.up:
		input = keyboard_check_pressed(ord(global.input_up));
		break;
	case inpt.down:
		input = keyboard_check_pressed(ord(global.input_down));
		break;
	case inpt.left:
		input = keyboard_check_pressed(ord(global.input_left));
		break;
	case inpt.right:
		input = keyboard_check_pressed(ord(global.input_right));
		break;
}

return input;
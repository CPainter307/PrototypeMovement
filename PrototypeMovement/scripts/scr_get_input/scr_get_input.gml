//takes in enum of input and returns true or false depending on input value
//currently only takes in keyboard input
var d = argument0;
var input = false;

switch (d) {
	case dir.up:
		input = keyboard_check(ord(global.input_up));
		break;
	case dir.down:
		input = keyboard_check(ord(global.input_down));
		break;
	case dir.left:
		input = keyboard_check(ord(global.input_left));
		break;
	case dir.right:
		input = keyboard_check(ord(global.input_right));
		break;
}

return input;
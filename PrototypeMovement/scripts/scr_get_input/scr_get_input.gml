//takes in enum of input and returns true or false depending on input value
//currently only takes in keyboard input
var d = argument0;
var input = false;
if (gamepad_is_connected(0)) {
	switch (d) {
		case inpt.up:
			input = gamepad_button_check(0, global.input_up);
			break;
		case inpt.down:
			input = gamepad_button_check(0, global.input_down);
			break;
		case inpt.left:
			input = gamepad_button_check(0, global.input_left);
			break;
		case inpt.right:
			input = gamepad_button_check(0, global.input_right);
			break;
		case inpt.jump:
			input = gamepad_button_check(0, global.input_jump);
			break;
	}
}
else {
	switch (d) {
		case inpt.up:
			input = keyboard_check(ord(global.input_up));
			break;
		case inpt.down:
			input = keyboard_check(ord(global.input_down));
			break;
		case inpt.left:
			input = keyboard_check(ord(global.input_left));
			break;
		case inpt.right:
			input = keyboard_check(ord(global.input_right));
			break;
		case inpt.jump:
			input = keyboard_check(global.input_jump);
	}
}

return input;
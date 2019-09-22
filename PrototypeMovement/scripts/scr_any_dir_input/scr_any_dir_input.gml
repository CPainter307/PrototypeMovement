//returns true if any of the 4 direction inputs are active
var input_active = false;

if (keyboard_check(ord(global.input_up))) {
	input_active = true;
}
else if (keyboard_check(ord(global.input_down))) {
	input_active = true;	
}
else if (keyboard_check(ord(global.input_left))) {
	input_active = true;	
}
else if (keyboard_check(ord(global.input_right))) {
	input_active = true;	
}

return input_active;
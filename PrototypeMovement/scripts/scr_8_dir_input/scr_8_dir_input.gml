//Script to return enum for 8 directional input

var up_active = scr_get_input(inpt.up);
var down_active = scr_get_input(inpt.down);
var left_active = scr_get_input(inpt.left);
var right_active = scr_get_input(inpt.right);

var dir_active = dir.none;

if (up_active) {
	if (left_active) {				//up and left
		dir_active = dir.up_left;	
	}
	else if (right_active) {		//up and right
		dir_active = dir.up_right;	
	}
	else {							//up
		dir_active = dir.up;
	}
}
else if (down_active) {
	if (left_active) {				//down and left
		dir_active = dir.down_left;	
	}
	else if (right_active) {		//down and right
		dir_active = dir.down_right;	
	}
	else {							//down
		dir_active = dir.down;
	}
}
else if (left_active) {				//left
	dir_active = dir.left;	
}
else if (right_active) {			//right
	dir_active = dir.right;
}

return dir_active;
//bottom of square
if (position_meeting(x, y+(sprite_height/2), obj_Block)) {		//checks for center bottom of sprite
	y = other.y - (other.sprite_height/2) - sprite_height/2;
}
//right of square
if (position_meeting(x+(sprite_width/2), y, obj_Block)) {		//checks for center right of sprite
	x = other.x - (other.sprite_width/2) - sprite_width/2;
}
//left of square
if (position_meeting(x-(sprite_width/2), y, obj_Block)) {		//checks for center left of sprite
	x = other.x + (other.sprite_width/2) + sprite_width/2;
}
//top of square
if (position_meeting(x, y-(sprite_height/2), obj_Block)) {		//checks for cetner top of sprite
	y = other.y + (other.sprite_height/2) + sprite_height/2;
}
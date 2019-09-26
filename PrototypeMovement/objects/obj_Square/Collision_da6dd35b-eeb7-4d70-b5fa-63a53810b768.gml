//bottom of square
/*if (place_meeting(x, y+(sprite_height/2), other)) {		//checks for center bottom of sprite
	y = other.y - (other.sprite_height/2) - sprite_height/2;
}
//right of square
if (position_meeting(x+(sprite_width/2), y, other)) {		//checks for center right of sprite
	x = other.x - (other.sprite_width/2) - sprite_width/2;
}
//left of square
if (position_meeting(x-(sprite_width/2), y, other)) {		//checks for center left of sprite
	x = other.x + (other.sprite_width/2) + sprite_width/2;
}
//top of square
if (position_meeting(x, y-(sprite_height/2), other)) {		//checks for cetner top of sprite
	y = other.y + (other.sprite_height/2) + sprite_height/2;
}*/


//sides
sqBottom = y + (sprite_height/2);
sqTop = y - (sprite_height/2);
sqRight = x + (sprite_width/2);
sqLeft = x - (sprite_width/2);

blkBottom = other.y + (other.sprite_height/2);
blkTop = other.y - (other.sprite_height/2);
blkRight = other.x + (other.sprite_width/2);
blkLeft = other.x - (other.sprite_width/2);


//Square Bottom Collision
//Square Bottom below Block Top and above Block Bottom
if (sqBottom > blkTop && sqBottom < blkBottom) {
	//Square Center Bottom colliding with Block
	/*if (position_meeting(x, sqBottom, other)) {
		y = blkTop - (sprite_height/2);
	}*/
	if (collision_line(sqLeft, sqBottom, sqRight, sqBottom, other, false, false)) {
		if (collision_line(blkLeft, blkTop, blkRight, blkTop, self, false, false)) {
			y = blkTop - (sprite_height/2);
			bottom_collision = true;
		}
		else {
			bottom_collision = false;	
		}
	}
	else {
		bottom_collision = false;	
	}
}
else {
	bottom_collision = false;	
}
//Square Top Collision
//Square Top above Block Bottom and below Block Top
if (sqTop < blkBottom && sqTop > blkTop) {
	//Square Center Top colliding with Block
	/*if (position_meeting(x, sqTop, other)) {
		y = blkBottom + (sprite_height/2);
	}*/
	if (collision_line(sqLeft, sqTop, sqRight, sqTop, other, false, false)) {
		if (collision_line(blkLeft, blkBottom, blkRight, blkBottom, self, false, false)) {
			y = blkBottom + (sprite_height/2);
			//speed = post_dash_speed;
			top_collision = true;
		}
		else {
			top_collision = false;	
		}
	}
	else {
		top_collision = false;	
	}
}
else {
	top_collision = false;	
}
//Square Right Collision
//Square Right past Block Left and not past Block Right
if (sqRight > blkLeft && sqRight < blkRight) {
	//Square Center Right colliding with Block
	/*if (position_meeting(sqRight, y, other)) {
		x = blkLeft - (sprite_width/2);
	}*/
	if (collision_line(sqRight, sqTop, sqRight, sqBottom, other, false, false)) {
		if (collision_line(blkLeft, blkTop, blkLeft, blkBottom, self, false, false)) {
			x = blkLeft - (sprite_width/2);
			//speed = post_dash_speed;
			right_collision = true;
		}
		else {
			right_collision = false;	
		}
	}
	else {
		right_collision = false;	
	}
}
else {
	right_collision = false;	
}
//Square Left Collsion
//Square Left past Block Right and not past Block Left
if (sqLeft < blkRight && sqLeft > blkLeft) {
	//Square Center Left colliding with Block
	/*if (position_meeting(sqLeft, y, other)) {
		x = blkRight + (sprite_width/2);
	}*/
	if (collision_line(sqLeft, sqTop, sqLeft, sqBottom, other, false, false)) {
		if (collision_line(blkRight, blkTop, blkRight, blkBottom, self, false, false)) {
			x = blkRight + (sprite_width/2);
			//speed = post_dash_speed;
			left_collision = true;
		}
		else {
			left_collision = false;	
		}
	}
	else {
		left_collision = false;	
	}
}
else {
	left_collision = false;	
}


//Extra Collision Events
if (top_collision) {
	if (!init_top_collision) {
		init_top_collision = true;
		speed = post_dash_speed;
	}
}
else {
	init_top_collision = false;	
}

if (right_collision) {
	if (!init_right_collision) {
		init_right_collision = true;
		speed = post_dash_speed;
	}
}
else {
	init_right_collision = false;	
}

if (left_collision) {
	if (!init_left_collision) {
		init_left_collision = true;
		speed = post_dash_speed;
	}
}
else {
	init_left_collision = false;	
}
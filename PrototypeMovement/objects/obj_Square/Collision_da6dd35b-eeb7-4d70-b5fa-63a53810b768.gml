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
//if (sqBottom > blkTop && sqBottom < blkBottom) {
//	//Square Center Bottom colliding with Block
//	/*if (position_meeting(x, sqBottom, other)) {
//		y = blkTop - (sprite_height/2);
//	}*/
//	if (collision_line(sqLeft, sqBottom, sqRight, sqBottom, other, false, false)) {
//		if (collision_line(blkLeft, blkTop, blkRight, blkTop, self, false, false)) {
//			y = blkTop - (sprite_height/2);
//			bottom_collision = true;
//		}
//		else {
//			bottom_collision = false;	
//		}
//	}
//	else {
//		bottom_collision = false;	
//	}
//}
//else {
//	bottom_collision = false;	
//}

if (sqBottom > blkTop && sqBottom < blkBottom &&		//sqBot inbetween blkTop and blkBot
collision_line(sqLeft, sqBottom, sqRight, sqBottom, other, false, false) &&		//sqBot colliding with blk
collision_line(blkLeft, blkTop, blkRight, blkTop, self, false, false)			//blkTop colliding with square
) {
	//y = blkTop - (sprite_height/2);
	bottom_collision = true;
}
else {
	bottom_collision = false;	
}

//Square Top Collision
//Square Top above Block Bottom and below Block Top
//if (sqTop < blkBottom && sqTop > blkTop) {
//	//Square Center Top colliding with Block
//	/*if (position_meeting(x, sqTop, other)) {
//		y = blkBottom + (sprite_height/2);
//	}*/
//	if (collision_line(sqLeft, sqTop, sqRight, sqTop, other, false, false)) {
//		if (collision_line(blkLeft, blkBottom, blkRight, blkBottom, self, false, false)) {
//			y = blkBottom + (sprite_height/2);
//			//speed = post_dash_speed;
//			top_collision = true;
//		}
//		else {
//			top_collision = false;	
//		}
//	}
//	else {
//		top_collision = false;	
//	}
//}
//else {
//	top_collision = false;	
//}

if (sqTop < blkBottom && sqTop > blkTop &&
collision_line(sqLeft, sqTop, sqRight, sqTop, other, false, false) &&
collision_line(blkLeft, blkBottom, blkRight, blkBottom, self, false, false)
) {
	//y = blkBottom + (sprite_height/2);
	//speed = post_dash_speed;
	top_collision = true;
}
else {
	top_collision = false;
}

//Square Right Collision
//Square Right past Block Left and not past Block Right
//if (sqRight > blkLeft && sqRight < blkRight) {
//	//Square Center Right colliding with Block
//	/*if (position_meeting(sqRight, y, other)) {
//		x = blkLeft - (sprite_width/2);
//	}*/
//	if (collision_line(sqRight, sqTop, sqRight, sqBottom, other, false, false)) {
//		if (collision_line(blkLeft, blkTop, blkLeft, blkBottom, self, false, false)) {
//			x = blkLeft - (sprite_width/2);
//			//speed = post_dash_speed;
//			right_collision = true;
//		}
//		else {
//			right_collision = false;	
//		}
//	}
//	else {
//		right_collision = false;	
//	}
//}
//else {
//	right_collision = false;	
//}

if (sqRight > blkLeft && sqRight < blkRight &&
collision_line(sqRight, sqTop, sqRight, sqBottom, other, false, false) &&
collision_line(blkLeft, blkTop, blkLeft, blkBottom, self, false, false)
) {
	//x = blkLeft - (sprite_width/2);
	//speed = post_dash_speed;
	right_collision = true;
}
else {
	right_collision = false;	
}

//Square Left Collsion
//Square Left past Block Right and not past Block Left
//if (sqLeft < blkRight && sqLeft > blkLeft) {
//	//Square Center Left colliding with Block
//	/*if (position_meeting(sqLeft, y, other)) {
//		x = blkRight + (sprite_width/2);
//	}*/
//	if (collision_line(sqLeft, sqTop, sqLeft, sqBottom, other, false, false)) {
//		if (collision_line(blkRight, blkTop, blkRight, blkBottom, self, false, false)) {
//			x = blkRight + (sprite_width/2);
//			//speed = post_dash_speed;
//			left_collision = true;
//		}
//		else {
//			left_collision = false;	
//		}
//	}
//	else {
//		left_collision = false;	
//	}
//}
//else {
//	left_collision = false;	
//}

if (sqLeft < blkRight && sqLeft > blkLeft &&
collision_line(sqLeft, sqTop, sqLeft, sqBottom, other, false, false) &&
collision_line(blkRight, blkTop, blkRight, blkBottom, self, false, false)
) {
	//x = blkRight + (sprite_width/2);
	//speed = post_dash_speed;
	left_collision = true;
}
else {
	left_collision = false;
}


//Collision Events

//Bottom
if (bottom_collision) {
	if (!right_collision && !left_collision) {
		y = blkTop - (sprite_height/2);
	}
	
	if (dash_cooldown_active) {					//effectively resets dash cooldown
		dash_cooldown_i = dash_cooldown_timer;	
	}
}

//Top
if (top_collision) {
	y = blkBottom + (sprite_height/2);
	
	if (!init_top_collision) {
		init_top_collision = true;
		speed = post_dash_speed;
		//vspeed = 0;
	}
}
else {
	init_top_collision = false;	
}

//Right
if (right_collision) {
	x = blkLeft - (sprite_width/2);
	
	if (!init_right_collision) {
		init_right_collision = true;
		speed = post_dash_speed;
		//hspeed = 0;
	}
}
else {
	init_right_collision = false;	
}

//Left
if (left_collision) {
	x = blkRight + (sprite_width/2);
	
	if (!init_left_collision) {
		init_left_collision = true;
		speed = post_dash_speed;
		//hspeed = 0;
	}
}
else {
	init_left_collision = false;	
}
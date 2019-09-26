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
	if (position_meeting(x, sqBottom, other)) {
		y = blkTop - (sprite_height/2);
	}
}
//Square Top Collision
//Square Top above Block Bottom and below Block Top
if (sqTop < blkBottom && sqTop > blkTop) {
	//Square Center Top colliding with Block
	if (position_meeting(x, sqTop, other)) {
		y = blkBottom + (sprite_height/2);
	}
}
//Square Right Collision
//Square Right past Block Left and not past Block Right
if (sqRight > blkLeft && sqRight < blkRight) {
	//Square Center Right colliding with Block
	if (position_meeting(sqRight, y, other)) {
		x = blkLeft - (sprite_width/2);
	}
}
//Square Left Collsion
//Square Left past Block Right and not past Block Left
if (sqLeft < blkRight && sqLeft > blkLeft) {
	//Square Center Left colliding with Block
	if (position_meeting(sqLeft, y, other)) {
		x = blkRight + (sprite_width/2);
	}
}
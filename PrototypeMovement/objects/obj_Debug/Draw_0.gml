//draw_self();
draw_set_color(c_black);
draw_text_color(x, y, "Speed: " + line1, c1, c1, c1, c1, 1);
draw_text_color(x, y + spacer, "Horizontal Speed: " + line2, c2, c2, c2, c2, 1);
draw_text_color(x, y + 2*spacer, "Vertical Speed: " + line3, c3, c3, c3, c3, 1);
draw_text_color(x, y + 3*spacer, "Gravity: " + line4, c4, c4, c4, c4, 1);
draw_text_color(x, y + 4*spacer, "Direction: " + line5, c5, c5, c5, c5, 1);
draw_text_color(x, y + 5*spacer, line6, c6, c6, c6, c6, 1);
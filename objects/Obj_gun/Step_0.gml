//positions gun
x = Obj_player.x + lengthdir_x(5, Obj_player.image_angle);
y = Obj_player.y + lengthdir_y(5, Obj_player.image_angle);

//rotates gun according to mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

if (image_angle > 0 && image_angle < 180) {
	layer = layer_get_id("gun_back")}
else {
	layer = layer_get_id("gun_front")}
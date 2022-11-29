/// @description Insert description here
#macro view view_camera[0]
		
camera_set_view_size(view, View_width, View_height)

if(instance_exists(Obj_player)) { //camera follows player but not outside room
var _x = clamp(Player.x-View_width/2, 0, room_width-View_width);
var _y = clamp(Player.y-View_height/2, 0, room_height-View_height);
var _cur_x = camera_get_view_x(view);
var _cur_y = camera_get_view_y(view);

var _spd = 0.1; //camera speed and interpolation
	camera_set_view_pos(view,
	lerp(_cur_x, _x, _spd),
	lerp(_cur_y, _y, _spd));
}

else if(instance_exists(Obj_menu)) {
camera_set_view_size(view, View_width*2, View_height*2)
	
var _x = clamp(Obj_menu.x-View_width * 2, 0, room_width-View_width);
var _y = clamp(Obj_menu.y-View_height * 2, 0, room_height-View_height);
var _cur_x = camera_get_view_x(view);
var _cur_y = camera_get_view_y(view);
var _spd = 0.1; //camera speed and interpolation

	camera_set_view_pos(view,
	lerp(_cur_x, _x, _spd),
	lerp(_cur_y, _y, _spd))
}
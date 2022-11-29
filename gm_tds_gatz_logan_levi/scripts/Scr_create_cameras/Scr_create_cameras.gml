function create_cameras(Player_id) { 
	show_debug_message("cam created")
	return instance_create_layer(Player_id.x, Player_id.y, "Instances_1", Obj_camera, {Player : Player_id});
}
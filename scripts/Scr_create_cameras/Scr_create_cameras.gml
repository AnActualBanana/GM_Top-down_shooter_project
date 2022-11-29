function create_cameras(Player_id) { 
var camera = instance_create_layer(Player_id.x, Player_id.y, "Instances_1", Obj_camera);
with camera {Player = Player_id}
}
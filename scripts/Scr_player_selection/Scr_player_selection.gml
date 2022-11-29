//script will house our functions for selecting players for various things
function create_player_list () { // populates a variable length array with the ids of all living players
	var player_list = [];
	if Obj_game_manager.Player_ids.Player_1[1] = "alive" {array_push(player_list, Obj_game_manager.Player_ids.Player_1[0])};
	if Obj_game_manager.Player_ids.Player_2[1] = "alive" {array_push(player_list, Obj_game_manager.Player_ids.Player_2[0])};
	if Obj_game_manager.Player_ids.Player_3[1] = "alive" {array_push(player_list, Obj_game_manager.Player_ids.Player_3[0])};
	if Obj_game_manager.Player_ids.Player_4[1] = "alive" {array_push(player_list, Obj_game_manager.Player_ids.Player_4[0])};
	return player_list;
};

function random_player(){ //selects player at random.
	player_list = create_player_list();
	return player_list[(irandom_range(0, (array_length(player_list) - 1)))]
};

function enemy_targeting_closest(enemy) {
	return instance_nearest(x, y, Obj_player);
};
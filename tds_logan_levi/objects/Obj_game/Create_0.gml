/// @description Game start
//multiplayer code
rollback_define_input({
left : ord("A"),
right : ord("D"),
up : ord("W"),
down: ord("S"),
r : ord("R"),
lshift : vk_lshift,
lctrl : vk_lcontrol,
space : vk_space,
lclick : mb_left,
}); 
rollback_define_player(Obj_player, "Instances_1")
if (!rollback_join_game())
{
	rollback_create_game(2, false);
} 

rollback_use_random_input(false);
rollback_display_events(true);

Player_ids = { //stores player information [id, alive status]
	Player_1 : [undefined, "not_created"],
	Player_2 : [undefined, "not_created"],
	Player_3 : [undefined, "not_created"],
	Player_4 : [undefined, "not_created"],
};


number_of_players_alive = 0;
global.highest_score = 0;
/// @description Game start
rollback_define_player(Obj_player, "Instances_1");
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

if (!rollback_join_game())
{
	rollback_create_game(1, false);
} 
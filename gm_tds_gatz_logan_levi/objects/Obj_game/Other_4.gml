if room == Room1 {
rollback_define_player(Obj_player, "Instances_1")
if (!rollback_join_game())
{
	rollback_create_game(2, false);
}

rollback_use_random_input(false);
rollback_display_events(true);
}
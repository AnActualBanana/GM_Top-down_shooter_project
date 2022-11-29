//declares important game variables, which are used and can be changed, primarily by the wave scripts
Current_score = 0
enemies_killed_round = 0;
global.enemies_spawned_round = 0 // enemies spawned this round
global.enemies_alive = 0 // current number of enemies alive
global.enemies_killed_total = 0 // total enemies killed
global.highest_score = 0 // high score (persists) 
global.wave = 1; //current wave
Round_begin = false
Next_wave = false;
minSpawn = 2;
maxSpawn = 4;

enum Game_state {
in_round,
not_in_round,
}
Game_state = Game_state.in_round

Shop_open = false;


Player_ids = { //stores player information [id, alive status]
	Player_1 : [undefined, "not_created"],
	Player_2 : [undefined, "not_created"],
	Player_3 : [undefined, "not_created"],
	Player_4 : [undefined, "not_created"],
};


number_of_players_alive = 0;

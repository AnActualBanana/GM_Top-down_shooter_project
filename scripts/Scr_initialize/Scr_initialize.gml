//randomizes the seed
randomize();
//creates player states, then sets state to idle
enum Player_state {
	idle,
	walking,
	sprinting,
	crouched,
	interacting,
	in_menu,
	inactive,
}
Player_state = 0

//creates states for currently equipped weapon

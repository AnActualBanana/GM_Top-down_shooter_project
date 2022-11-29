if keyboard_check_pressed(ord("S")) and menu_index < 4 {menu_index++};
if keyboard_check_pressed(ord("W")) and menu_index > 0 {menu_index--};
// buttons
if menu == "main_menu" {
button[0] = "New Game";
button[1] = "Quit";

}

else if menu == "player_select" {
button[0] = "1 Player";
button[1] = "2 Players";
button[2] = "3 Players";
button[3] = "4 Players";
button[4] = "Back";
}

else if menu == "lobby" {
button[0] = "Ready";
button[1] = "Back"
}
buttons = array_length_1d(button);
if rollback_game_running && room == Lobby {
room_goto(2);
}
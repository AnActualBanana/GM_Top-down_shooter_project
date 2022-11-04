//gets camera info
var cx = camera_get_view_x(view_wport[0] * 2);

var cy = camera_get_view_y(view_hport[0] * 2);

var cw = camera_get_view_width(view_camera[0]);

draw_set_font(font_main);

draw_set_color(c_black);
if instance_exists (Obj_player) {
//draws some interface stuff
draw_text(cx+1600,cy+750,"Wave: " + string(global.wave));
draw_text(cx+1600,cy+775,"Accuracy: " + string(Obj_handgun.Final_accuracy));
draw_text(cx+1600,cy+800,"Score: " + string(Obj_player.Current_score));
draw_text(cx+1600,cy+825,"Health: " + string(Obj_player.Current_health));
draw_text(cx+1600,cy+850,"Stamina: " + string(Obj_player.Current_stamina));
draw_text(cx+1600,cy+875,"Magazine: " + string(Obj_handgun.Current_ammo));
draw_text(cx+1600,cy+900,"Reserve: " + string(Obj_handgun.Reserve_ammo));
draw_text(cx+1600,cy+925,"Player_1_id: " + string(Obj_player.Player_ids.Player_1));
}
//Faces same angle as player
image_angle = obj_player_parent.image_angle;

//Stops the animation if the player stops moving
if (image_speed = 0)
{
image_index = 6;	
}

//Plays footstep sound when the foot hits the ground during the animation
if (image_index = 10)
{
audio_play_sound(snd_step_1,1,false);
}

if (image_index = 19)
{
audio_play_sound(snd_step_2,1,false);
}
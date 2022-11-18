//Alarm to play sound of casing hitting the ground according to weapon
if (instance_exists(obj_player_rifle))
{
audio_play_sound(snd_brass_casing,1,false);
}

if (instance_exists(obj_player_pistol))
{
audio_play_sound(snd_brass_casing,1,false);
}

if (instance_exists(obj_player_shotgun))
{
audio_play_sound(snd_plastic_casing,1,false);
}
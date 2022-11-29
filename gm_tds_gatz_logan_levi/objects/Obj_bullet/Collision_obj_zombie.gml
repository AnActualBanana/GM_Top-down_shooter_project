//Bullet will do different damage depending on weapon equipped

//Create blood mist
with other instance_create_depth(x+random_range(-50,50), y+random_range(-50,50), -1, obj_blood_mist);

if (instance_exists(obj_player_rifle))
{
other.enemy_health -= 30;
audio_play_sound(snd_bullet_impact_enemy,1,false);
instance_destroy();
}

if (instance_exists(obj_player_pistol))
{
other.enemy_health -= 45;
audio_play_sound(snd_bullet_impact_enemy,1,false);
instance_destroy();
}

if (instance_exists(obj_player_shotgun))
{
other.enemy_health -= 20;
audio_play_sound(snd_bullet_impact_enemy,1,false);
instance_destroy();
}
// Checks wall collision

// Horizontal Collision
if (place_meeting(x + hsp, y, obj_wall))
if (visible = true)
{
    while (!place_meeting(x + sign(hsp), y, obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
    vsp = 0;
	audio_play_sound(snd_bullet_impact,1,false);
	instance_destroy();
}
x += hsp;

// Vertical Collision
if (place_meeting(x, y + vsp, obj_wall))
if (visible = true)
{
    while (!place_meeting(x, y + sign(vsp), obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
    hsp = 0;
	audio_play_sound(snd_bullet_impact,1,false);
	instance_destroy();
}
y += vsp;
var myResolutionWidth = display_get_width()/2;
var myResolutionHeight = display_get_height()/2;
var myMagnifyingFactor = 2;

view_visible[0]=true;

var fullScreen = false;

if (!fullScreen)
{
    view_wport[0]=myResolutionWidth*myMagnifyingFactor;
    view_hport[0]=myResolutionHeight*myMagnifyingFactor;
   
    surface_resize(application_surface,myResolutionWidth*myMagnifyingFactor, myResolutionHeight*myMagnifyingFactor);
    window_set_size(myResolutionWidth, myResolutionHeight);
    window_center();
}
else
{
    displayWidth = display_get_width();
    displayHeight = display_get_height();

    view_wport[0]=displayWidth;
    view_hport[0]=displayHeight;
   
    surface_resize(application_surface, displayWidth, displayHeight);
    window_set_fullscreen(true);
}
scr_initialize()
instance_create_layer(room_width/2, room_height/2, "Instances_1", Obj_player);
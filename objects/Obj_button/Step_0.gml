/// @description Insert description here
var _hover = get_hover(x, y, Width, Height);
var _click = _hover && mouse_check_button_pressed(mb_left);

// Hover
Hover = lerp(Hover, _hover, 0.1);
y = lerp(y, ystart - _hover * 8, 0.1);

// Click
if (_click && Script >= 0) {
	script_execute(Script);
}
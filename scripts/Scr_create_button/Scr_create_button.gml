function create_button(x, y, Width, Height, Text, Script){
// Variables from arguments
var _x = x;
var _y = y;
var _width = Width;
var _height = Height;
var _text = Text;
var _script = Script;

// Create button
var _button = instance_create_layer(_x, _y, "Instances_1", Obj_button);

// Set values
with (_button) {
	_button.Width = _width;
	_button.Height = _height;
	_button.Text = _text;
	_button.Script = _script;
}

return _button;
}
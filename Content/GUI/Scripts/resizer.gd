extends Button

@export
var target : Container

@export_range(0, 2000)
var starting_custom_minimum_size : float = 200

func _ready() -> void:
	keep_pressed_outside = true
	target.custom_minimum_size.x = starting_custom_minimum_size
	
func _process(_delta: float) -> void:
	if not button_pressed:
		return
	
	var mouse_position = get_local_mouse_position()
	
	var custom_minimum_size_x = target.custom_minimum_size.x + mouse_position.x
	# Fix sticky effect
	target.custom_minimum_size.x = clamp(custom_minimum_size_x, target.get_minimum_size().x, 1000000)

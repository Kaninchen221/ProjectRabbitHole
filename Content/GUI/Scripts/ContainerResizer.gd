extends Button

@export
var target : Container

@export_range(0, 2000)
var starting_custom_minimum_size : float = 200

@export_range(-1, 1, 2)
var direction : float = 1

var max_custom_minimum_size : float = 6000 :
	get():
		var viewport = get_viewport()
		if is_instance_valid(viewport):
			return clamp(max_custom_minimum_size, 0, get_viewport().size.x / 2)
		else:
			return max_custom_minimum_size

func _ready() -> void:
	keep_pressed_outside = true
	target.custom_minimum_size.x = starting_custom_minimum_size
	
func _process(_delta: float) -> void:
	if not button_pressed:
		return
	
	var mouse_position = get_local_mouse_position()
	
	var custom_minimum_size_x = target.custom_minimum_size.x + mouse_position.x * direction
	# Fix sticky effect
	target.custom_minimum_size.x = clamp(custom_minimum_size_x, 
										target.get_minimum_size().x, 
										max_custom_minimum_size)
	#print(target.custom_minimum_size.x, " ", max_custom_minimum_size)

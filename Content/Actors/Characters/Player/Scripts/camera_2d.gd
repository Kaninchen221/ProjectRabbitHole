extends Camera2D


@export var zoom_min = 2.0
@export var zoom_max = 6.0
@export var zoom_default = 3.0

@onready var zoom_current = zoom_default

func get_mouse_wheel_input():
	var zoom_camera_in = int(Input.is_action_just_pressed("Player_Zoom_Camera_In"))
	var zoom_camera_out = int(Input.is_action_just_pressed("Player_Zoom_Camera_Out"))
	return zoom_camera_in - zoom_camera_out

func get_mouse_wheel_reset_input() -> bool:
	var value = int(Input.is_action_just_pressed("Player_Zoom_Camera_Reset"))
	return value

func _process(_delta: float) -> void:
	
	var mouse_wheel_input = get_mouse_wheel_input()
	zoom_current += mouse_wheel_input * PI / 16
	zoom_current = clamp(zoom_current, zoom_min, zoom_max)
	
	if get_mouse_wheel_reset_input():
		zoom_current = zoom_default
	
	set_zoom(Vector2(zoom_current, zoom_current))

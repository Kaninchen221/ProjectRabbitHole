extends Node2D

@export
var source : Camera2D

@onready 
var previous_zoom : Vector2 = source.get_zoom()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if previous_zoom == source.get_zoom():
		return

	var diff = source.get_zoom() - previous_zoom
	set_scale(get_scale() + diff)
	previous_zoom = get_scale()

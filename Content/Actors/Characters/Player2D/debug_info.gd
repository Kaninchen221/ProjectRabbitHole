extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#var text = "FPS 
	set_text("FPS: %d" % Engine.get_frames_per_second())
	pass

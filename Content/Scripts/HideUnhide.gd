extends CanvasItem

var bodies_entered = 0
@export_range(0, 1) var max_alpha : float = 1
@export_range(0, 1) var current_alpha : float = max_alpha :
	set(value):
		current_alpha = clamp(value, min_alpha, max_alpha)
	
@export_range(0, 1) var min_alpha : float = 0.392 :
	set(value):
		min_alpha = clamp(value, 0, max_alpha)

@export_range(-1, 1, 2) var direction = 1
@export_range(0, 100) var time_modifier : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bodies_entered > 0:
		current_alpha -= delta * time_modifier
	else:
		current_alpha += delta * time_modifier
		
	current_alpha = clamp(current_alpha, min_alpha, max_alpha)
	set_self_modulate(Color(1, 1, 1, current_alpha))
	#print("Current alpha: ", current_alpha, " Bodies: ", bodies_entered)


func _on_visibility_body_entered(_body: Node2D) -> void:
	bodies_entered += 1


func _on_visibility_body_exited(_body: Node2D) -> void:
	bodies_entered -= 1

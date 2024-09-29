extends Sprite2D

var bodies_entered = 0
var max_alpha = 1
var current_alpha = max_alpha
var min_alpha = 0.392

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bodies_entered > 0:
		current_alpha -= delta * 2
	else:
		current_alpha += delta * 2
		
	current_alpha = clamp(current_alpha, min_alpha, max_alpha)
	%Tree.set_self_modulate(Color(1, 1, 1, current_alpha))
	#print("Current alpha: ", current_alpha, " Bodies: ", bodies_entered)


func _on_visibility_body_entered(_body: Node2D) -> void:
	bodies_entered += 1


func _on_visibility_body_exited(_body: Node2D) -> void:
	bodies_entered -= 1

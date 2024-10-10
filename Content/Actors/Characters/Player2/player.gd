extends CharacterBody2D


const SPEED = 100.0


var target_position = position
func _physics_process(delta: float) -> void:

	var player_click = bool(Input.is_action_pressed("Player_Click"))

	if player_click:
		target_position = owner.get_local_mouse_position()
	
	var movement_direction = (target_position - position).normalized()
	velocity = movement_direction * SPEED
	
	var diff = target_position - position
	if diff.length() < 2:
		return

	var collided = move_and_slide()
	if collided:
		velocity = Vector2(0, 0)
		target_position = position

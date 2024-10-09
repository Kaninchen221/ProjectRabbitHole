extends CharacterBody2D


const SPEED = 100.0


var target_position = position
func _physics_process(delta: float) -> void:

	var player_click = bool(Input.is_action_pressed("Player_Click"))
	#print("Player Click: ", player_click)

	if player_click:
		target_position = owner.get_local_mouse_position()
	
	#print("Current position: ", position, " Target position: ", target_position)
	
	var movement_direction = (target_position - position).normalized()
	velocity = movement_direction * SPEED
	#if velocity.length() < 10:
	#	velocity = Vector2()
	
	var diff = target_position - position
	#print(diff.length())
	if diff.length() < 2:
		return

	move_and_slide()

extends CharacterBody2D

const MAX_SPEED = 30
var speed = 0
const ACCELERATION = 1500
const FRICTION = 600

var movement_direction = Movement_Direction.Idle
var last_movement_direction = Movement_Direction.Idle

func _physics_process(delta):
	movement(delta)
	movement_direction = get_movement_direction()
	animations()
	last_movement_direction = movement_direction

func get_input():
	var input = Vector2.ZERO
	var movement_right = int(Input.is_action_pressed("Player_Move_Right"))
	var movement_left = int(Input.is_action_pressed("Player_Move_Left"))
	var movement_up = int(Input.is_action_pressed("Player_Move_Up"))
	var movement_down = int(Input.is_action_pressed("Player_Move_Down"))
	
	var movement_sum = movement_down + movement_left + movement_right + movement_up
	if movement_sum > 1:
		return Vector2.ZERO
	
	input.x = movement_right - movement_left
	input.y = movement_down - movement_up
	
	return input.normalized()

func movement(delta):
	var input = get_input()
	
	#if input == Vector2.ZERO and velocity.length() > 0.01:
	#	velocity -= velocity.normalized() * (FRICTION * delta)
	#else:
	#	velocity += input * ACCELERATION * delta
	#	velocity = velocity.limit_length(MAX_SPEED)
	
	if input.x == 0:
		velocity.x = 0
		
	if input.y == 0:
		velocity.y = 0
		
	if input != Vector2.ZERO:
		velocity += input * ACCELERATION * delta
		velocity = velocity.limit_length(MAX_SPEED)
	
	var collided = move_and_slide()
	#if collided:
		#velocity = Vector2.ZERO

enum Movement_Direction {Idle, Up, Right, Down, Left}
func get_movement_direction():
	if velocity.x > 0:
		return Movement_Direction.Right
	elif velocity.x < 0:
		return Movement_Direction.Left
	elif velocity.y < 0:
		return Movement_Direction.Up
	elif velocity.y > 0:
		return Movement_Direction.Down
	else:
		return Movement_Direction.Idle

func animations():
	match movement_direction:
		Movement_Direction.Idle:
			match last_movement_direction:
				Movement_Direction.Up:
					%AnimatedSprite2D.play("Idle_Up", 0)
				Movement_Direction.Right:
					%AnimatedSprite2D.play("Idle_Right", 0)
				Movement_Direction.Down:
					%AnimatedSprite2D.play("Idle_Down", 0)
				Movement_Direction.Left:
					%AnimatedSprite2D.play("Idle_Left", 0)
					
		Movement_Direction.Up:
			%AnimatedSprite2D.play("Walking_Up")
		Movement_Direction.Right:
			%AnimatedSprite2D.play("Walking_Right")
		Movement_Direction.Down:
			%AnimatedSprite2D.play("Walking_Down")
		Movement_Direction.Left:
			%AnimatedSprite2D.play("Walking_Left")
			

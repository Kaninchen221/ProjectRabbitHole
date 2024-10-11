@tool
extends PointLight2D

@export var curve: Curve
@export_range(0, 1) var min_light_energy : float
@export_range(0, 1) var max_light_energy : float
@export_range(-1, 1, 2) var direction_light_energy : float
@export var pause : bool = true
@export_range(0.0, 100.0) var time_modifier : float
@export_range(0, 1) var time : float

func _process(delta: float) -> void:
	if not is_visible_in_tree():
		set_energy(0)
		return
	
	if time >= 1:
		time = 1
		direction_light_energy = -1
	elif time <= 0:
		time = 0
		direction_light_energy = 1
	
	if not pause:
		time += delta * time_modifier * direction_light_energy
	
	set_energy(calculate_light_energy())

func calculate_light_energy():
	var sampled_value = curve.sample(time)
	return sampled_value * (max_light_energy - min_light_energy) + min_light_energy

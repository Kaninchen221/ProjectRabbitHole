extends PointLight2D

@export var curve: Curve
@export_range(0, 1) var min_light_energy : float
@export_range(0, 1) var max_light_energy : float
@export_range(0, 1) var time : float
@export_range(-1, 1, 2) var direction_light_energy : float
@export var pause : bool = true
@export_range(0.0, 100.0) var time_modifier : float

var diff_light_energy
func _ready() -> void:
	diff_light_energy = max_light_energy - min_light_energy

func _process(delta: float) -> void:
	if time >= 1:
		time = 1
		direction_light_energy = -1
	elif time <= 0:
		time = 0
		direction_light_energy = 1
	
	if not pause:
		time += delta * time_modifier * direction_light_energy
	
	var sampled_value = curve.sample(time)
	var current_light_energy = sampled_value * diff_light_energy + min_light_energy
	
	set_energy(current_light_energy)

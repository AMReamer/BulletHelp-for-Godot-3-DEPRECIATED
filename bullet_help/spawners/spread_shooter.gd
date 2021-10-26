# Creates a spread on ready as defined in editor
# Creates children that will fire shots instead of it.
class_name SpreadShooter
extends Spawner

# All variables match the spread function
export (float) var theta_degrees: float = 0 # Theta, total angle of spread
export (int) var num_shots: int = 2 # num_shots, number of shots
export (float) var center: float = 0 # center, middle angle of the spread

func _init():
	self_fire = false # Does not 

# Called when the node enters the scene tree for the first time.
func _ready():
	spread(theta_degrees, num_shots, center)

# Fires the bullet adjusted by random angle
# This applies in both the positive and negative direction
class_name SpawnScatterAngle
extends SpawnerMod


export (float) var angle_range_degrees: float = 0 # range from -angle_range to angle_range

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

# Offsets the firing direction by a random angle
func mod_shot(shot: Node):
	var angle: float = rng.randf_range(-angle_range_degrees, angle_range_degrees)
	shot.velocity = shot.velocity.rotated(deg2rad(angle))

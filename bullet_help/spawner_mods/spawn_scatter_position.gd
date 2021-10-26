# Fires the bullet adjusted by random position offset
# This applies in both the positive and negative direction
class_name SpawnScatterPosition
extends SpawnerMod


export (Vector2) var position_range := Vector2.ZERO # range from -position_range to position_range

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

# Offsets the initial position by a random position
func mod_shot(shot: Node):
	var offset := Vector2.ZERO
	offset.x = rng.randi_range(-position_range.x, position_range.x)
	offset.y = rng.randi_range(-position_range.y, position_range.y)
	shot.position += offset

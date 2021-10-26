# Sets the velocity to the given value
# Ideally used for more complex spawn behavior
class_name SpawnSetVelocity
extends SpawnerMod

export (Vector2) var velocity: Vector2 = Vector2.ZERO # What to set the velocity to

func mod_shot(shot: Node):
	shot.velocity = velocity

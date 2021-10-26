# Offsets the position, angle, and scale of the bullets spawn point by this nodes position and rotation
class_name SpawnOffset
extends SpawnerMod


# Set the rotation, position, and scale of this node to modify the shot
func mod_shot(shot: Node):
	shot.position += position
	shot.velocity = shot.velocity.rotated(rotation)
	shot.scale.x *= scale.x
	shot.scale.y *= scale.y

# Moves the bullet in a sine wave
# Treats the bullets starting placement as the initial position
class_name ModSineWave
extends ModSine


export (Vector2) var axis := Vector2(0, 1) # Axis wave oscillates upon
export (bool) var along_velocity := true # Have it oscillate perpendicular to velocity as the axis


# Changes position
func update_value(change):
	if (along_velocity):
		axis = Vector2(-target.velocity.y, target.velocity.x).normalized()
	
	target.position += axis * change

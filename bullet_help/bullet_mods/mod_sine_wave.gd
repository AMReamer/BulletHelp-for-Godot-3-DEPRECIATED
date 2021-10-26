# Moves the bullet in a sine wave
# Treats the bullets starting placement as the initial position
class_name ModSineWave
extends ModSine


export (Vector2) var axis := Vector2(0, 1) # Axis wave oscillates upon


# Changes position
func update_value(change):
	target.position += axis * change

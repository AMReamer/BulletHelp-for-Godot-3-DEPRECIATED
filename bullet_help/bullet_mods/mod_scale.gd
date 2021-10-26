# Scales the bullet at a constant rate
# This only changes the scale value at a constant rate
class_name ModScale
extends BulletMod


export (Vector2) var scale_rate := Vector2.ZERO # Rate of change of scale per second
export (bool) var keep_positive := true # Keeps the scale value positve, will not let it go below zero

# Moddify scale
func move(delta):
	target.scale += scale_rate * delta
	# Apply keep_positive
	target.scale.x *= float(!keep_positive ||  target.scale.x >= 0)
	target.scale.y *= float(!keep_positive ||  target.scale.y >= 0)

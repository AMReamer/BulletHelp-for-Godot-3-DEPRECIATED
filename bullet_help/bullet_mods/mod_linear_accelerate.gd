# Applies acceleration along a vector
class_name ModLinearAccelerate
extends BulletMod

export (Vector2) var acceleration := Vector2(0, 0) # Pixels / Second^2

# Applies simple acceleration
func force(delta):
	# Remeber, those pesky kinematics are accounted for already
	target.velocity += acceleration * delta

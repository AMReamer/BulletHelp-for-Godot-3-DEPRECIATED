# Applies a constant acceleration towards zero
# It is recommended that this is orderd as the lowest bullet mod to prevent it from being cancelled out when reaching zero
class_name ModConstantDrag
extends BulletMod


export (float) var magnitude: float = 0


func force(delta):
	target.velocity = target.velocity.move_toward(Vector2.ZERO, magnitude * delta)

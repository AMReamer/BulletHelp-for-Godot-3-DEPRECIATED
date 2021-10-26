# Accelerate towards a specified point
class_name ModAttract
extends BulletMod

export (float) var magnitude: float = 0 # Speed at which the bullet move towards point, set negative to repel
export (Vector2) var force_point: Vector2 = Vector2.ZERO # Point to accelerate towards


func force(delta):
	# (direction) * magnitude * time
	target.velocity += (force_point - target.position).normalized() * magnitude * delta

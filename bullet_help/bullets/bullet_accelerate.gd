# Bullet with an acceleration property
class_name BulletAccelerate
extends BulletLinear


export (Vector2) var acceleration: Vector2 = Vector2.ZERO


# Accelerates
# Same as ModLinearAccelerate
func force(delta):
	velocity += acceleration * delta

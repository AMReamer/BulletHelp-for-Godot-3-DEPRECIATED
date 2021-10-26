# Move towards a specified point
class_name ModTowards
extends BulletMod

export (float) var speed: float = 0 # Speed at which the bullet move towards point, set negative to move away
export (Vector2) var move_point: Vector2 = Vector2.ZERO # Point to move towards


# Move towards point
func move(delta: float):
	# (direction) * speed * time
	target.position += (move_point - target.position).normalized() * speed * delta

# Moves bullet in single direction
class_name ModLinearMove
extends BulletMod


export(Vector2) var velocity := Vector2(0,0) # Velocity to modify bullet

# Moves by velocity
func move(delta):
	target.position += velocity * delta

# Keeps the bullet roated towards the direction of its movement
# Accounts for the fact taht velocity might not match effective movement
class_name ModFaceMovement
extends ModFaceVelocity

var last_position := Vector2(0,0)

func _enter_tree():
	last_position = target.position

func move(delta):
	call_deferred("face")

# Rotates so that the bullet's facing the direction of velocity
func face():
	var effective_velocity: Vector2 = target.position - last_position
	target.rotation = Vector2(1,0).angle_to(effective_velocity)
	last_position = target.position

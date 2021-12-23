# Keeps the bullet roated towards the direction it's moving
class_name ModFaceVelocity
extends BulletMod


func move(delta):
	call_deferred("face")

# Rotates so that the bullet's facing the direction of velocity
func face():
	target.rotation = Vector2(1,0).angle_to(target.velocity)

# Accelerates along direction of motion
class_name ModStaticAcceleration
extends BulletMod

export (float) var acceleration: float = 0 # Pixels / Second^2

# Applies simple acceleration along direction of velocity
func force(delta):
	target.velocity += target.velocity.normalized() * acceleration * delta

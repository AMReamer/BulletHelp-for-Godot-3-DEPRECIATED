# Apply velocity as separate property
class_name PropertyVelocity
extends BulletProperty


# var Velocity is obviously velocity


# Moves by velocity
# Similar to ModLinearMove
func move(delta):
	property_target.position += velocity * delta

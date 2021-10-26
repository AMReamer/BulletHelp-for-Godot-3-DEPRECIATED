# Apply acceleration as separate property
class_name PropertyAccelerate
extends BulletProperty

# var velocity is rate of acceleration

# accelerates by velocity
# Similar to ModLinearAccelerate
func force(delta):
	property_target.velocity += velocity * delta

# Apply scale rate as separate property
class_name PropertyScale
extends BulletProperty


# var velocity is rate of scale
export (bool) var keep_positive := true # Keeps the scale value positve, will not let it go below zero


# Scales by velocity as rate
# Similar to ModScale
func move(delta):
	property_target.scale += velocity * delta
	# Apply keep_positive
	target.scale.x *= float(!keep_positive ||  target.scale.x >= 0)
	target.scale.y *= float(!keep_positive ||  target.scale.y >= 0)

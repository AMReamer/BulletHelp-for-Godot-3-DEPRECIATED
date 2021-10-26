# Scales while preserving the scale of all chilren
# Effectively only scales space between children
# Useful for having a growing shape pattern
class_name ModShapeScale
extends ModScale


# Moddify scale, but preserve children scale
func move(delta):
	# Backups global scale of each child to preseve their local scaling
	var backup := {}
	for child in target.get_children():
		backup[child] = child.global_scale
	
	# Scale
	target.scale += scale_rate * delta
	
	# Preserve origional scale of children
	for child in target.get_children():
		child.global_scale = backup[child]


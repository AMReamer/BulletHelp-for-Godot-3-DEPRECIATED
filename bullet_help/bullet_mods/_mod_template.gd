# This is a template that can be used for bullet mods
class_name _ModTemplate
extends BulletMod

# Called every frame using delta (same as _process)
# Use this to sfely apply movement casued by this mod
func move(delta):
	# var speed = Vector2(100, 0)
	# target.position += velocity * delta
	pass

# Called every frame using delta (same as _process)
# Use to safely apply acceleration casued by this mod
func force(delta):
	# var acceleration = Vector2(0,9.8)
	# target.velocity += acceleration * delta
	pass

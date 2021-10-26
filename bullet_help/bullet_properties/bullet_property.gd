# All child mods modify this as if it were a bullet
# This object however modifies the bullet normally
# Only the designated property (called velocity) will effect the bullet
# This allows more general impact on vectors
# Reccomended that child mods are all acceleration mods
class_name BulletProperty
extends BulletMod


export(Vector2) var velocity := Vector2(0,0) # Velocity to modify bullet property


var property_target: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var true_target = target
	
	self.target = self # sets target of self and all children to the bullet
	lock_target = true # Prevents parent in compound bullets from being modified by children
	self.target = true_target # Sets property_target

# Updates property_target even when locked
# This however still doesn't set children when locked keeping their target on this node
func set_bullet_mod_target(new_target):
	.set_bullet_mod_target(new_target)
	property_target = new_target

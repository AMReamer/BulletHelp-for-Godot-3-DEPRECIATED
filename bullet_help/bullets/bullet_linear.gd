# Generic bullet
# Base behavior of moving in single direction
# This is modified by all children
class_name BulletLinear
extends BulletMod

export(Vector2) var velocity := Vector2(0,0) # Velocity to modify bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	self.target = self # sets target of self and all children to the bullet
	lock_target = true # Prevents parent in compound bullets from being modified by children

# Moves
# Same as ModLinearMove
func move(delta):
	target.position += velocity * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mod_bullet_force(delta)
	mod_bullet_move(delta)

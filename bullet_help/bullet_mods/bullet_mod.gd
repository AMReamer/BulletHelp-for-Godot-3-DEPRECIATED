# Everything is a bullet mod
# Each bullet mod modifies a bullets movement
class_name BulletMod
extends Node2D

var target: Node2D = self setget set_bullet_mod_target # This is the bullet being modified 
var lock_target := false # Prevents anything modifying target
var mod_list := [] # Array of all child bullet_mods
var mod_list_index := -1 # Where you are in parent list

func _enter_tree():
	var parent = get_parent()
	# Adds self to parents mod_list
	if "mod_list" in parent:
		mod_list_index = parent.mod_list.size()
		parent.mod_list.append(self)
	
	# Gets parents target
	if parent != null && parent.is_class("BulletMod"):
		# Inherents parents target
		self.target = parent.target

func _exit_tree():
	# Remove from parent list
	if mod_list_index > -1:
		get_parent().mod_list.remove(mod_list_index)
		mod_list_index = -1

# Handles acceleration
# Apply acceleration directly, kinematic acceleration is accounted for as long as delta is used
func force(_delta: float):
	pass

# Handles linear movement
func move(_delta: float):
	pass

# Calls flip() on all bullet mod children that have that method
# This causes a flip on switch mods
# See ModSwitch
func flip():
	for mod in mod_list:
		mod.flip()

# Setget for target
# Updates target of self and children
func set_bullet_mod_target(new_target):
	if lock_target:
		# Prevent modification
		return
	
	target = new_target
	for child in mod_list:
		child.target = new_target

func mod_bullet_force(delta: float):
	# Call force if there's a target
	if target != null:
		# This accounts for kinematic acceleration
		# This prevents acceleration from being locked to framerate
		# Since all movement is handled as a change in position,
		# The proper effect of acceleration is [position += (a/2) * t^2]
		# Since acceleration is handled by modifying velocity,
		# This accounts for the 1/2
		var derived_delta = delta / 2
		
		force(derived_delta)
		call_deferred("force", derived_delta)
	
	# Call children force
	for child in mod_list:
		child.mod_bullet_force(delta)

func mod_bullet_move(delta: float):
	# Call move if there's a target
	if target != null:
		move(delta)
	
	# Call children move
	for child in mod_list:
		child.mod_bullet_move(delta)

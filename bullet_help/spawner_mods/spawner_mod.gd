# Manipulates bullets before they spawn in
class_name SpawnerMod
extends Node2D

var spawner_mods := [] # Holds the child spawner mods
var spawn_mods_index := -1 #Holds index position in parent list

func _enter_tree():
	# Put self (with children) in spawner_mod array
	var parent = get_parent()
	if "spawner_mods" in parent:
		spawn_mods_index = parent.spawner_mods.size()
		parent.spawner_mods.append(self)

func _exit_tree():
	# Remove from parent list
	if spawn_mods_index > -1:
		get_parent().spawner_mods.remove(spawn_mods_index)
		spawn_mods_index = -1

# Applies modification to bullet before being shot
# Override for all spawner mods
func mod_shot(_shot: Node):
	pass

# Calls mod_shot for self and all children
func mod_shot_manipulate(shot: Node):
	# apply mod
	mod_shot(shot)
	
	# apply child mods
	for child in spawner_mods:
		child.mod_shot_manipulate(shot)

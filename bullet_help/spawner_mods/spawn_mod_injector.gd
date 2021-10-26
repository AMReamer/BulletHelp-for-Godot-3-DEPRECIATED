# Adds a copy of all children to the spawned bullet
# Put mods and nodes you want added to the bullet as a child to this mod
class_name SpawnModInjector
extends SpawnerMod

# Duplicates all children and adds them to the shot
func mod_shot(shot: Node):
	for mods in get_children():
		shot.add_child(mods.duplicate())

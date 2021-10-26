# Does not fire. Useful for grouping spawners together in the scene dock.
# Does not fire anything on its own.
class_name SpawnerGroup
extends Spawner

func _init():
	self_fire = false


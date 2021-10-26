# Preserves the global scale of the spawner
class_name SpawnGlobalScale
extends SpawnerMod

# Scales shot according to this gloapal scale allowing to scale according to the spawner
func mod_shot(shot: Node):
	shot.scale.x *= global_scale.x
	shot.scale.y *= global_scale.y

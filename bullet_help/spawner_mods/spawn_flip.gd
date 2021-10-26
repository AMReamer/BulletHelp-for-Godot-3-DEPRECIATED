# Calls flip on the shot for complex spawning
class_name SpawnFlip
extends SpawnerMod

# Flips switch mods on the shot
func mod_shot(shot: Node):
	shot.call_deferred("flip")

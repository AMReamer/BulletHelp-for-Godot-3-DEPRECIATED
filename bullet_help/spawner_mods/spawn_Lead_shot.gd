# Applies lead to a shot
class_name SpawnLeadShot
extends SpawnerMod

export(float) var lead: float = 0 # How far ahead to move the bullet in time

# Apply lead, set how far ahead in time bullet spawns in
# The bullet will move ahead as if it has been around for "lead" seconds
func mod_shot(shot: Node):
	# Apply lead
	shot.mod_bullet_force(lead)
	shot.mod_bullet_move(lead)

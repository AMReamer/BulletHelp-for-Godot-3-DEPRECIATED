# Determins if child bullet mods are active
# Only calls force and move of self and children when mods_active is true
# Used for state machine bullets
class_name ModSwitch
extends BulletMod


export(bool) var mods_active := false # Calls force and move of self and children only when true

# Flips the current value of mods_active
# Will not pass on flip
func flip():
	mods_active = !mods_active

# Stop or continue to children
func mod_bullet_force(delta: float):
	if mods_active:
		.mod_bullet_force(delta)

# Stop or continue to children
func mod_bullet_move(delta: float):
	if mods_active:
		.mod_bullet_move(delta)

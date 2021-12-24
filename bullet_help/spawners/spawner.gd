# General class for spawners, all spawners inherit this
class_name Spawner
extends Node2D

# Position export values
export (bool) var at_position := true # Ensures to spawn at the current position, irrelevent if global_coords is true
export (bool) var along_rotation := true # Ensures the bullet is fired along rotation, irrelevent if global_coords is true
export (bool) var spawn_global := true # Determines if bullets are spawned at the global level, global if on, local if off
export (PackedScene) var bullet: PackedScene # Bullet scene to fire
export (bool) var use_passed_bullet := true # Use the bullet that's passed into it from parent instead of own bullet
# Below will not work if changed at runtime
export (bool) var inherit_exports := true # Inherits position export values from parent when entering the tree. Does not inherit self_fire.
export (bool) var inherit_parent_mods := true # Determines if spawner_mods should come from parent

var self_fire := true # Determines if this spawner will allow itself to fire bullets
var spawner_mods := [] # Holds the child spawner mods
var spawner_list := []  # Holds a list of all child spawners
var spawner_list_index := -1 # Where you are in parent list

# Private
var _spawner:Script = get_script() # Spawner script to get around cyclical reference issue

func _init():
	# Sets _spawner to Spawner class
	# ensures _spawner is the same for all child classes
	while (_spawner.get_base_script() != null):
		_spawner = _spawner.get_base_script()

func _enter_tree():
	# Find the root spawner mod and link to their spawner_mods array
	# Get top spawner parent spawner mod
	var parent = get_parent()
	
	# Inherit parent position exports. 
	# Does not include inheriting parent mods.
	# 	This is because that is the most common exception to this use, especial in auto generated children.
	# Easiest way to check paretn is a spawner without cyclical reference
	if inherit_exports && "_spawner" in parent:
		at_position = parent.at_position
		along_rotation = parent.along_rotation
		spawn_global = parent.spawn_global
		bullet = parent.bullet
		use_passed_bullet = parent.use_passed_bullet
	
	# Uses same list of spawner mods as parent
	if "spawner_mods" in parent && inherit_parent_mods:
		spawner_mods = parent.spawner_mods
	
	# Add self to spawner_list
	if "spawner_list" in parent:
		spawner_list_index = parent.spawner_list.size()
		parent.spawner_list.append(self)

func _exit_tree():
	# Remove from parent list
	if spawner_list_index > -1:
		get_parent().spawner_list.remove(spawner_list_index)
		spawner_list_index = -1

# Helpers: These provide functions that help common use cases

# Call this function to fire export bullet for all spawner children
func fire():
	# Shoot through all pistols
	if bullet != null:
		take_spawner_shot(bullet)

# Generates pistols in a spread, pistols will inherent export bools
# theta: the total rangeo of the spread in degrees (assumes <= 360 degrees)
# num_shots: total number of shots, minimum 2
# center: the center of the spread in degrees
# Important to note that the resulting childen always inherit exports.
# 	This allows the resulting childrent to behave as an extension of the spawner
func spread(theta: float = 0, num_shots: int = 2, center: float = 0):
	var wedge:bool = theta < 360 # Different cases for wedge and circle spread
	var step_size:float = theta / (num_shots - int(wedge))
	var rot_start:float = center - theta / 2 # start rotation
	
	# Step through rotation
	for i in range(0, num_shots):
		var rot: float = rot_start + step_size * i
		var pistol = _spawner.new() # Needs to use generic spawner
		pistol.rotation_degrees = rot
		add_child(pistol)

# Fires bullets in a spread when called for a single shot
# bullet_scene: resource of bullet to be instanced and fired
# theta: the total rangeo of the spread in degrees (assumes <= 360 degrees)
# num_shots: total number of shots, minimum 2
# center: the center of the spread in degrees
# Doesn't pass on spawner preservation values to children
func spread_one_shot(bullet_scene: PackedScene, theta: float, num_shots: int = 2, center: float = 0):
	var wedge:bool = theta < 360 # Different cases for wedge and circle spread
	var step_size:float = theta / (num_shots - int(wedge))
	var rot_start:float = center - theta / 2 # start rotation
	
	# Step through rotation
	for i in range(0, num_shots):
		var rot: float = deg2rad(rot_start + step_size * i)
		var shot = bullet_scene.instance()
		# rotate direction to fire along spread angle
		shot.velocity = shot.velocity.rotated(rot)
		spawn(shot)

# Same as spread_one_shot, but automatically applies export bullet scene
func shoot_spread(theta: float, num_shots: int = 2, center: float = 0):
	spread_one_shot(bullet, theta, num_shots, center)

# Firing Process: This is the process for firing a bullet for all children

# Handles calling all child spawners using this bullet
func take_spawner_shot(shot_scene: PackedScene):
	if (use_passed_bullet):
		shoot(shot_scene)
	else:
		shoot(bullet)
	
	for child in spawner_list:
		child.take_spawner_shot(shot_scene)

# Function for spawning bullet
func shoot(shot_scene: PackedScene):
	if (!self_fire):
		return
	
	var shot = shot_scene.instance()
	spawn(shot)

# Covers general case of handling all necessities for bullet spawning
func spawn(shot: Node):
	# Account for position and angle
	shot.position += float(at_position && spawn_global) * global_position # Spawn at position
	shot.velocity = shot.velocity.rotated(float(along_rotation && spawn_global) * global_rotation) # Fire along rotation
	
	# Apply spawner mods
	mod_spawn(shot)
	
	# Add to scene
	spawn_bullet(shot)

# Applies spawner mods
func mod_spawn(shot: Node):
	for mods in spawner_mods:
		mods.mod_shot_manipulate(shot)

# Adds bullet to scene
func spawn_bullet(shot: Node):
	# Add to scene
	if spawn_global:
		get_tree().current_scene.add_child(shot)
	else:
		add_child(shot)

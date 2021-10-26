# Spins the bullet at a constant angular velocity
class_name ModSpin
extends BulletMod


export (float) var angular_velocity_degrees: float = 0 # Degrees / Second
export (float) var angular_acceleration_degrees: float # Degrees / Second ^2


func force(delta):
	angular_velocity_degrees += angular_acceleration_degrees * delta

func move(delta):
	target.rotation_degrees += angular_velocity_degrees * delta

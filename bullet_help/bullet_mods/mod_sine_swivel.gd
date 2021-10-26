# Applies a sine function to the rotation
# Treats the bullets starting rotation as the initial conditions
class_name ModSineSwivel
extends ModSine

# Amplitude is in degrees

# Change rotation
func update_value(change):
	target.rotation += change

# Converts amplituted to radians
func convert_amp() -> float:
	return deg2rad(amplitude)

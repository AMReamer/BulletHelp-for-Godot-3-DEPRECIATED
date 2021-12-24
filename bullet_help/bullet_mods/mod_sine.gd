# Applies a sine function to a bullet property
# Treats the bullets starting values as the initial conditions
class_name ModSine
extends BulletMod


export (float) var phase_shif_degrees: float = 0 setget match_phase # Phase shit in degrees
export (float) var amplitude: float = 1 setget , convert_amp# Wave amplitude
export (float) var period: float = 1 setget match_frequency # The amount of time for a single period

var phase: float = 0 # Total time passed, can be initialsed as a phase shift in time
var phase_shift_time: float = 0 # Converts the phase shift to seconds
var frequency: float = 0  # Wave frequency
var last_value: float = 0 # Last position along axis

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set up initial condiitons
	self.period = period
	last_value = calc_wave()


func move(delta):
	phase += delta
	phase = fmod(phase, period) # Keeps phase tightly bound
	
	var current_value: float = calc_wave()
	# Adds by change in function position
	update_value(current_value - last_value) 
	
	last_value = current_value

# Puts the wave equation in one function
func calc_wave() -> float:
	return self.amplitude * sin(frequency * (phase + phase_shift_time))

# Matches frequency and period
func match_frequency(new_period: float):
	period = new_period
	# Prevents divide by zero
	if period == 0:
		frequency = 0
	else:
		frequency = deg2rad(360.0 / period) # Seems to minimize error range
	self.phase_shif_degrees = phase_shif_degrees # Update phase shift

# Converts amplituted to the desired unit type
func convert_amp() -> float:
	return amplitude

# Matches the phase shift to the current phase
func match_phase(new_phase_shift: float):
	phase_shif_degrees = new_phase_shift
	# Prevents divide by zero
	if frequency != 0:
		phase_shift_time = deg2rad(phase_shif_degrees) / frequency

# Override this function to modify the property
func update_value(change):
	pass

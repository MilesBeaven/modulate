extends Node
class_name VCO

var waveform = 'sine'
var frequency = 220.0
var increment = frequency / Global.SAMPLE_RATE
var phase = 0.0

var inp_control_frequency = null
var inp_control_frequency_connected = false
var inp_control_wavefrom = null
var inp_control__connected = false

var out_audio = 0.0
var out_sync = false

func _generate_waveform():
	if waveform == 'sine':
		out_audio = sin(phase * TAU)
	elif waveform == 'saw':
		out_audio = 2.0 * (1-phase) - 1.0
	elif waveform == 'square':
		if phase > 0.5:
			out_audio = -1.0
		else:
			out_audio = 1.0
	elif waveform == 'triangle':
		if phase < 0.5:
			out_audio = 4.0 * (phase) - 1.0
		else:
			out_audio = 4.0 * (1.0-phase) - 1.0
	if phase < increment:
		out_sync = true
	else:
		out_sync = false
	
func get_out_sync():
	return out_sync

func get_out_audio():
	increment = frequency / Global.SAMPLE_RATE
	phase = fmod(phase + increment, 1.0)
	_generate_waveform()
	return out_audio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

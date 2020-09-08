extends Node
class_name VCF

var cutoff = 0.05
var filter_type = 'low pass'
var new_value = 0.0
var previous_value = 0.0

var inp_audio = null
var inp_audio_connected = false
var inp_control_cutoff = null
var inp_control_cutoff_connected = false

var out_audio = 0.0

func get_out_audio():
	if inp_audio_connected:
		new_value = inp_audio.get_value()
		if filter_type == 'low pass':
			out_audio = cutoff * new_value + (1-cutoff) * previous_value 
		else:
			out_audio = new_value
		
	else:
		out_audio = 0.0
	previous_value = out_audio
	return out_audio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

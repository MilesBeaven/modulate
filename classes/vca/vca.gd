extends Node
class_name VCA


var control = 0.1

var inp_audio = null
var inp_audio_connected = false
var inp_control = null
var inp_control_connected = false

var out_audio = 0.0

func get_out_audio():
	if inp_audio_connected:
		out_audio = inp_audio.get_value() * control
	else:
		out_audio = 0.0
	return out_audio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node
class_name Out


var playback: AudioStreamPlayback = null # Actual playback stream, assigned in _ready().
var to_fill = 0
var buffer = []
var val = 0.0

var inp_audio = null
var inp_audio_connected = false
var inp_sync = null
var inp_sync_connected = false 

func _fill_audio_buffer():
	to_fill = playback.get_frames_available()
	buffer = []
	while to_fill > 0:
		if inp_audio_connected:
			val = inp_audio.get_value()
		else:
			val = 0
		buffer.append(Vector2.ONE * val)
		if inp_sync_connected:
			if inp_sync.get_value():
				$oscilloscope_line_2d.reset()
		$oscilloscope_line_2d.add_data(val)
		to_fill -= 1
	playback.push_buffer(buffer)


func _process(_delta):
	_fill_audio_buffer()

func _ready():
	$speaker.stream.mix_rate = Global.SAMPLE_RATE
	$speaker.stream.buffer_length = Global.BUFFER_SIZE
	playback = $speaker.get_stream_playback()
	$speaker.play()

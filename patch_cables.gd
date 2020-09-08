extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$vca.inp_audio = $vco/out_audio
	$vca.inp_audio_connected = true
	$vcf.inp_audio = $vca/out_audio
	$vcf.inp_audio_connected = true
	$out.inp_audio = $vcf/out_audio
	$out.inp_audio_connected = true
	$out.inp_sync = $vco/out_sync
	$out.inp_sync_connected = true
	
	$vco.waveform = 'square'


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

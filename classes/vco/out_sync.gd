extends Node

onready var parent = get_parent()

func get_value():
	return parent.get_out_sync()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

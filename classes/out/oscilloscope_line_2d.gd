extends Line2D

var oscilloscope_points = []
var durration = 0.0045
var size_x = 400
var size_y = 400
var scan_position = 0.0
var samples_per_point = durration * Global.SAMPLE_RATE / size_x
var sample_count = 0
var wait = false

func reset():
	if wait:
		wait = false
		scan_position = 0.0

func add_data(val):
	if not wait:
		set_point_position(scan_position, Vector2(scan_position,val*size_y/2))
		scan_position += 1
		if scan_position > size_x:
			wait = true
	
func _ready():
	for i in range(0,size_x):
		oscilloscope_points.append(Vector2(i,0))
	points = oscilloscope_points

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

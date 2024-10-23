extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msecs: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if is_stopped:
		#time += delta
		#$minutes.text = str(time).pad_decimals(2)
		#print(time)
	time += delta
	msecs = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
	$Msecs.text = "%02d" % msecs
	Ui.minutes = "%02d:" % minutes
	Ui.seconds = "%02d." % seconds
	Ui.msecs = "%02d" % msecs
	

func stop():
	set_process(false)

func get_time_formatted() -> String:
	return "%02d:%02d:%02d" % [minutes , seconds, msecs]

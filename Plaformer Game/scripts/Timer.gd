extends Panel

#creates variables for the time and also te individual components
var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msecs: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#adds delta onto the time
	time += delta
	msecs = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	#sets all the labels text to their respected time and maxes the number of significant figures to 2
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
	$Msecs.text = "%02d" % msecs
	#does the same thing as above but sets it to variables in a different script
	Ui.minutes = "%02d:" % minutes
	Ui.seconds = "%02d." % seconds
	Ui.msecs = "%02d" % msecs

#creates a stop function and stops the timer when its called
func stop():
	set_process(false)

#formats the time in a string
func get_time_formatted() -> String:
	return "%02d:%02d:%02d" % [minutes , seconds, msecs]

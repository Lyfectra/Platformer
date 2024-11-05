extends CanvasLayer
#variables for the control, gem_counter (Label), and win_control (Control) bodies
@onready var Fail_control = $Fail_control
@onready var gem_counter = $GemControl/GemCounter
@onready var win_control = $Win_control
#Variables for the time, content to collect data from the text file and a gem counter
var seconds = 0
var minutes = 0
var msecs = 0
var finalTime = 0
var content = ""
var gems = 0
var game_started = false

#when the scene loads it sets the gem count to 0 and calls the read_file function
func _ready():
	Ui.gems = 0
	read_file()

#when the retry button is pressed it reloads the current scene
func _on_btn_retry_pressed():
	get_tree().reload_current_scene()

#when the main menu button is pressed it switches scenes back to the main menu
func _on_btn_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

#when the killzone Area2d is entered by the player this function is called
func _on_kill_zone_body_entered(body):
	#created a 0.5 second timer and halts the rest of the function until is finishes
	await get_tree().create_timer(0.5).timeout
	#pauses everything
	get_tree().paused = true
	#makes the Fail_control body visible
	Fail_control.visible = true

func read_file():
	#creates a variable that takes and holds the data from the text file
	var txt_file = FileAccess.open("user://GameScores.dat", FileAccess.READ)
	#Sets the content variable to the data and sets it to text
	Ui.content = txt_file.get_as_text()
	#returns the data collected from the text file
	return content

func read_write_to_file():
	#creates a variable that accesses the text file that will read it and write to it
	var file = FileAccess.open("user://GameScores.dat", FileAccess.READ_WRITE)
	#built in function that looks for the end of the file before it writes to it
	file.seek_end()
	#writes the username and the final time into the text file
	file.store_string("Name: " + MainUi.username + " " + "Time: " + str(finalTime) + "\n")

#function that adds one to a variable and prints "+1 Gem" each time it is called
func gem_picked_up():
	Ui.gems += 1
	print("+1 Gem")

#when the win Area2d is entered by the player this function is called
func _on_win_body_entered(body):
	#pauses everything
		get_tree().paused = true
		#makes the win_control body visible
		win_control.visible = true
		#sets the finalTime variable to all the combined time aspects (minutes, seconds and milliseconds)
		finalTime = (str(Ui.minutes) + str(Ui.seconds) + str(Ui.msecs))
		#calls the read_write function
		read_write_to_file()
		#prints out the username and the final time
		print(MainUi.username + " Time -> " +  finalTime)

#when the retry button is pressed it relo;ads the current scene
func _on_retry_btn_pressed():
	get_tree().reload_current_scene()

#when the main menu button is pressed it changes the scene to the main menu
func _on_main_menu_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

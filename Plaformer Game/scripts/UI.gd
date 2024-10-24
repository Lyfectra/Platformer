extends CanvasLayer
#variables for the control, gem_counter (Label), and win_control (Control) bodies
@onready var Fail_control = $Fail_control
@onready var gem_counter = $GemControl/GemCounter
@onready var win_control = $Win_control
var seconds = 0
var minutes = 0
var msecs = 0
var finalScore = 0
#creates a variable that is equal to the gems_collected function that is in the gem singleton
var gems_collected = Gem.gems_collected

func _ready():
	Gem.add_gem.connect(update_gem_counter)

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
	finalScore = (str(Ui.minutes) + str(Ui.seconds) + str(Ui.msecs))
	write_to_file()
	print(finalScore)


func read_file():
	var score = ""
	if FileAccess.file_exists("user://GameScores.dat"):
		var file = FileAccess.open("user://GameScores.dat", FileAccess.READ)
		score = file.get_as_text()


func write_to_file():
	var file = FileAccess.open("user://GameScores.dat", FileAccess.READ_WRITE)
	file.seek_end()
	file.store_string("\nname " + str(finalScore ))


func update_gem_counter():
	gems_collected = Gem.gems_collected
	gem_counter.text = str(gems_collected)
	print("+1 Gem")

#when the win Area2d is entered by the player this function is called
func _on_win_body_entered(body):
	#pauses everything
		get_tree().paused = true
		#makes the win_control body visible
		win_control.visible = true

#when the retry button is pressed it relo;ads the current scene
func _on_retry_btn_pressed():
	get_tree().reload_current_scene()

#when the main menu button is pressed it changes the scene to the main menu
func _on_main_menu_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

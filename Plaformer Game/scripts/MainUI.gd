extends CanvasLayer

@onready var name_box = $NameBox
var username = ""

#button for changing main menu scene to game scene
func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")

#button that opens a scene showing the user ehat the controls are
func _on_btn_how_to_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")

#button to quit the game
func _on_btn_quit_pressed():
	get_tree().quit()

#button to go to the leaderboard scene
func _on_btn_leaderboard_pressed():
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")


func _on_btn_save_pressed():
	MainUi.username = name_box.text
	print(MainUi.username)

extends CanvasLayer

#variable for the username set to empty
var username = ""

#button that opens a scene showing the user ehat the controls are
func _on_btn_how_to_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")

#button to quit the game
func _on_btn_quit_pressed():
	get_tree().quit()

#button to go to the leaderboard scene
func _on_btn_leaderboard_pressed():
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")

#When this button is pressed it saves the username if one has been inputted
func _on_btn_save_pressed():
	#if the text box is empty then it wont save anything and tells the user to enter a name
	if $NameBox.text.is_empty():
		print("Please Enter a Username")
	#if a name has been entered then it will be saved as a variable and printed out
	else:
		MainUi.username = $NameBox.text
		print(MainUi.username)

#button for changing main menu scene to game scene
func _on_btn_start_pressed():
	#if the text box is empty then it wont progress and tells the user to enter a name
	if $NameBox.text.is_empty():
		print("Please Enter a Username")
	#if a name ahs been entered it will set the "game_started_ variable to true and set the scene to the main level
	else:
		Ui.game_started = true
		get_tree().change_scene_to_file("res://scenes/level_one.tscn")
	

extends Node2D

#when the back button is pressed it changes the scene back to the main menu
func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

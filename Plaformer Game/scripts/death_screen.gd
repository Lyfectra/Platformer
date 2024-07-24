extends Node2D


func _on_btn_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_btn_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

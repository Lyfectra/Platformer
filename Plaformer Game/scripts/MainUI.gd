extends CanvasLayer


func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")

func _on_btn_how_to_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")

func _on_btn_quit_pressed():
	get_tree().quit()


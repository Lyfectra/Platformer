extends CanvasLayer


func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_btn_how_to_pressed():
	pass # Replace with function body.

func _on_btn_quit_pressed():
	get_tree().quit()


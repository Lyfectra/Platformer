extends CanvasLayer
@onready var control = $Control


func _on_btn_retry_pressed():
	get_tree().reload_current_scene()


func _on_btn_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func show_death():
	#get_tree().create_timer(1).timeout
	#get_tree().paused = true
	control.visible = true

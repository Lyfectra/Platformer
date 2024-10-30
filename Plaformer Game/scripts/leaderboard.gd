extends Node2D
@onready var label_first = $CanvasLayer/Panel/LabelFirst


func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

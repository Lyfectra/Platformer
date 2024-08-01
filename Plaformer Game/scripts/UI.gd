extends CanvasLayer
@onready var control = $Control
@onready var gem_counter = $GemControl/GemCounter
var collected = 0


func _on_btn_retry_pressed():
	get_tree().reload_current_scene()


func _on_btn_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_kill_zone_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true
	control.visible = true


func _on_gem_body_entered(body):
	collected += 1
	gem_counter.text = collected
	print(gem_counter.text)
	queue_free()

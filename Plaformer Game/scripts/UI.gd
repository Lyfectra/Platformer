extends CanvasLayer
@onready var control = $Control
@onready var gem_counter = $GemControl/GemCounter

var gems_collected = Gem.gems_collected

func _ready():
	Gem.add_gem.connect(update_gem_counter)

func _on_btn_retry_pressed():
	get_tree().reload_current_scene()


func _on_btn_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_kill_zone_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true
	control.visible = true


func update_gem_counter():
	gems_collected = Gem.gems_collected
	gem_counter.text = str(gems_collected)
	print("+1 gem")


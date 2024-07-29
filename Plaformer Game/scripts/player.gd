extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var rolling = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $AnimatedSprite2D
@onready var control = $CanvasLayer/Control


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("roll") and is_on_floor():		
		rolling = true
	if Input.is_action_just_released("roll"):
		rolling = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	if is_on_floor():	
		if direction == 0 and rolling == false:			
			sprite.play("Idle")
		elif direction == 0 and rolling == true:			
			sprite.play("Roll")
		#moving
		elif direction != 0 and rolling == false:			
			sprite.play("Run")
		elif direction !=0 and rolling == true:
			sprite.play("Roll")
	else:
		sprite.play("Jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_btn_retry_pressed():
	get_tree().reload_current_scene()


func _on_btn_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

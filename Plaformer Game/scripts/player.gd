extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	if direction == 0:
		sprite.play("Idle")
	else:
		sprite.play("Roll")
	if velocity.y < 0:
		sprite.play('Jump')
	elif velocity.y > 0:
		sprite.play("Fall")
	if Input.is_action_pressed("Attack") and is_on_floor():
		sprite.play("Attack")
	
	if Input.is_action_pressed("Roll") and velocity.x != 0 and is_on_floor:
		sprite.play("Roll")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

extends CharacterBody2D

#constant variable for speed
const SPEED = 150.0
#constant variable for jump velocity
const JUMP_VELOCITY = -300.0
#variable for rolling set false
var rolling = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#variable linking to the Animated sprite for the player
@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	#If the button that is assigend or jumping is pressed and the player is on the floor it sets the y velocity to the "JUMP_VELOCITY" variable
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#If the roll button is being pressed and the player is on the floor then the roll animation plays
	if Input.is_action_pressed("roll") and is_on_floor():
		rolling = true
	#If the roll button is released then the animation stops
	if Input.is_action_just_released("roll"):
		rolling = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	#if the direction is more than 0/is 1, then the sprite is set to its default state
	if direction > 0:
		sprite.flip_h = false
	#if the sprites direction is less than 0/or -1 then the sprite is flipped
	elif direction < 0:
		sprite.flip_h = true
	
	#CHecks if the player is on the floor, if it is, it runs the statement
	if is_on_floor():
		#if the direction is exactly 0, or the player is stationary, and the player is not rolling, then the idle animation will play
		if direction == 0 and rolling == false:
			sprite.play("Idle")
		#if direction is 0/stationary and rolling is true, play the rolling animation
		elif direction == 0 and rolling == true:
			sprite.play("Roll")
		#if direction isnt 0, (1/-1), and rolling is false, then the run animation plays
		elif direction != 0 and rolling == false:
			sprite.play("Run")
		#if direction isnt 0, and rolling is true, play the rolling animation
		elif direction !=0 and rolling == true:
			sprite.play("Roll")
	#If no other animation can play, then play the jump animation
	else:
		sprite.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 15
const MAX_SPEED = 250
const ACCELERATION = 20
const JUMP_HEIGHT = 500

var motion = Vector2() # x and y into a single var
#
#onready var joystick = get_parent().get_node("Joystick/JoystickButton")
#
#func _process(delta):
#
#	move_and_slide(joystick.get_value() * 800)
func _physics_process(delta):

	var friction = false
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true


	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0 , 0.2) # from, to, wheight -> this is friction

	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0 , 0.05) # from, to, wheight -> this is friction

	motion = move_and_slide(motion, UP)
	pass



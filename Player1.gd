extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal hit

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

var target = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size

func start(pos):
	position = pos
	target = pos
	show()
	$CollisionShape2D.disabled = false	

# Change the target whenever a touch event happens.
func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		target = event.position
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var velocity = Vector2()
	if position.distance_to(target) > 10:
		velocity = target - position
		
#	var velocity = Vector2()  # The player's movement vector.#
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 20, screen_size.x-20)
	position.y = clamp(position.y, 20, screen_size.y-20)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
							 # boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


func _on_Player1_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)




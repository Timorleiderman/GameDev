extends KinematicBody2D



var MAX_SPEED = 150

var motion = Vector2() # x and y into a single var

func _physics_process(delta):
	if motion.x < 2 and motion.x > -2:
		MAX_SPEED = -1*MAX_SPEED
		$enemy.flip_h = !$enemy.flip_h
		
	motion.x = MAX_SPEED
	motion = move_and_slide(motion)
	

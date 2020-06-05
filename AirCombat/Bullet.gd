extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_x(delta * 400)
#	pass
func _on_Area2D_area_entered(area):
	if(area.get_collision_layer_bit(2)):
		queue_free()

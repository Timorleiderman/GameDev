extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Coin_body_entered(body):
	if body.name == "Player":
		anim_player.play("fade")
		
		Globals.coins += 1


	



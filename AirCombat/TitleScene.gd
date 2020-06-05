extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	globals.kills = 0
	globals.currentStage = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NewGameButton_pressed():
	get_tree().change_scene("GameScene.tscn")


func _on_QuitGameButton_pressed():
	get_tree().quit()

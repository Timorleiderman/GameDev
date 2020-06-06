# WorldComplete.gd
extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		Globals.currentStage += 1
		if body.name == "Player":
			get_tree().change_scene("res://World" + str(Globals.currentStage) + ".tscn")
			

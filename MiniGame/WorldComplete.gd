# WorldComplete.gd
extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Globals.currentStage += 1
			get_tree().change_scene("res://World" + str(Globals.currentStage) + ".tscn")
			

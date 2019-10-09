extends Area2D

func _on_Checkpoint_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/end.tscn")
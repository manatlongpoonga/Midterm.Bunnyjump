extends Area2D


func _on_apple_body_entered(body):
	$AudioStreamPlayer.play()
	queue_free()
	
	


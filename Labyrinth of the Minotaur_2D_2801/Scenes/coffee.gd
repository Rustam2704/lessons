extends Area2D




func _on_coffee_body_entered(body):
	if "Player" in body.name:
		Global.win = true
		Global.winner = body.name
		get_tree().change_scene("res://Scenes/Among_us.tscn")

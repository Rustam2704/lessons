extends Label


func _physics_process(delta):
	text = str(get_node("../..").move_points2)
	

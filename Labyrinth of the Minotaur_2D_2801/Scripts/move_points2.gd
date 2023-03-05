extends Label


func _physics_process(_delta):
	text = str(get_node("../..").move_points)
	

extends Label


func _physics_process(_delta):
	text = str(Global.move_points)
#	print(get_node("../..").move_points)

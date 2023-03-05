extends Node

var move_points
var win = false
var winner = ""

#onready var timer = 1.0
#onready var player1 = get_node("/root/Level/Player1")
#onready var player2 = get_node("/root/Level/Player2")
#onready var player3 = get_node("/root/Level/Player3")
#onready var player4 = get_node("/root/Level/Player4")




#func _process(_delta):
#	if Input.is_action_just_released("space") and get_node("/root/Level/Camera2D/transition").visible == false:
#		print(get_node("/root/Level/Camera2D/transition").visible, " 1 - if")
#		_on_Next_button_pressed()
#		print(get_node("/root/Level/Camera2D/transition").visible, " posle Next - if")
#
#	if Input.is_action_just_released("space") and get_node("/root/Level/Camera2D/transition").visible == true:
#
#		print(get_node("/root/Level/Camera2D/transition").visible, " 2 - if")
#		_on_Ready_button_pressed()
#		print(get_node("/root/Level/Camera2D/transition").visible, " posle Ready - if")
				
	
	
	
	
func peredvizheniye(pl):
	pl.move_and_slide(pl.velocity)
	
	if Input.is_action_just_pressed("up") and !pl.get_node("up").is_colliding():
		pl.move_points -= 1
		pl.position.y += -pl.speed
	if Input.is_action_just_pressed("down") and !pl.get_node("down").is_colliding():
		pl.move_points -= 1
		pl.position.y += pl.speed
	if Input.is_action_just_pressed("left") and !pl.get_node("left").is_colliding():
		pl.move_points -= 1
		pl.position.x += -pl.speed
	if Input.is_action_just_pressed("right") and !pl.get_node("right").is_colliding():
		pl.move_points -= 1
		pl.position.x += pl.speed
	Global.move_points = pl.move_points
	
	get_node("/root/Level/Camera2D").position = pl.position
#	print("pered ", move_points)
#	print(get_node("/root/Level/Camera2D").position)
	




func _on_Next_button_pressed():
	get_node("/root/Level/Camera2D/transition").visible = true
	print(get_node("/root/Level/Camera2D/transition").visible, " NEXT")
	
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player1").position:
		get_node("/root/Level/Camera2D/transition/player_name").text = "Player2"
		get_node("/root/Level/Player1").move_points = 0 
		
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player2").position:
		get_node("/root/Level/Camera2D/transition/player_name").text = "Player3"
		get_node("/root/Level/Player2").move_points = 0 
		
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player3").position:
		get_node("/root/Level/Camera2D/transition/player_name").text = "Player4"
		get_node("/root/Level/Player3").move_points = 0 
		
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player4").position:
		get_node("/root/Level/Camera2D/transition/player_name").text = "Player1"
		get_node("/root/Level/Player4").move_points = 0 


func _on_Ready_button_pressed():
	get_node("/root/Level/Camera2D/transition").visible = false
	
	print(get_node("/root/Level/Camera2D/transition").visible, " READY")
	
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player1").position:
		get_node("/root/Level/Player2").move_points += 10 
		
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player2").position:
		get_node("/root/Level/Player3").move_points += 10
		
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player3").position:
		get_node("/root/Level/Player4").move_points += 10 
		
	if get_node("/root/Level/Camera2D").position == get_node("/root/Level/Player4").position:
		get_node("/root/Level/Player1").move_points += 10

extends KinematicBody2D

var move_points = 0
var speed = 64
var gravity = 10
var velocity = Vector2.ZERO


func _physics_process(_delta):
	if move_points > 0:
		get_node("../Camera2D/focus_brush").visible = true
		Global.peredvizheniye(self)








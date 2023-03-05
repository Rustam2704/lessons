extends KinematicBody2D

var move_points = 10
var speed = 64
var gravity = 10
var velocity = Vector2.ZERO


func _physics_process(_delta):
	if move_points > 0 and Global.win == false:
		get_node("/root/Level/Camera2D/focus_brush").visible = true
		Global.peredvizheniye(self)


extends KinematicBody2D


var movespeed = 500 # Собсна, сама скорость

func _ready():
	pass # Replace with function body.
func _physics_process(delta): # Фнукция для обработки физических движений
	var motion = Vector2() # этот вектор определяет направление движения

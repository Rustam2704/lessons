extends KinematicBody2D


var movespeed = 1000 # Собсна, сама скорость
var bullet_speed = 500 # скорость пули
var bullet = preload("res://Bullet.tscn") # подгружает пулю

func _ready():
	pass # Replace with function body.
func _physics_process(delta): # Фнукция для обработки физических движений
	var motion = Vector2() # этот вектор определяет направление движения
	
	# дальше идет связывание сигналов с клавиатуры с перемещениями игрока
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
		
		
	# Нажатие
	if Input.is_action_just_pressed("up"):
		var musicNode = $"Up"
		musicNode.play()
	if Input.is_action_just_pressed("down"):
		var musicNode = $"Down"
		musicNode.play()
	if Input.is_action_just_pressed("right"):
		var musicNode = $"Right"
		musicNode.play()
	if Input.is_action_just_pressed("left"):
		var musicNode = $"Left"
		musicNode.play()
		
		
	# Отпускание
	if Input.is_action_just_released("up"):
		var musicNode = $"Up"
		musicNode.stop()
	if Input.is_action_just_released("down"):
		var musicNode = $"Down"
		musicNode.stop()
	if Input.is_action_just_released("right"):
		var musicNode = $"Right"
		musicNode.stop()
	if Input.is_action_just_released("left"):
		var musicNode = $"Left"
		musicNode.stop()
		
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed) # объект двигает и скользит 
	# встречаясь с другими объектами
	look_at(get_global_mouse_position()) # следить за мышкой
	 
	if Input.is_action_pressed("LMB"):
		fire()
func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
	
func kill():
	get_tree().reload_current_scene()
	



func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()

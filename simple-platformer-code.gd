extends KinematicBody2D

const MOVE_SPEED = 500      # движение влево, вправо - п/с
const JUMP_FORCE = 1000     # стартовая скорость при прыжке вверх - п/с
const GRAVITY = 50          # ускорение гравитации, которая тянут вниз - п/с
const MAX_FALL_SPEED = 1000 # максимальная скорость падения - п/с

onready var anim_player = $AnimationPlayer # ссылки в коде на ноды в редакторе
onready var sprite = $Sprite               # ссылки в коде на ноды в редакторе

var y_velo = 0           # начальная скорость по высоте
var facing_right = false # проверка - смотрим ли мы вправо

func _physics_process(delta): # обработка физики для вычисления передвижений
	var move_dir = 0            # здесь хранится направление движения, постоянно возвращает значение на ноль, 
   # поэтому ты двигаешься только если держишь клавишу, когда отпускаешь - направление обнуляется
	if Input.is_action_pressed("move_right"): # если нажимаем вправо
		move_dir += 1                           # добавляет один
	if Input.is_action_pressed("move_left"):  # если нажимаем влево
		move_dir -= 1                           # отнимает один
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1)) # первый вектор
  # задает скорость (х, у), Х = (направление (1 или-1) умножить на скорость движения
  # если направление -1, то скорость будет в сторону -х - влево.
  # второй вектор для функции показывает реакцию опоры, он должен направляться в сторону пола
	
  # дальше проработаем кинетику (движение) коллизий
	var grounded = is_on_floor() # используем эту переменную, для проверки - на полу мы или нет
	y_velo += GRAVITY            # постоянно будем добавлять Гравитацию к нашей скорости, чтобы человечка тянуло вниз
	if grounded and Input.is_action_just_pressed("jump"): # если мы на полу и нажимаем "прыжок"
		y_velo = -JUMP_FORCE       # выставляем свою скорость по высоте
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
	
	if facing_right and move_dir < 0:
		flip()
	if !facing_right and move_dir > 0:
		flip()
	
	if grounded:
		if move_dir == 0:
			play_anim("idle")
		else:
			play_anim("walk")
	else:
		play_anim("jump")

func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h

func play_anim(anim_name):
	if anim_player.is_playing() and anim_player.current_animation == anim_name:
		return
	anim_player.play(anim_name)

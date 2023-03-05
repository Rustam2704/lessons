extends Sprite

var speed = 800
var scaling = 0

func _ready():
	randomize()
	scaling = rand_range(0.01, 0.1)
	scale.x = scaling
	scale.y = scaling
	position = Vector2(rand_range(-1056, 1056),rand_range(-704, 704))
#	position = Vector2(rand_range(-300, 300),rand_range(-300, 300))


func _process(delta):
	position.x += speed * scaling * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

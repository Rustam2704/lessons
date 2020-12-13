	# Нажатие
	if Input.is_action_just_pressed("up"):
		var musicNode = $"Up"
		musicNode.play()
	if Input.is_action_just_pressed("down"):
		var musicNode = $"Up"
		musicNode.play()
	if Input.is_action_just_pressed("right"):
		var musicNode = $"Up"
		musicNode.play()
	if Input.is_action_just_pressed("left"):
		var musicNode = $"Up"
		musicNode.play()
		
		
	# Отпускание
	if Input.is_action_just_released("up"):
		var musicNode = $"Up"
		musicNode.stop()
	if Input.is_action_just_released("down"):
		var musicNode = $"Up"
		musicNode.stop()
	if Input.is_action_just_released("right"):
		var musicNode = $"Up"
		musicNode.stop()
	if Input.is_action_just_released("left"):
		var musicNode = $"Up"
		musicNode.stop()

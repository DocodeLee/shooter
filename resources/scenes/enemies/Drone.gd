extends CharacterBody2D



func _process(delta):
	#direction
	var direction = Vector2(1,0)
	rotation_degrees += 20 * delta
	velocity = direction * 100
	
	#move and slide
	move_and_slide()

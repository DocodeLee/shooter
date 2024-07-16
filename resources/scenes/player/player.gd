extends CharacterBody2D

var can_laser : bool = true
var can_grenade : bool = true
var speed = 800

signal laser_fire(pos, direction)
signal grenade_fire(pos, direction)


func _on_shot_timer_timeout():
	can_laser = true
func _on_grenade_timer_timeout():
	can_grenade = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	# input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position()- position).normalized()
	if Input.is_action_pressed("primary action") and can_laser == true:
		#randomly selected a marker 2D
		var laser_markers = $LaserStartPosition.get_children()
		# select random marker
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		
		can_laser = false
		$ShotTimer.start()
		
		# emit the laser
		laser_fire.emit(selected_laser.global_position, player_direction)
		
		
	if Input.is_action_just_pressed("secondary action") and can_grenade == true:
		
		var grenade_markers = $LaserStartPosition.get_children()
		# select random marker
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		$GrenadeTimer.start()
		
		grenade_fire.emit(selected_grenade.global_position, player_direction)
		






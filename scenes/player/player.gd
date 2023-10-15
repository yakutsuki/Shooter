extends CharacterBody2D

signal laser(pos)
signal grenade

var can_laser: bool = true
var can_grendade: bool = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		# randomly selected a marker 2D for the laser start
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$Timer.start()
		# emit the position we selected
		laser.emit(selected_laser.global_position)
		
	if Input.is_action_pressed("secondary action") and can_grendade:
		can_grendade = false
		$GrenadeReloadTimer.start()
		grenade.emit()

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grendade = true

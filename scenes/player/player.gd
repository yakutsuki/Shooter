extends CharacterBody2D

signal laser
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
		can_laser = false
		$Timer.start()
		laser.emit()
		
	if Input.is_action_pressed("secondary action") and can_grendade:
		can_grendade = false
		$GrenadeReloadTimer.start()
		grenade.emit()

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grendade = true

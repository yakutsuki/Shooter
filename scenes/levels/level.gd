extends Node2D

var laser_scene: PackedScene = preload("res://scenes/laser/laser.tscn")

func _on_gate_player_entered_gate(body):
	print("player has entered gate")
	print(body)



func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	# 1. update the laser postion
	laser.position = pos
	# 2. we have move the laser
	# 3. I want to add the laser instance to a Node2D
	add_child(laser)

func _on_player_grenade():
	print("grenade from level")

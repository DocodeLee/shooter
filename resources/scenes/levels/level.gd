extends Node2D

var laser_scene: PackedScene = preload("res://resources/scenes/projecttiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://resources/scenes/projecttiles/grenade.tscn")
func _on_gate_player_entered_gate(body):
	print("Player has enetered gate")
	print(body)

func _on_player_laser_fire(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	#update the laser position
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) +90
	laser.direction = direction
	# want to add the laser instance to a Node2D
	$Projectiles.add_child(laser)


func _on_player_grenade_fire(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	#grenade position
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	
	

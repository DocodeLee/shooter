extends Node2D

var laser_scene: PackedScene = preload("res://resources/scenes/projecttiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://resources/scenes/projecttiles/grenade.tscn")
func _on_gate_player_entered_gate(body):
	print("Player has enetered gate")
	print(body)

func _on_player_laser_fire(pos):
	var laser = laser_scene.instantiate()
	#update the laser position
	laser.position = pos
	# want to add the laser instance to a Node2D
	$Projectiles.add_child(laser)


func _on_player_grenade_fire(pos):
	var grenade = grenade_scene.instantiate()
	#grenade position
	grenade.position = pos
	$Projectiles.add_child(grenade)
	
	

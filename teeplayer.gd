extends Node2D

export (PackedScene) var player_scene

func _ready():
	var player = player_scene.instance()
	player.position = GameManager.spawn_position
	add_child(player)


func _on_CollisionPolygon2D_draw():
	pass # Replace with function body.

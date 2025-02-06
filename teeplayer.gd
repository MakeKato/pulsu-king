extends Node2D

export (PackedScene) var player_scene

func _ready():
	var player = player_scene.instance()
	player.position = GameManager.spawn_position
	add_child(player)


func _on_CollisionPolygon2D_draw():
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	pass # Replace with function body.


func _on_Area2D2_body_exited(body):
	pass # Replace with function body.

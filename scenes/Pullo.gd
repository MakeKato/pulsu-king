extends Node2D

signal collected  

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("KinematicBody2D"):  
		emit_signal("collected")   
		queue_free()               


func _on_Pullo_body_entered(body):
	pass # Replace with function body.

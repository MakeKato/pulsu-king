extends Node2D

onready var animated_sprite = $AnimatedSprite


func flip_sprite():
	animated_sprite.scale.x = -animated_sprite.scale.x

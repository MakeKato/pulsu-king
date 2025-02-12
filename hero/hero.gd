extends KinematicBody2D


var speed = 100

onready var animated_sprite = $AnimatedSprite
var is_dead = false

func _process(_delta):
	if is_dead:
		return
	var velocity = Vector2.ZERO
	
	# Handle movement input
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animated_sprite.play("walk")
		animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animated_sprite.play("walk")
		animated_sprite.flip_h = false
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -1
		animated_sprite.play("walk")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")  
	
	
	velocity = velocity.normalized() * speed
	
	move_and_slide(velocity)
	
func die(delay_time = 0.0):
	is_dead = true

	if delay_time > 0:  
		yield(get_tree().create_timer(delay_time), "timeout")
	
	animated_sprite.play("die")
	
	yield(get_tree().create_timer(1.5), "timeout")
	
	get_tree().reload_current_scene()

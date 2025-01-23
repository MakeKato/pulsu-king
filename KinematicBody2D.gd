extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO  
const SPEED = 200  

func _ready():
	animated_sprite.play("idle")
	add_to_group("KinematicBody2D")  # Lisää hahmo ryhmään "Player"

# Tällä funktiolla liikutetaan pelaajaa ja tarkistetaan törmäykset
func _physics_process(_delta):
	velocity = Vector2.ZERO  

	# Liikkumiskontrollit
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		animated_sprite.flip_h = false
		animated_sprite.play("Runright")  
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		animated_sprite.flip_h = false
		animated_sprite.play("Runleft")  
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
		animated_sprite.flip_h = false  
		animated_sprite.play("Runup")  
	elif Input.is_action_pressed("ui_down"):
		animated_sprite.flip_h = false
		velocity.y = SPEED  
		animated_sprite.play("Rundown") 
	else:
		if velocity.x == 0:
			animated_sprite.play("idle")
			
	# Liikuta pelaajaa ja käsittele törmäykset
	velocity = move_and_slide(velocity)

# Tämä funktio käsittelee, mitä tapahtuu kun pelaaja menee taloon
func _on_Area2D_body_entered(body):
	if body.is_in_group("talo"):
		print("Pelaaja törmäsi taloon!")

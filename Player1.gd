extends KinematicBody2D


#Variables 
var speed = 200
var bottle_count = 0
var health = 100 
var energy = 50 # Max energy = 100
var is_injured = false

#Signals
signal injured()
signal bottle_collection()
signal energy_restored()

#Input and Movement 
func _process(_delta):
	if is_injured:
		return # Player can't move if injured 
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * (speed * (energy / 100)) # Speed depends on energy level
	move_and_slide(velocity)
	
#Interactions with bottels and energy drinks
func _on_bottle_collected():
	bottle_count += 1
	emit_signal("bottle_collection")
	
func _on_energy_drink_collected():
	energy = min(energy + 30, 100)  #Restore 30 energy, max 100
	emit_signal("energy_restored")
	
func _on_snake_bite():
	health -=50
	if health <= 0:
		is_injured = true
		emit_signal("injured")

extends CanvasLayer

# Time system
onready var time_label = $ClockLabel  
var hour = 8
var minute = 0
var time_speed = 0.356
var elapsed_time = 0.0  

onready var clock_label = $ClockLabel  

func _process(delta):
	elapsed_time += delta
	if elapsed_time >= time_speed:
		elapsed_time -= time_speed
		increment_time()

func increment_time():
	minute += 1
	if minute >= 60:
		minute = 0
		hour += 1
		if hour >= 24:
			hour = 0

	update_clock_display()

func update_clock_display():
	clock_label.text = "%02d:%02d" % [hour, minute]

func set_time(new_hour, new_minute):
	hour = new_hour
	minute = new_minute
	update_clock_display()

# Bottle system
var bottles_collected = 0
onready var score_label = $ScoreLabel  

func _ready():
	# Load and instance the bottle scene
	var pullo_scene = preload("res://Bottle.tscn")
	var pullo_instance = pullo_scene.instance()
	add_child(pullo_instance)
	
	if pullo_instance.has_signal("collected"):
		print("Signal connected successfully!")
		pullo_instance.connect("collected", self, "_on_Bottle_collected")
	else:
		print("Error: Bottle does not have 'collected' signal!")
		
func _on_Bottle_collected():
	# Increment the bottle count and update the score label
	bottles_collected += 1
	update_score()

func update_score():
	var total_bottles = Inventory.get_bottle_count()
	score_label.text = "Pulloja: %d" % total_bottles

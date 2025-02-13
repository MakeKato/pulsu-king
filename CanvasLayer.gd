extends CanvasLayer

onready var clock_label = $ClockLabel  
onready var score_label = $ScoreLabel  
onready var Inventory = preload("res://Scripts/inventory.gd").new()

func _ready():
	# Connect to the TimeManager signals
	TimeManager.connect("timer_updated", self, "_on_timer_updated")
	TimeManager.connect("game_ended", self, "_on_game_ended")

	# Load and instance the bottle scene
	var pullo_scene = preload("res://Bottle.tscn")
	var pullo_instance = pullo_scene.instance()
	add_child(pullo_instance)
	
	if pullo_instance.has_signal("collected"):
		print("Signal connected successfully!")
		pullo_instance.connect("collected", self, "_on_Bottle_collected")
	else:
		print("Error: Bottle does not have 'collected' signal!")

func _on_timer_updated(new_hour, new_minute):
	# Update the clock display with the new time
	clock_label.text = "%02d:%02d" % [new_hour, new_minute]

func _on_game_ended():
	# Handle the game ending
	handle_game_end()

func handle_game_end():
	var total_cash = Inventory.get_cash()  # Ensure this function exists

	if total_cash < 20:
		load_scene("res://scenes/loser.tscn")
	elif total_cash < 50:
		load_scene("res://scenes/mid.tscn")
	else:
		load_scene("res://scenes/big.tscn")

func load_scene(scene_path):
	var new_scene = load(scene_path)
	if new_scene:  # Ensure the scene is loaded correctly
		get_tree().change_scene_to(new_scene)
	else:
		print("Error: Failed to load scene at path: ", scene_path)

func _on_Bottle_collected():
	Inventory.add_bottles(1)
	update_score()

func _on_GameOver():
	print("Game over event received!")
	update_score()

func update_score():
	var total_bottles = Inventory.get_bottle_count()
	print("Updating score label. Total bottles:", total_bottles)  
	score_label.text = "Pulloja: %d" % total_bottles

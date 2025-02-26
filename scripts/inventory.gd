extends Node

var bottle_count = 0
var cash = 0
signal bottle_count_changed
signal game_over

# Load TimeManager
onready var TimeManager = preload("res://scripts/time_manager.gd").new()

func add_bottles(amount):
	bottle_count += amount
	emit_signal("bottle_count_changed", bottle_count)

func remove_bottles(amount):
	bottle_count = max(bottle_count - amount, 0)
	emit_signal("bottle_count_changed", bottle_count)

func add_cash(amount):
	cash += amount

func get_bottle_count():
	return bottle_count

func get_cash():
	return cash

func reset(reset_cash = true):
	print("Reset function called! Bottles before reset:", bottle_count, "Cash before reset:", cash)  
	bottle_count = 0
	if reset_cash:
		cash = 0
	emit_signal("bottle_count_changed", bottle_count)
	TimeManager.reset()  # Call the reset method from TimerManager
	print("After reset - Bottles:", bottle_count, "Cash:", cash)


func trigger_game_over():
	print("Game Over Triggered!")
	emit_signal("game_over")
	reset()

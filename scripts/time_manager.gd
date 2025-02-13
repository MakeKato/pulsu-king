extends Node

var hour = 8
var minute = 0
var time_speed = 0.6  # Time progression speed
var elapsed_time = 0.0
var game_over = false

signal timer_updated(new_hour, new_minute)
signal game_ended()

func _process(delta):
	if game_over:
		return
	elapsed_time += delta
	if elapsed_time >= time_speed:
		elapsed_time -= time_speed
		increment_time()

func increment_time():
	minute += 1
	if minute >= 60:
		minute = 0
		hour += 1
		if hour >= 21:  # End game at 9 PM
			hour = 21
			minute = 0
			game_over = true
			emit_signal("game_ended")
		else:
			emit_signal("timer_updated", hour, minute)
	else:
		emit_signal("timer_updated", hour, minute)

# New reset function
func reset():
	hour = 8
	minute = 0
	elapsed_time = 0.0
	game_over = false
	emit_signal("timer_updated", hour, minute)

extends Node2D

export(PackedScene) var bottle_scene
export(float) var spawn_interval_min = 1.0
export(float) var spawn_interval_max = 3.0
export(int) var spawn_amount_min = 1
export(int) var spawn_amount_max = 5

onready var spawn_points = []
var spawn_timer = null

func _ready():
	# Collect all spawn points in the group
	spawn_points = get_tree().get_nodes_in_group("BottleSpawnPoints")
	if spawn_points.empty():
		print("No spawn points found in group 'BottleSpawnPoints'")
		return
	
	# Start spawning bottles
	start_spawning()

func start_spawning():
	spawn_timer = Timer.new()
	spawn_timer.wait_time = rand_range(spawn_interval_min, spawn_interval_max)
	spawn_timer.one_shot = true
	spawn_timer.connect("timeout", self, "_on_spawn_timer_timeout")
	add_child(spawn_timer)
	spawn_timer.start()

func _on_spawn_timer_timeout():
	spawn_bottles()
	start_spawning()  # Restart timer for next spawn

func spawn_bottles():
	var spawn_count = spawn_amount_min + randi() % (spawn_amount_max - spawn_amount_min + 1)  # ✅ Works in Godot 3.6
	for _i in range(spawn_count):
		if spawn_points.empty():
			break
		var random_spawn_point = spawn_points[randi() % spawn_points.size()]
		var bottle_instance = bottle_scene.instance()
		bottle_instance.global_position = random_spawn_point.global_position
		get_parent().add_child(bottle_instance)

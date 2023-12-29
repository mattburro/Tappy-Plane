extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes = $Pipes
@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer

func _ready():
	GameManager.on_game_over.connect(on_game_over)
	spawn_pipes()

func spawn_pipes():
	var y_pos = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	var new_pipes = pipes_scene.instantiate()
	new_pipes.position = Vector2(spawn_upper.position.x, y_pos)
	pipes.add_child(new_pipes)

func stop_pipes():
	spawn_timer.stop()
	for pipe in pipes.get_children():
		pipe.set_process(false)

func on_spawn_timer_timeout():
	spawn_pipes()

func on_game_over():
	stop_pipes()

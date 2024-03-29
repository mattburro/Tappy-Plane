extends Control

@onready var game_over_label = $GameOverLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer

var can_press_space: bool = false

func _ready():
	GameManager.on_game_over.connect(on_game_over)

func _process(delta):
	if can_press_space:
		if Input.is_action_just_pressed("fly"):
			GameManager.load_main_scene()

func on_game_over() -> void:
	show()
	timer.start()

func run_sequence() -> void:
	game_over_label.hide()
	space_label.show()
	can_press_space = true

func on_timer_timeout():
	run_sequence()

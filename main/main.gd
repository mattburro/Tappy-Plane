extends Control

@onready var high_score_label = $MarginContainer/HBoxContainer/HighScoreLabel

func _ready():
	high_score_label.text = str(GameManager.high_score)

func _process(delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()

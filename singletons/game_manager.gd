extends Node

signal on_game_over
signal on_score_updated

const GROUP_PLANE: String = "plane"

var game_scene: PackedScene = preload("res://game/game.tscn")
var main_scene: PackedScene = preload("res://main/main.tscn")

var score: int = 0
var high_score: int = 0

func set_score(value: int) -> void:
	score = value
	if score > high_score:
		high_score = score
	on_score_updated.emit()

func increment_score() -> void:
	set_score(score + 1)

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)

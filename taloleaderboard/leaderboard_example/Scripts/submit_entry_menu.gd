extends Control

@export var score_is_float : bool = false
@onready var leaderboard_menu: Control = $".."
@onready var submit: Button = $MarginContainer/VBoxContainer/Submit
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var line_edit: LineEdit = $MarginContainer/VBoxContainer/LineEdit
var score = 0

func _ready() -> void:
	score = generate_score()
	label.text = label.text.replace("{score}", str(score))
	label.text = label.text.replace("{leaderboard}", leaderboard_menu.internal_leaderboard_name)
	line_edit.text = "PlayerName"
	submit.disabled = false

func generate_score() -> Variant:
	# Replace with your project's highscore calculation
	if score_is_float:
		return RandomNumberGenerator.new().randf_range(0.0, 100.0)
	else:
		return RandomNumberGenerator.new().randi_range(0, 100)

func _on_submit_pressed() -> void:
	submit.disabled = true
	await Talo.players.identify("username", line_edit.text)
	var _res := await Talo.leaderboards.add_entry(leaderboard_menu.internal_leaderboard_name, score)
	leaderboard_menu._update_menu_state(leaderboard_menu.states.VIEW_ENTRIES)

func _on_quit_pressed() -> void:
	get_tree().quit()

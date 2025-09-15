extends Control

@onready var leaderboard_menu: Control = $".."
@onready var submit: Button = $MarginContainer/VBoxContainer/Submit
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var line_edit: LineEdit = $MarginContainer/VBoxContainer/LineEdit
var score = 1
@onready var check_button: CheckButton = $MarginContainer/VBoxContainer/CheckButton
@onready var score_edit: LineEdit = $MarginContainer/VBoxContainer/ScoreEdit
@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
var is_float = true

func _ready() -> void:
	label.text = label.text.replace("{leaderboard}", leaderboard_menu.internal_leaderboard_name)
	line_edit.text = "Player Name"
	submit.disabled = false
	_update_score()

func _on_submit_pressed() -> void:
	submit.disabled = true
	await Talo.players.identify("username", line_edit.text)
	var _res := await Talo.leaderboards.add_entry(leaderboard_menu.internal_leaderboard_name, score)
	leaderboard_menu._update_menu_state(leaderboard_menu.states.VIEW_ENTRIES)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _update_score() -> void:
	if is_float:
		score = float(score_edit.text)
		score_label.text = "Score: " + str(float(score))
	else:
		score = int(score_edit.text)
		score_label.text = "Score: " + str(int(score))

func _on_check_button_toggled(toggled_on: bool) -> void:
	is_float = toggled_on
	_update_score()

func _on_score_edit_text_changed(_new_text: String) -> void:
	_update_score()

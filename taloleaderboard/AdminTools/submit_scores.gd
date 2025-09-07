extends Control

@onready var submit: Button = $MarginContainer/VBoxContainer/Submit
@onready var leaderboard_label: Label = $MarginContainer/VBoxContainer/LeaderboardLabel
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var line_edit: LineEdit = $MarginContainer/VBoxContainer/LineEdit
@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var score_edit: LineEdit = $MarginContainer/VBoxContainer/ScoreEdit
@onready var score = "1.0"
var is_float = false

func _ready() -> void:
	_update_score()
	leaderboard_label.text = leaderboard_label.text.replace("{leaderboard_internal_name}", LeaderboardVariables.leaderboard_internal_name)

func _on_submit_pressed() -> void:
	submit.disabled = true
	await Talo.players.identify("username", line_edit.text)
	var res := await Talo.leaderboards.add_entry(LeaderboardVariables.leaderboard_internal_name, score)
	get_tree().change_scene_to_file("res://AdminTools/leaderboardPreview.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_check_button_toggled(toggled_on: bool) -> void:
	is_float = toggled_on
	print(is_float)
	_update_score()
	print(score)
	
func _update_score() -> void:
	if is_float:
		score = float(score_edit.text)
		score_label.text = "Score: " + str(float(score))
	else:
		score = int(score_edit.text)
		score_label.text = "Score: " + str(int(score))

func _on_score_edit_text_changed(new_text: String) -> void:
	_update_score()

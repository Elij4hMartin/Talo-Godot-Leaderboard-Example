extends Control

@onready var submit: Button = $MarginContainer/VBoxContainer/Submit
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var line_edit: LineEdit = $MarginContainer/VBoxContainer/LineEdit
@onready var score := RandomNumberGenerator.new().randi_range(0, 100)

func _ready() -> void:
	label.text = label.text.replace("{score}", str(score))
	label.text = label.text.replace("{leaderboard}", LeaderboardVariables.leaderboard_internal_name)

func _on_submit_pressed() -> void:
	submit.disabled = true
	await Talo.players.identify("username", line_edit.text)
	var res := await Talo.leaderboards.add_entry(LeaderboardVariables.leaderboard_internal_name, score)
	get_tree().change_scene_to_file("res://leaderboard_example/leaderboard.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

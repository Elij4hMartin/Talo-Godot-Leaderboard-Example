extends Control

@onready var leaderboard_menu: Control = $".."
@onready var submit: Button = $MarginContainer/VBoxContainer/Submit
@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var line_edit: LineEdit = $MarginContainer/VBoxContainer/LineEdit
@onready var score := RandomNumberGenerator.new().randi_range(0, 100)
var is_float = true

func _ready() -> void:
	label.text = label.text.replace("{score}", str(score))
	label.text = label.text.replace("{leaderboard}", leaderboard_menu.internal_leaderboard_name)
	line_edit.text = "Player Name"
	submit.disabled = false

func _on_submit_pressed() -> void:
	submit.disabled = true
	await Talo.players.identify("username", line_edit.text)
	var _res := await Talo.leaderboards.add_entry(leaderboard_menu.internal_leaderboard_name, score)
	leaderboard_menu._update_menu_state(leaderboard_menu.states.VIEW_ENTRIES)

func _on_quit_pressed() -> void:
	get_tree().quit()

extends Control

@onready var leaderboard_name: Label = %LeaderboardName
@onready var entries_container: GridContainer = %EntriesContainer
@onready var refresh_button: Button = $MarginContainer/VBoxContainer/Refresh
@onready var return_button: Button = $MarginContainer/VBoxContainer/Return

var _entries_error: bool

func _ready() -> void:
	leaderboard_name.text = leaderboard_name.text.replace("{leaderboard}", LeaderboardVariables.leaderboard_internal_name)
	await _load_entries()

func _load_entries() -> void:
	var done := false
	while !done:
		var res := await Talo.leaderboards.get_entries(LeaderboardVariables.leaderboard_internal_name)
		if not is_instance_valid(res):
			_entries_error = true
			return
		
		var entries := res.entries
		var is_last_page := res.is_last_page
		
		if is_last_page:
			done = true
	refresh_button.disabled = true
	_build_entries()
	refresh_button.disabled = false

func _build_entries() -> void:
	for child in entries_container.get_children():
		child.queue_free()

	var entries = Talo.leaderboards.get_cached_entries(LeaderboardVariables.leaderboard_internal_name)
	
	# Create header
	# rank
	var header_rank = Label.new()
	header_rank.text = ("[ RANK ]")
	entries_container.add_child(header_rank)
	# name
	var header_name = Label.new()
	header_name.text = ("[ Player Name ]")
	entries_container.add_child(header_name)
	# score
	var header_score = Label.new()
	header_score.text = ("[ Score ]")
	entries_container.add_child(header_score)
	
	for entry in entries:
		# divide entries
		for i in range(3):
			var seperator = HSeparator.new()
			entries_container.add_child(seperator)
		entry.position = entries.find(entry)
		# rank
		var entry_rank = Label.new()
		entry_rank.text = (str(entry.position + 1))
		entries_container.add_child(entry_rank)
		# name
		var entry_name = Label.new()
		entry_name.text = (entry.player_alias.identifier)
		entries_container.add_child(entry_name)
		# score
		var entry_score = Label.new()
		entry_score.text = (str(entry.score))
		entries_container.add_child(entry_score)


func _on_refresh_pressed() -> void:
	refresh_button.disabled = true
	entries_container.visible = false
	await _load_entries()
	entries_container.visible = true
	refresh_button.disabled = false


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://AdminTools/submit_scores.tscn")

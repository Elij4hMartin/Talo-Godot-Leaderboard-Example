extends Control

@onready var leaderboard_menu: Control = $".."
@onready var leaderboard_name: Label = %LeaderboardName
@onready var refresh_button: Button = $MarginContainer/VBoxContainer/Refresh
@onready var return_button: Button = $MarginContainer/VBoxContainer/Return
@onready var entries_tree: Tree = %EntriesTree

var _entries_error: bool

func _ready() -> void:
	leaderboard_name.text = leaderboard_name.text.replace("{leaderboard}", leaderboard_menu.internal_leaderboard_name)
	await _load_entries()

func _load_entries() -> void:
	refresh_button.disabled = true
	entries_tree.visible = false
	# load entries from Talo backend
	var done := false
	while !done:
		var res := await Talo.leaderboards.get_entries(leaderboard_menu.internal_leaderboard_name)
		if not is_instance_valid(res):
			_entries_error = true
			return
		var is_last_page := res.is_last_page
		if is_last_page:
			done = true
	# build leaderboard UI
	_build_entries()
	refresh_button.disabled = false
	entries_tree.visible = true

func _build_entries() -> void:
	entries_tree.clear()
	var entries = Talo.leaderboards.get_cached_entries(leaderboard_menu.internal_leaderboard_name)
	# Create header
	entries_tree.set_column_title(0, "[RANK]")
	entries_tree.set_column_title(1, "[PLAYER NAME]")
	entries_tree.set_column_title(2, "[SCORE]")
	# Add entries to tree
	var tree_root = entries_tree.create_item()
	entries_tree.hide_root = true
	for entry in entries:
		entry.position = entries.find(entry)
		var tree_entry = entries_tree.create_item(tree_root)
		# Rank
		tree_entry.set_text(0, str(entry.position + 1))
		# Name
		tree_entry.set_text(1, entry.player_alias.identifier)
		# Score
		tree_entry.set_text(2, str(entry.score))

func _on_refresh_pressed() -> void:
	await _load_entries()

func _on_return_pressed() -> void:
	leaderboard_menu._update_menu_state(leaderboard_menu.states.SUBMIT_ENTRY)

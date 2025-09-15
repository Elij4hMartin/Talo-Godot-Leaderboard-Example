extends Control

enum states {VIEW_ENTRIES, SUBMIT_ENTRY, ADMIN_SUBMIT_ENTRY}
@export var internal_leaderboard_name: String = "leaderboard_name"
@export var menu_state: states = states.SUBMIT_ENTRY
@onready var submit_entry_menu: Control = $SubmitEntryMenu
@onready var view_entries_menu: Control = $ViewEntriesMenu
@onready var admin_submit_entry_menu: Control = $AdminSubmitEntryMenu

func _ready() -> void:
	# initialize state
	_update_menu_state(menu_state)

func _update_menu_state(state) -> void:
	menu_state = state
	hide_menus()
	match menu_state:
		states.VIEW_ENTRIES:
			_view_entries_menu()
		states.SUBMIT_ENTRY:
			_submit_entry_menu()
		states.ADMIN_SUBMIT_ENTRY:
			_admin_submit_entry_menu()

func hide_menus() -> void:
	for child in get_children():
		child.visible = false

func _admin_submit_entry_menu() -> void:
	admin_submit_entry_menu.visible = true
	admin_submit_entry_menu._ready()

func _submit_entry_menu() -> void:
	submit_entry_menu.visible = true
	submit_entry_menu._ready()

func _view_entries_menu() -> void:
	view_entries_menu.visible = true
	view_entries_menu._ready()

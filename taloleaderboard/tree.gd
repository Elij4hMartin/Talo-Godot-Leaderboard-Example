extends Tree

func _ready() -> void:
	# create headers
	set_column_title(0, "[RANK]")
	set_column_title(1, "[NAME]") 
	set_column_title(2, "[SCORE]")
	var root = self.create_item()
	self.hide_root = true
	for i in range(1, 100):
		var entry = self.create_item(root)
		entry.set_text(0, str(i))
		entry.set_text(1, "Player Name" + str(i))
		entry.set_custom_bg_color(0, Color.RED)

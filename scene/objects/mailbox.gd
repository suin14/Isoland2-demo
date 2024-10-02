extends flagSwitch




func _on_interactable_interacted() -> void:
	var item := Game.inventory.active_item
	if not item or item != preload("res://script/items/key.tres"): return
	Game.flags.add(flag)
	Game.inventory.remove_item(item)

extends Node


class Flags:
	signal changed
	var flags := []
	
	func has(flag: String) -> bool:  #检查是否有flag
		return flag in flags
	
	func add(flag: String):  #添加flag
		if flag in flags: return
		
		flags.append(flag)
		changed.emit()


class Inventory:
	signal changed
	
	var active_item: Item
	var _items := []   # 命名规范：_不希望外界直接修改属性
	var _current_item_index := -1
	
	func get_item_count() -> int:
		return _items.size()
	
	func get_current_item() -> Item:
		if _current_item_index == -1:  # 背包没有东西
			return null
		return _items[_current_item_index]
	
	func add_item(item: Item):
		if item in _items: return
		_items.append(item)
		_current_item_index = _items.size() - 1  # 当前显示物品变为刚拾取的物品
		changed.emit()
	
	func remove_item(item: Item):
		var index := _items.find(item)
		if index == -1: return  #没有该物品
		_items.remove_at(index)
		
		if _current_item_index >= _items.size():
			_current_item_index = 0 if _items else -1
		changed.emit()
	
	func select_next():
		if _current_item_index == -1: return
		_current_item_index = (_current_item_index + 1) % _items.size()
		changed.emit()
	
	func select_prev():
		if _current_item_index == -1: return
		_current_item_index = (_current_item_index - 1 + _items.size()) % _items.size()
		changed.emit()



var flags := Flags.new()  #创建实例
var inventory := Inventory.new()


func back_to_title() -> void:
	SceneChanger.change_scene("res://scene/UI/title_screen.tscn")

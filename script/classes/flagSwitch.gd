extends Node2D
class_name flagSwitch


@export var flag: String

var default_node: Node2D  #常态
var switch_node: Node2D  #flag存在时切换显示


func _ready() -> void:
	var count := get_child_count()
	if count > 0:
		default_node = get_child(0)
	if count > 1:
		switch_node = get_child(1)
	
	Game.flags.changed.connect(_update_nodes)
	_update_nodes()


func _update_nodes() -> void:
	var exists := Game.flags.has(flag)
	if default_node:
		default_node.visible = not exists
	if switch_node:
		switch_node.visible = exists
	

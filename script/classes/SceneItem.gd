@tool
extends Interactable
class_name SceneItem


@export var item: Item: set = set_item


func _ready() -> void:
	hide()
	if Engine.is_editor_hint(): return  #在编辑器中运行脚本时
	
	if !Game.flags.has(get_flag()):  #如果已经有该flag，使item消失
		show()
		return
	queue_free()
	



func set_item(v: Item):
	item = v
	set_texture(item.scene_texture)
	notify_property_list_changed()

func interact():
	super()
	
	Game.flags.add(get_flag())
	
	# 拾取物品动画
	var sprite := Sprite2D.new()
	sprite.texture = item.scene_texture
	get_parent().add_child(sprite)
	sprite.global_position = global_position
	
	var tween := sprite.create_tween()
	tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	tween.tween_property(sprite, "scale", Vector2.ZERO, 0.15)
	tween.tween_callback(sprite.queue_free)
	# end
	
	queue_free()


func get_flag():
	return "picked:" + item.resource_path.get_file()  #例如: picked:key.tres

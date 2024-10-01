@tool
extends Interactable
class_name SceneItem


@export var item: Item: set = set_item


func set_item(v: Item):
	item = v
	set_texture(item.scene_texture)
	notify_property_list_changed()

func interact():
	super()
	
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

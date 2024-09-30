extends CanvasLayer


@onready var color_rect: ColorRect = $ColorRect


func change_scene(path: String):
	var tree := get_tree()
	
	# 转场变黑动画
	var tween := create_tween()
	color_rect.show()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(color_rect, "color:a", 1, 0.2)
	await tween.finished

	tree.change_scene_to_file(path)
	await tree.tree_changed
	
	# 转场结束动画
	tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(color_rect, "color:a", 0, 0.3)
	color_rect.hide()

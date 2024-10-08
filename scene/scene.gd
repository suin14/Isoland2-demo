extends Sprite2D
class_name Scene

func _ready() -> void:
	# 切入场景缩放效果
	var tween := create_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2.ONE, 0.3).from(Vector2.ONE * 1.05)

	SoundManager.play_bgm(preload("res://assets/Music/PaperWings.mp3"))
	Hud.show()

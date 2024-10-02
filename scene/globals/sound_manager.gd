extends Node

enum Bus {
	MASTER, BGM
}

@onready var bgm_player: AudioStreamPlayer = $BGMPlayer


func play_bgm(stream: AudioStream) -> void:
	if bgm_player.stream == stream and bgm_player.playing:
		return
	bgm_player.stream = stream
	bgm_player.play()

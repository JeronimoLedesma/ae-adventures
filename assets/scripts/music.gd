extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func bgm_play():
	if not audio_stream_player.has_stream_playback():
		audio_stream_player.stream = preload("uid://dus60u76qrogb")
		audio_stream_player.play()

func bgm_stop():
	audio_stream_player.stop()

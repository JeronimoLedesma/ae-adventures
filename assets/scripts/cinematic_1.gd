extends Node2D
@export var scene: PackedScene

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_packed(scene)

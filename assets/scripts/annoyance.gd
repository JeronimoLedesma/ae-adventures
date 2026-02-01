extends Control
signal slow()

var popup_slow = preload("res://assets/Scenes/Objects/All Levels/popup_slow.tscn")
var popup_message = preload("res://assets/Scenes/Objects/All Levels/PopupMessage.tscn")
var popup_view = preload("res://assets/Scenes/Objects/All Levels/PopupMessageScreen.tscn")
var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var storing
@export var player: CharacterBody2D

func _ready() -> void:
	self.slow.connect(player.decrease_speed)



func _on_timer_timeout() -> void:
	rng.randomize()
	if rng.randi_range(0, 10) >= 6:
		rng2.randomize()
		storing = rng2.randi_range(1, 3)
		if storing == 1:
			var instance = popup_message.instantiate()
			add_child(instance)
		elif storing == 2:
			var instance = popup_slow.instantiate()
			add_child(instance)
			emit_signal("slow")
			instance.close_slow.connect(player.increase_speed)
		else:
			var instance = popup_view.instantiate()
			add_child(instance)
	$Timer.start()

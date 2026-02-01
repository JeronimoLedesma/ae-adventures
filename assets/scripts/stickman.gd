extends CharacterBody2D


@export var SPEED: int
@export var currentLevel: int
@export var GRAVITY: int
var direction = 1
@export var spriteStickman: AnimatedSprite2D
@export var key: Area2D
@export var door: Area2D
@export var deathplane: Area2D
@export var deathAlert: Sprite2D
@onready var has_key: bool = false
func _ready():
	floor_max_angle = deg_to_rad(70)
	floor_stop_on_slope = false
	floor_snap_length = 8.0
	key.body_entered.connect(_on_key_get)
	door.body_entered.connect(_on_door_enter)
	deathplane.body_entered.connect(_on_die)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0
	
	velocity.x = direction * SPEED
	
	move_and_slide()
	
	if is_on_wall():
		direction *= -1
		spriteStickman.flip_h = !spriteStickman.flip_h

func _on_key_get(body: CharacterBody2D):
	if body == self:
		print("key")
		has_key = true
		key.queue_free()
	
func _on_die(body: CharacterBody2D):
	deathAlert.visible = true
	await wait(2)
	get_tree().reload_current_scene()

func wait(seconds):
	await get_tree().create_timer(seconds).timeout
	

func increase_speed():
	SPEED = SPEED*2

func decrease_speed():
	SPEED = SPEED/2

func _on_door_enter(body: CharacterBody2D):
	if has_key && (body == self):
		Singleton.complete_level(currentLevel)
		Music.bgm_stop()
		get_tree().change_scene_to_file("res://assets/Scenes/Level-ish/LevelSelect.tscn")

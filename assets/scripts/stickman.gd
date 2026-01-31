extends CharacterBody2D


const SPEED = 500.0
const GRAVITY = 1200.0
var direction = 1
@export var spriteStickman: Sprite2D
@export var key: Area2D
@export var door: Area2D
@onready var has_key: bool = false
func _ready():
	floor_max_angle = deg_to_rad(70)
	floor_stop_on_slope = false
	floor_snap_length = 8.0
	key.body_entered.connect(_on_key_get)
	door.body_entered.connect(_on_door_enter)

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

func _on_door_enter(body: CharacterBody2D):
	if has_key && (body == self):
		print("nivel completado")

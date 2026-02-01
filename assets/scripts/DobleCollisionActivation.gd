extends CollisionPolygon2D
@export var partner: CollisionPolygon2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	partner.disabled = self.disabled

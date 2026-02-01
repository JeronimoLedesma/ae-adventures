extends CollisionPolygon2D
@export var partners: Array[CollisionPolygon2D]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for partner in partners:
		partner.disabled = self.disabled

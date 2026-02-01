extends CollisionShape2D
@export var partners: Array[CollisionShape2D]

func _process(delta: float) -> void:
	for partner in partners:
		partner.disabled = self.disabled

extends Camera2D

var focus: Node2D

func _ready() -> void:
	focus = get_parent()


func _process(delta: float) -> void:
	position.x = (focus.position.x)
	position.y = focus.position.y - 50

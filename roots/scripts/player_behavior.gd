extends CharacterBody2D

const defspeed = 200
var speed = 0

var control:bool = true
var direction:Vector2

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("MOVE_LEFT"):
		direction = Vector2.LEFT
	if Input.is_action_pressed("MOVE_RIGHT"):
		direction = Vector2.RIGHT
	
	if control:
		if Input.is_action_pressed("MOVE_LEFT") or Input.is_action_pressed("MOVE_RIGHT"):
			speed = defspeed
		else:
			if speed > 0:
				speed = 0
			
		velocity.x = speed * direction.x
	
	move_and_slide()

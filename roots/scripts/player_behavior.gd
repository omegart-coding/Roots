extends CharacterBody2D

# movement variables
const defspeed = 200
var speed = 0
const jumpforce = -600
const dashforce = 600


# movement boolians
var canjump:bool = false
var jumpbuffer: bool = false
var isdashing:bool = false
var sidemoving:bool = false
var candash:bool = false

var control:bool = true
var direction:Vector2

func jump():
	velocity.y = jumpforce
	jumpbuffer = false

func dash(dashtime):
	var dashvel = Vector2(0,0)
	candash = false
	isdashing = true
	if sidemoving:
		dashvel.x = direction.x * dashforce
	if Input.is_action_pressed("DIR_UP"):
		dashvel.y = -dashforce
	elif Input.is_action_pressed("DIR_DOWN"):
		dashvel.y = dashforce
	
	if (dashvel.x != 0 and dashvel.y != 0):
		velocity = dashvel * 0.9
	else:
		velocity = dashvel
	
	await get_tree().create_timer(dashtime).timeout
	velocity.x = 0
	velocity.y = 0
	isdashing = false



func _process(delta: float) -> void:
	if is_on_floor():
		if !canjump:
			canjump = true
		if !candash and !isdashing:
			candash = true
		
	
	if Input.is_action_pressed("DIR_LEFT"):
		direction = Vector2.LEFT
		sidemoving = true
	elif Input.is_action_pressed("DIR_RIGHT"):
		direction = Vector2.RIGHT
		sidemoving = true
	else:
		sidemoving = false
	
	if control:
		if Input.is_action_pressed("DIR_LEFT") or Input.is_action_pressed("DIR_RIGHT"):
			speed = defspeed
		else:
			if speed > 0:
				speed = 0
		if Input.is_action_just_pressed("JUMP") and canjump:
			if velocity.y > 0 or is_on_floor():
				jumpbuffer = true
	
		if Input.is_action_pressed("JUMP"):
			if is_on_floor() and jumpbuffer:
				jump()
		elif Input.is_action_just_released("JUMP") and !is_on_floor() and velocity.y < 0:
			velocity.y = 0
		
		if Input.is_action_just_pressed("DASH") and candash:
			dash(0.4)
	
	if !isdashing:
		velocity.x = speed * direction.x
		
	if !is_on_floor():
		if !isdashing:
			velocity += get_gravity() * delta
	
	move_and_slide()

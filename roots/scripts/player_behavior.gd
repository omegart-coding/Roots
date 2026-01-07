extends CharacterBody2D

# movement variables
const defspeed = 400
var speed = 0
const jumpforce = -600
const dashforce = 800
const grabspeed = 1600

# movement boolians
var canjump:bool = false
var jumpbuffer: bool = false
var isdashing:bool = false
var sidemoving:bool = false
var candash:bool = false
var can_grab: bool = false
var grabbing:bool = false

var closest_grab

var control:bool = true
var direction:Vector2

const maxstamina = 1000
var stamina

func _ready() -> void:
	stamina = maxstamina

func jump():
	velocity.y = jumpforce
	jumpbuffer = false

func dash(dashtime):
	var dashvel = Vector2(0,0)
	stamina -= 5
	candash = false
	isdashing = true
	if sidemoving:
		dashvel.x = direction.x * dashforce
	if Input.is_action_pressed("DIR_UP"):
		dashvel.y = -dashforce
	elif Input.is_action_pressed("DIR_DOWN"):
		dashvel.y = dashforce

	if (dashvel.x == 0 or dashvel.y == 0):
		velocity = dashvel
	else:
		velocity = dashvel * 0.9
		
	await get_tree().create_timer(dashtime).timeout
	velocity.x = 0
	velocity.y = 0
	isdashing = false

func grab():
	if closest_grab != null:
		can_grab = false
		grabbing = true


func grab_end():
	var istrue = false
	for area in $grabcollision.get_overlapping_bodies():
		if area == closest_grab:
			istrue = true
	return istrue

func _process(delta: float) -> void:
	if is_on_floor():
		if !canjump:
			canjump = true
		if !candash and !isdashing:
			candash = true
		if !can_grab:
			can_grab = true

	closest_grab = $grabdetect.checkgrab()
	
	if Input.is_action_pressed("DIR_LEFT"):
		direction = Vector2.LEFT
		sidemoving = true
	elif Input.is_action_pressed("DIR_RIGHT"):
		direction = Vector2.RIGHT
		sidemoving = true
	else:
		sidemoving = false
	
	if control and !grabbing:
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
		
		if Input.is_action_just_pressed("SELECT") and can_grab:
			grab()
	elif grabbing:
			
		velocity = position.direction_to(closest_grab.position) *  grabspeed
		if grab_end():
			closest_grab = null
			grabbing = false
			velocity *= 0.1
	
	if !isdashing and !grabbing:
		velocity.x = speed * direction.x
		
	if !is_on_floor():
		if !isdashing and !grabbing:
			velocity += get_gravity() * delta
	
	move_and_slide()

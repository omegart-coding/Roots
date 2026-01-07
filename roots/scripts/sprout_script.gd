extends StaticBody2D

var active = false

func _ready() -> void:
	add_to_group("grabable")
	$CPUParticles2D.emitting = false

func process():
	if active == true:
		emit(true)
	
	active = false

func emit(emitting):
	if emitting and !$CPUParticles2D.emitting:
		$CPUParticles2D.emitting = true
		
	elif !emitting and $CPUParticles2D.emitting:
		$CPUParticles2D.emitting = false

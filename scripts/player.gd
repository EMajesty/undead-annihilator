extends CharacterBody2D

const SPEED = 200.0
var look = Vector2()
var move_vector
var look_vector

func _init():
	pass

func _process(delta):
	move_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	look_vector = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")

	velocity = move_vector * SPEED
	
	if look_vector != Vector2.ZERO:
		$weapon_mg.rotation = atan2(look_vector.y, look_vector.x)

	if velocity != Vector2.ZERO:
		$legs.rotation = lerp($legs.rotation, atan2(move_vector.y, move_vector.x), 0.005)
	
	move_and_slide()

func _physics_process(delta):
	aim()

func aim():
	# lerp this later
	#$weapon_mg.look_at(get_global_mouse_position())
	look.y = Input.get_axis("aim_left", "aim_right")
	look.x = Input.get_axis("aim_up", "aim_down")

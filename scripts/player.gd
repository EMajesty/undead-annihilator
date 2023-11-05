extends CharacterBody2D

const SPEED = 200.0

func _init():
	pass

func _process(delta):
	# lerp this later
	$weapon_mg.look_at(get_global_mouse_position())
	
	# Get the input direction and handle the movement/deceleration.
	var horizontal = Input.get_axis("left", "right")
	if horizontal:
		velocity.x = horizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var vertical = Input.get_axis("up", "down")
	if vertical:
		velocity.y = vertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if velocity != Vector2.ZERO:
		$legs.rotation = lerp($legs.rotation, atan2(velocity.y, velocity.x), 0.005)
	
	move_and_slide()

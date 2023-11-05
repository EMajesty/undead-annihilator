extends CharacterBody2D

var splatter = preload("res://scenes/splatter.tscn")

var target = null
const SPEED = 50.0
var health = 100

func _process(delta):
	if health <= 0:
		die()

func _physics_process(delta):
	if target:
		$".".look_at(target.global_position)
		var velocity = global_position.direction_to(target.global_position)
		move_and_collide(velocity * SPEED * delta)

func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name == "player":
		target = body

"""func _on_area_2d_body_exited(body):
	if body.name == "player":
		target = null
"""
func get_hit():
	health -= 20

func die():
	var s = splatter.instantiate()
	owner.add_child(s)
	s.transform = $".".global_transform
	queue_free()

extends Node2D

var bullet = preload("res://scenes/bullet.tscn")

func _process(delta):
	
	if Input.is_action_just_pressed("lmb"):
		shoot()

func shoot():
	var b = bullet.instantiate()
	owner.owner.add_child(b)
	b.transform = $muzzle.global_transform

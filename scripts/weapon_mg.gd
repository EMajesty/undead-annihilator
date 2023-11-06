extends Node2D

var rng = RandomNumberGenerator.new()
var bullet = preload("res://scenes/bullet.tscn")

func _process(delta):
	
	if Input.is_action_pressed("shoot_primary"):
		if $firerate.is_stopped():
			$firerate.start()
			shoot()

func shoot():
	var b = bullet.instantiate()
	owner.owner.add_child(b)
	b.transform = $muzzle.global_transform
	b.rotation = b.rotation + rng.randf_range(-0.05, 0.05)

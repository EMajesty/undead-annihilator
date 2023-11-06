extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	print($spawnarea.get_overlapping_bodies())
	if !$spawnarea.has_overlapping_bodies():
		var e = enemy.instantiate()
		owner.add_child(e)
		e.transform = $spawnarea.global_transform

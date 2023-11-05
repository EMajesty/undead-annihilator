extends Area2D

var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	queue_free()
	#if body.is_in_group("enemies"):
	#	body.queue_free()
	#	queue_free()
	if body.has_method("get_hit"):
		body.get_hit()

func _on_timer_timeout():
	queue_free()

extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	# TODO: clamp this so left/right look does not exceed up/down
	$".".position =  lerp($"../../player".position, mouse_pos, 0.3)

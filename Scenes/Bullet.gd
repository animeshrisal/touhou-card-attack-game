extends Area2D

const SPEED = Vector2(0, -20)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position += SPEED

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()# replace with function body

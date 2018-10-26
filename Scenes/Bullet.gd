extends Area2D

const SPEED = Vector2(0, -20)
const TYPE = "BULLET"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position += SPEED

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()# replace with function body


func _on_Bullet_body_entered(body):
	if body.get("TYPE") == "Ball":
		var direction = body.get_position() - get_position()
		var motion = direction.normalized() * 400
		if motion.y > 0:
			motion.y = -motion.y
		body.motion = motion 
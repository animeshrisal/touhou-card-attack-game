extends RigidBody2D

const HEIGHT = 400
const WIDTH = 640
var speed
const TYPE = "Ball"

func _ready():
	pass

func _physics_process(delta):
	
	if position.x < 0 or position.x > WIDTH:
		linear_velocity.x = -linear_velocity.x
	

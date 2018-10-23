extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var motion = Vector2(200, 200)
const TYPE = "Ball"
const HEIGHT = 400
const WIDTH = 640
const GRAVITY = 4


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	motion.y += GRAVITY
	
	if position.y > HEIGHT - 8 or position.y < 8:
		motion.y = -motion.y
		
	if position.x < 8 or position.x > WIDTH - 8:
		motion.x = -motion.x
		
	if is_on_floor():
		motion.y = -motion.y * 0.75
		
	move_and_slide(motion, Vector2(0, -1))
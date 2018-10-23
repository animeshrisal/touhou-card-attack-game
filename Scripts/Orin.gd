extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var motion = Vector2()
const HEIGHT = 400
const WIDTH = 640



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	motion.x = 4
	
	if Input.is_action_pressed("ui_left") and position.x > 16:
		position.x -= motion.x
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_right") and position.x < WIDTH-16:
		position.x += motion.x
		$AnimatedSprite.flip_h = true
		
	if Input.is_action_pressed("ui_accept"):
		$AttackArea/CollisionShape2D.disabled = false
	else:
		$AttackArea/CollisionShape2D.disabled = true
		
	if Input.is_action_just_pressed("ui_up"):
		var bullet = preload("res://Scenes/Bullet.tscn").instance()
		bullet.position = get_position()
		get_parent().add_child(bullet)
		
		


func _on_AttackArea_body_entered(body):
	if body.get("TYPE") == "Ball":
		var direction = body.get_position() - get_position()
		var motion = direction.normalized() * 400
		body.motion = motion 
		
		
	


func _on_OrinArea_body_entered(body):
	queue_free()

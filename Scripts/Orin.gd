extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var motion = Vector2()
const HEIGHT = 400
const WIDTH = 640
var new_anim = ""
var current_anim = ""
var spinning = false


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	motion.x = 4
	
	if Input.is_action_pressed("ui_left") and position.x > 16:
		position.x -= motion.x
		$AnimatedSprite.flip_h = false
		new_anim = "run"
		
	elif Input.is_action_pressed("ui_right") and position.x < WIDTH-16:
		position.x += motion.x
		$AnimatedSprite.flip_h = true
		new_anim = "run"
		
	else:
		new_anim = "default"
		
	if Input.is_action_just_pressed("bullet"):
		spinning = true
		
		
	if spinning:
		new_anim = "spin"
		$AttackArea/CollisionShape2D.disabled = false
		$OrinArea/CollisionShape2D.disabled = true
		$OrinCollision.disabled = true
		$Spin.visible = true
		$Spin.play("spin")
		
		if $AnimatedSprite.animation == "spin" and $AnimatedSprite.frame == 9:
			spinning = false
			$Spin.play("notspin")
			
	else:
		$AttackArea/CollisionShape2D.disabled = true
		$OrinArea/CollisionShape2D.disabled = false
		$OrinCollision.disabled = false
		
	if Input.is_action_just_pressed("ui_up"):
		var bullet = preload("res://Scenes/Bullet.tscn").instance()
		bullet.position = get_position()
		bullet.position.y -= 20
		get_parent().add_child(bullet)
		
	if new_anim != current_anim:
		current_anim = new_anim
		$AnimatedSprite.play(current_anim)
		
func _on_AttackArea_body_entered(body):
	if body.get("TYPE") == "Ball":
		var direction = body.get_position() - get_position()
		var motion = direction.normalized() * 400
		motion.y -= 250
		body.motion = motion 
		
func _on_OrinArea_body_entered(body):
	if body.get("TYPE") == "Ball":
		queue_free()

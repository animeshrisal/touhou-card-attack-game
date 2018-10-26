extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var motion = Vector2(0, 1)
const TYPE = "ENEMY_BULLET"


var new_animation = ""
var current_animation = "default"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position += motion
	
	
	
	if $AnimatedSprite.frame == 3:
		queue_free()
		
	if new_animation != current_animation:
		if new_animation == "explode":
			motion.y = 0
		current_animation = new_animation
		$AnimatedSprite.play(new_animation)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_EnemyBullet_area_entered(area):
	if area.get("TYPE") == "BULLET" :
		print("AAA")
		new_animation = "explode"

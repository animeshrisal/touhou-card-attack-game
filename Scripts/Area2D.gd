extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var current_animation = "default"
var new_animation = ""

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if $AnimatedSprite.frame ==  3:
		queue_free()
		
	if new_animation != current_animation:
		current_animation = new_animation
		$AnimatedSprite.play(new_animation)
	

func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("turn_over")

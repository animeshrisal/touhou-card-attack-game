extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const WIDTH = 680


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	pass

func _on_Timer_timeout():
	print("AAA")


func _on_EnemyBullet_Timer_timeout():
	var bullet = preload("res://Scenes/EnemyBullet.tscn").instance()
	randomize()
	var random_x_position = randi() % WIDTH
	var random_direction = rand_range(-10, 10)

	bullet.position.x = random_x_position
	bullet.position.y = 0
	
	if randi() % 2 == 1:
		random_x_position = -random_x_position

	
	get_parent().add_child(bullet)

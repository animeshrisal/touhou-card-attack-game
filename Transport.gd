extends Area2D

var current_animation = ""
var new_animation = ""
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var selected_transport = 0
var inside = false
var ball_generated = false
var ball_entered = false

var transport_group

func _ready():
	transport_group = get_tree().get_nodes_in_group("Transport")

func get_random_number():
    randomize()
    return randi()%transport_group.size()

func _process(delta):
	
	
	if $AnimatedSprite.frame == 4 and current_animation == "ball_in" and not ball_entered:
		ball_entered = true
		new_animation = "default"
		var total = transport_group.size()
		selected_transport = get_random_number()
		transport_group[selected_transport].new_animation = "default"
		new_animation = "default"
		ball_generated = true
		transport_group[selected_transport].inside = true
		var ball = preload("res://Scenes/Ball.tscn").instance()
		var motion_x = randf() * 2 - 1
		var motion_y = randf() * 2 - 1
		ball.motion = Vector2(motion_x, motion_y).normalized() * 400
		ball.position = transport_group[selected_transport].position
		get_parent().add_child(ball)
		
	if current_animation == "default":
		ball_entered = false
		ball_generated = false
		
	print(selected_transport)

	if current_animation != new_animation:
		current_animation = new_animation
		$AnimatedSprite.play(current_animation)

func _on_Transport_body_entered(body):
	if body.get("TYPE") == "Ball" and not inside:
		inside = true
		body.queue_free()
		new_animation = "ball_in"
		

func _on_Transport_body_exited(body):
	if body.get("TYPE") == "Ball":
		inside = false

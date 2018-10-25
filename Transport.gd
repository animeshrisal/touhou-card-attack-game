extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var inside = false

func _ready():
	pass

func _process(delta):
	pass

func _on_Transport_body_entered(body):
	if body.get("TYPE") == "Ball" and not inside:
		inside = true
		var transport_group = get_tree().get_nodes_in_group("Transport")
		var total = transport_group.size()
		var selected_transport = randi() % total
		transport_group[selected_transport].inside = true
		var motion_x = randf() * 2 - 1
		var motion_y = randf() * 2 - 1
		body.motion = Vector2(motion_x, motion_y).normalized() * 400
		body.position = transport_group[selected_transport].position


func _on_Transport_body_exited(body):
	if body.get("TYPE") == "Ball":
		inside = false

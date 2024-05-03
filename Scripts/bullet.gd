extends Area2D

var speed = 100
var direction = Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta
	rotation = direction.angle()
	#rotation = linear_velocity.angle()

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	# TODO: body.set_status(bullet_type)
	pass
	
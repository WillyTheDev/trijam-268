extends CharacterBody2D


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 300
	move_and_slide()
	if Input.is_action_just_pressed("dash"):
		dash()

		
func dash():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
extends CharacterBody2D


var health = 5

const LOADING_DASH_TIME = 2
var load_dash_acc = 0

signal player_took_damage

var direction = Vector2(0,0)
var dashing = false
const DASH_TIME = 0.2
var dash_acc = 0
var rotation_speed = 2
var screen_size = Vector2i(0,0)

func _ready():
	screen_size = get_viewport_rect().size
	%ProgressBar.min_value = 0
	%ProgressBar.max_value = LOADING_DASH_TIME

func take_damage():
	if dashing == false:
		health -= 1
		player_took_damage.emit(health)
	

func _physics_process(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# prevent player going out of screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if dashing == false:
		velocity = direction * 200
	move_and_slide()
	look_at(get_global_mouse_position())
	
func _input(event):
	if dashing: return
	
	if Input.is_action_pressed('dash'):
		if load_dash_acc >= LOADING_DASH_TIME:
			print("Dashing")
			velocity = direction * 500
			dashing = true
			load_dash_acc = 0
		
func _process(delta):
	if dashing:
		dash_acc += delta
	else:
		load_dash_acc += delta
		print(delta)
		%ProgressBar.value = load_dash_acc

	if dash_acc >= DASH_TIME:    
		dashing = false
		velocity = direction * 200
		dash_acc = 0
	
	


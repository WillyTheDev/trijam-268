extends Node2D

var current_state : State
var previous_state : State

@export var normal_cloud: Texture2D
@export var attacking_cloud: Texture2D

func _ready():
	current_state = get_child(0) as State
	previous_state = current_state
	current_state.enter()
	get_parent().find_child("Sprite2D").texture = normal_cloud

func change_state(state):
	if state == previous_state.name:
		return
	
	if (state == "Idle"):
		get_parent().find_child("Sprite2D").texture = normal_cloud
	else:
		get_parent().find_child("Sprite2D").texture = attacking_cloud
		
	current_state = find_child(state) as State
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state

extends Node2D

var time_start = 0
var time_now = 0

func _ready():
	time_start = Time.get_ticks_msec() / 1000
	print(time_start)

func _on_player_player_took_damage(health):
	%HealthLabel.text = "health : %s" % health
	if health == 0:
		game_over()

func _process(delta):
	time_now = Time.get_ticks_msec() / 1000
	%TimeElapsedLabel.text = "time : %s" % (time_now - time_start)

func game_over():
	%GameOverScreen.visible = true
	

func _on_button_pressed():
	get_tree().reload_current_scene()

	

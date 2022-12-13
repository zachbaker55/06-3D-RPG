extends Node

var timer = 0
var score = 0

func _ready():
	update_score(0)

func reset():
	timer = 0
	score = 0
	update_score(0)
	
func _unhandled_input(event):
	if event.is_action_pressed("menu"):		
		var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
		if Pause_Menu == null:
			get_tree().quit()
		else:
			if Pause_Menu.visible:
				get_tree().paused = false
				Pause_Menu.hide()
			else:
				get_tree().paused = true 
				Pause_Menu.show()
				
func update_score(s):
	score += s
	get_node("/root/Game/UI/Score").text = "Score: " + str(score)
	
func update_time():
	var t_m = floor(timer/60.0)
	var t_s = timer % 60
	var t = "Time: %02d" % t_m
	t += ":%02d" % t_s
	get_node("/root/Game/UI/Time").text = t
	

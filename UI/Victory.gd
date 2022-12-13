extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	$Label.text = "You win! Your score was " + str(Global.score)


func _on_Replay_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()

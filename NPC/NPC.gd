extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to Zach's game! (Press R)",
	"Shoot the targets and the drone before you run out of time",
	"Good luck, and begin!"
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/TargetContainer").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()

extends Control

onready var sceen_tree: = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score: Label = $Score

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("playe_die", self, "_PlayerData_player_died")
	update_interface()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not self.paused
		sceen_tree.set_input_as_handled()

func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	sceen_tree.paused = value	
	pause_overlay.visible = value


extends Control

onready var sceen_tree: = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score: Label = $Score
onready var pause_title: Label = $PauseOverlay/Title

const DIE_MESSAGE: = "You die"

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "on_PlayerData_player_died")
	update_interface()

func on_PlayerData_player_died() -> void:
	self.paused = true
	pause_title.text = DIE_MESSAGE

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_title.text != DIE_MESSAGE:
		self.paused = not self.paused
		sceen_tree.set_input_as_handled()

func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	sceen_tree.paused = value	
	pause_overlay.visible = value


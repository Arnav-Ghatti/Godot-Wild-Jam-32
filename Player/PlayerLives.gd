extends Control

onready var life1 = get_parent().get_node("PlayerLives/Life1")
onready var life2 = get_parent().get_node("PlayerLives/Life2")
onready var life3 = get_parent().get_node("PlayerLives/Life3")

func _ready() -> void:
	life1.show()
	life2.show()
	life3.show()

func _process(delta: float) -> void:
	if Global.player_lives == 2:
		life3.hide()
	if Global.player_lives == 1:
		life2.hide()
		life3.hide()
	if Global.player_lives == 0:
		life1.hide()
		life2.hide()
		life3.hide()

extends Node2D

onready var right_launcher = get_node("MissileLaunchers/Right")
onready var left_launcher = get_node("MissileLaunchers/Left")
onready var up_launcher = get_node("MissileLaunchers/Up")
onready var down_launcher = get_node("MissileLaunchers/Down")

onready var death_anim = get_node("UI/DeathScreen/ShowAnim")
onready var wave_anim = get_node("UI/Wave/WaveAnim")

func _ready() -> void:
	Global.wave_end_text = Global.wave_times[Global.wave_index]
	if Global.wave == 1:
		Global.player_lives = 3
	$UI/Wave.text = "Wave: " + str(Global.wave)
	$Fade/FadeAnim.play("FadeIn")
	yield($Fade/FadeAnim, "animation_finished")
	$Fade/FadeInOut.hide()

func launch_missile(bullet, _position, _direction) -> void:
	var m = bullet.instance()
	call_deferred("add_child", m)
	m.start(_position, _direction, $Player)

func _on_LaunchTimer_timeout() -> void:
	var rand_num = round(rand_range(1, 4))
	if rand_num == 1:
		right_launcher.launch()
	elif rand_num == 2:
		left_launcher.launch()
	elif rand_num == 3:
		up_launcher.launch()
	else:
		down_launcher.launch()

func _on_Right_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Left_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Up_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Down_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Timer_next_wave() -> void:
	Global.next_wave()
	$UI/Wave.text = "Wave: " + str(Global.wave)
	wave_anim.play("Wave")

func _on_Player_player_dead() -> void:
	Global.player = null
	$UI/DeathScreen/Time.set_text(str(Global.mins) + ":" + str(Global.sec) + ":" + str(Global.ms))
	$UI/DeathScreen/Wave.text = "Wave: " + str(Global.wave)
	$UI/DeathScreen/DeathMessage.text = str(Global.player_name) + " Got Killed By Deadly\nP-90 Missile"
	death_anim.play("ShowAnim")

func _on_Restart_pressed() -> void:
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	Global.wave = 1
	Global.player_lives = 3
	Global.wave_index = 0
	get_tree().reload_current_scene()

func _on_MainMenu_pressed() -> void:
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	get_tree().change_scene("res://SingleScenes/MainMenu.tscn")

func _on_Timer_game_over() -> void:
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	get_tree().change_scene("res://SingleScenes/GameFinished.tscn")

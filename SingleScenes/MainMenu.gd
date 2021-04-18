extends Control

func _ready() -> void:
	MusicController.play_song()
	Global.wave = 1
	Global.wave_index = 0
	$Fade/FadeAnim.play("FadeIn")
	yield($Fade/FadeAnim, "animation_finished")
	$Fade/FadeInOut.hide()

func _on_Play_pressed() -> void:
	$Click.play()
	if $Name.text == "":
		$NameWarning/ShowAnim.play("ShowAnim")
	else:
		Global.player_name = $Name.text
		$Fade/FadeInOut.show()
		$Fade/FadeAnim.play("FadeOut")
		yield($Fade/FadeAnim, "animation_finished")
		get_tree().change_scene("res://SingleScenes/Main.tscn")

func _on_Exit_pressed() -> void:
	$Click.play()
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	get_tree().quit()

func _on_github_pressed() -> void:
	$Click.play()
	OS.shell_open("https://github.com/Arnav-Ghatti/")

func _on_itchio_pressed() -> void:
	$Click.play()
	OS.shell_open("https://arnav-ghatti.itch.io/")

func _on_facebook_pressed() -> void:
	$Click.play()
	OS.shell_open("https://www.facebook.com/arnav.ghatti.3/")

func _on_OK_pressed() -> void:
	$Click.play()
	$NameWarning/ShowAnim.play_backwards("ShowAnim")

func _on_Help_pressed():
	$Click.play()
	$HelpStuff/ShowAnim.play_backwards("ShowAnim")

func _on_Back_pressed():
	$Click.play()
	$HelpStuff/ShowAnim.play("ShowAnim")

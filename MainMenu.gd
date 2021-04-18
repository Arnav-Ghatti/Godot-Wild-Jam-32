extends Control

func _ready() -> void:
	$Fade/FadeAnim.play("FadeIn")
	yield($Fade/FadeAnim, "animation_finished")
	$Fade/FadeInOut.hide()

func _on_Play_pressed() -> void:
	if $Name.text == "":
		$NameWarning/ShowAnim.play("ShowAnim")
	else:
		Global.player_name = $Name.text
		$Fade/FadeInOut.show()
		$Fade/FadeAnim.play("FadeOut")
		yield($Fade/FadeAnim, "animation_finished")
		get_tree().change_scene("res://Main.tscn")

func _on_Exit_pressed() -> void:
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	get_tree().quit()

func _on_github_pressed() -> void:
	OS.shell_open("https://github.com/Arnav-Ghatti/")

func _on_itchio_pressed() -> void:
	OS.shell_open("https://arnav-ghatti.itch.io/")

func _on_facebook_pressed() -> void:
	OS.shell_open("https://www.facebook.com/arnav.ghatti.3/")

func _on_OK_pressed() -> void:
	$NameWarning/ShowAnim.play_backwards("ShowAnim")

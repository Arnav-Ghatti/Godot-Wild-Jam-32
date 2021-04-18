extends Control

func _ready():
	$Fade/FadeAnim.play("FadeIn")
	yield($Fade/FadeAnim, "animation_finished")
	$Fade/FadeInOut.hide()

func _on_Exit_pressed() -> void:
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	get_tree().quit()

func _on_MainMenu_pressed() -> void:
	$Fade/FadeInOut.show()
	$Fade/FadeAnim.play("FadeOut")
	yield($Fade/FadeAnim, "animation_finished")
	get_tree().change_scene("res://SingleScenes/MainMenu.tscn")

func _on_github_pressed() -> void:
	OS.shell_open("https://github.com/Arnav-Ghatti/")

func _on_itchio_pressed() -> void:
	OS.shell_open("https://arnav-ghatti.itch.io/")

func _on_facebook_pressed() -> void:
	OS.shell_open("https://www.facebook.com/arnav.ghatti.3/")

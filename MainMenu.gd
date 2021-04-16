extends Control

func _on_Play_pressed() -> void:
	Global.player_name = $Name.get_text()
	get_tree().change_scene("res://Main.tscn")

func _on_Exit_pressed() -> void:
	get_tree().quit()

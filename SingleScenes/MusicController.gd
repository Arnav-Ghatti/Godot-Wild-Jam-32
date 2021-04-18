extends Node2D

var music = load("res://Audio/MainSong.wav")

func play_song() -> void:
	$Music.stream = music
	$Music.play()

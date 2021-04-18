extends Node

var wave = 1
var wave_end_text = ""
var end_text = "0:0:0"
var wave_index = 0
var wave_times = [
	"0:25:0",
	"0:50:0",
	"1:30:0",
	"2:0:0",
	"2:45:0",
	"3:15:0",
	"4:0:0"
]

var last_wave = false

func _process(delta: float) -> void:
	if wave == 7 and wave_index == 6:
		last_wave = true

var ms = 0
var sec = 0
var mins = 0

var player = null
var player_lives = 3
var player_name = ""

func next_wave() -> void:
	if not last_wave:
		wave += 1
		wave_index += 1
		wave_end_text = wave_times[wave_index]

extends Node

var wave = 1
var wave_end_text = ""
var wave_index = 0

var player_name = ""

func next_wave() -> void:
	wave += 1
	wave_index += 1

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

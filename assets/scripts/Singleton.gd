extends Node

var levels_completed: int = 0

func complete_level(level: int):
	if level > levels_completed:
		levels_completed += 1

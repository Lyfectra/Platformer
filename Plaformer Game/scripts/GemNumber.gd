extends Panel

var collected = 0

func picked_up():
	collected += 1
	$GemCounter.text = str(collected)
	print("+1 Gem")

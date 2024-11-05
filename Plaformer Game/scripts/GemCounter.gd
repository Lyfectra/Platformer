extends Label

func _process(delta):
	#calls the game_started variable and chekcs what it is set to
	if Ui.game_started:
		#changes the text in the label to the gem variable in the Ui script
		self.text = str(Ui.gems)


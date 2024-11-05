extends Panel

func _ready():
	#sets the labels text to the content variable in the Ui script
	$ScoreBoard.text = Ui.content

extends Panel  # Or whatever your parent node is
@onready var label: Label = $Label

func update_ui_texts():
	label.text = tr("language")
	# Update other translated UI texts here, e.g.:
	# $OtherLabel.text = tr("some_key")

extends Panel
@onready var label: Label = $LanguagePanel/Label


func update_ui_texts():
	label.text = tr("language")
	# Update other translated UI texts here, e.g.:
	# $OtherLabel.text = tr("some_key")

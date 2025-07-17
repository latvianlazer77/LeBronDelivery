extends OptionButton

@onready var label: Label = $"../../../Label"





func _ready():
	clear()
	add_item("English")
	add_item("Japanese")
	
	var current_locale = TranslationServer.get_locale()
	if current_locale == "ja":
		select(1)
	else:
		select(0)
	
	connect("item_selected", Callable(self, "_on_item_selected"))

func _on_item_selected(index):
	match index:
		0:
			TranslationServer.set_locale("en")
		1:
			TranslationServer.set_locale("ja")
	get_parent().update_ui_texts()  # Call the parent to update UI texts if it has that method
	
	label.text = tr("Lebron Delivery")

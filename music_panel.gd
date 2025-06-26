extends Panel

@onready var option_button: OptionButton = $OptionButton

func _ready():
	# Add all song names from the MusicManager
	for song_name in Music.songs.keys():
		option_button.add_item(song_name)

	# Connect the signal to handle song selection
	option_button.connect("item_selected", Callable(self, "_on_song_selected"))

func _on_song_selected(index):
	var song_name = option_button.get_item_text(index)
	Music.play_song(song_name)

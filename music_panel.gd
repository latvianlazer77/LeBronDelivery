extends Panel

@onready var option_button: OptionButton = $OptionButton


func _ready():
	# Add all song names from the MusicManager
	for song_name in Music.songs.keys():
		song_selector.add_item(song_name)

	# When a user selects a song, this function will be called
	song_selector.connect("item_selected", Callable(self, "_on_song_selected"))

func _on_song_selected(index):
	var song_name = OptionButton.get_item_text(index)
	Music.play_song(song_name)

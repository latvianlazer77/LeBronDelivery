extends CanvasLayer

@onready var music_selector = $Panel/OptionButton
@onready var resume_button = $Panel/ResumeButton

func _ready():
	visible = false  # Start hidden
	_populate_music()

	music_selector.connect("item_selected", Callable(self, "_on_music_selected"))
	resume_button.connect("pressed", Callable(self, "_on_resume_pressed"))

func _populate_music():
	music_selector.clear()
	for song_name in Music.songs.keys():
		music_selector.add_item(song_name)

func _on_music_selected(index):
	var name = music_selector.get_item_text(index)
	Music.play_song(name)

func _on_resume_pressed():
	get_tree().paused = false
	visible = false

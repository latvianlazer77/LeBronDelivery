extends AudioStreamPlayer2D

@onready var music_player: AudioStreamPlayer2D = $"."

var songs := {}
var current_song := ""

func _ready():
	# Initialize songs with preload checks
	var song_files := {
		"Lebron Lebron Lebron": "res://songs/Lebron James Song  R&B TikTok Song Lebron Lebron Lebron James.mp3",
		"MrLebron": "res://songs/Oh MR. LEBRON (Lyrics) - Lebron James Parody.mp3",
		"BackToBron": "res://songs/ilyaugust - Bring Me Back To Bron  Lyric Video (Bring Me Back To Life parody).mp3",
		"ManOnLakers": "res://songs/MAN ON THE LAKERS ( FULL SONG )  by IMAKEPARODYZZ ).mp3",
		"BlindingBron": "res://songs/Lebron James - Blinding lights (LeParody Song).mp3",
		"MarryBron": "res://songs/Marry Bron -ilyAugust.mp3"
	}
	for song_name in song_files:
		var path = song_files[song_name]
		var stream = load(path)
		if stream != null:
			songs[song_name] = stream
			print("Successfully loaded: ", song_name)
		else:
			print("Failed to load song: ", path)
	print("Music autoload ready with ", songs.size(), " songs")

func play_song(song_name: String):
	if songs.has(song_name):
		if current_song != song_name:
			music_player.stream = songs[song_name]
			music_player.play()
			current_song = song_name
	else:
		print("Song not failed: ", song_name)

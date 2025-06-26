extends AudioStreamPlayer2D

@onready var music_player: AudioStreamPlayer2D = $"."

var songs := {
	"Lebron Lebron Lebron": preload("res://songs/Lebron James Song  R&B TikTok Song Lebron Lebron Lebron James.mp3"),
	"MrLebron": preload("res://songs/Oh MR. LEBRON (Lyrics) - Lebron James Parody.mp3"),
	"BackToBron": preload("res://songs/ilyaugust - Bring Me Back To Bron  Lyric Video (Bring Me Back To Life parody).mp3"),
	"ManOnLakers": preload("res://songs/MAN ON THE LAKERS ( FULL SONG )  by IMAKEPARODYZZ ).mp3"),
	"BlindingBron": preload("res://songs/Lebron James - Blinding lights (LeParody Song).mp3"),
	"MarryBron": preload("res://songs/Marry Bron -ilyAugust.mp3")
}
	
var current_song := ""

func play_song(song_name: String):
	if songs.has(song_name):
		if current_song != song_name:
			music_player.stream = songs[song_name]
			music_player.play()
			current_song = song_name

extends Node

var coins := 0
var delivered_coins := 0

func deliver_coins():
	delivered_coins += coins
	coins = 0

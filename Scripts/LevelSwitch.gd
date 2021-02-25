extends Control

onready var LevelNum = get_node("LevelNum")
onready var TargetObjectsScoreLabel = get_node("TargetObjectsScoreLabel")
onready var DistractorObjectsScoreLabel = get_node("DistractorObjectsScoreLabel")
onready var MissedObjectsScoreLabel = get_node("MissedObjectsScoreLabel")
onready var distractor_object = Global.distractor_object #index of object to avoid during the game
onready var TargetObjectsPoints = PlayerData.targetObjectsPoints
onready var DistractorObjectsPoints = PlayerData.distractorObjectsPoints
onready var MissedObjectsPoints = PlayerData.missedObjectsPoints

var object_labels = ["bowl", "bread", "cheese_grater", "clock", "cup", "pot", "straws",
 "tissue_paper", "toilet_paper", "tooth_paste"] #for display of object to avoid

func _ready():
	$Start.connect("pressed", self, "Start")
	$Quit.connect("pressed", self, "Quit")
	
	if PlayerData.level == 2:
		LevelNum.set_text("2")
	if PlayerData.level == 3:
		LevelNum.set_text("3")
	if PlayerData.level == 4:
		LevelNum.set_text("4")
	if PlayerData.level == 5: 
		LevelNum.set_text("5")
	if PlayerData.level == 6:
		LevelNum.set_text("6")
	
	TargetObjectsScoreLabel.set_text("Target Objects Score: " + str(TargetObjectsPoints))
	
	var object_avoid = str(object_labels[distractor_object])
	var object_avoid2 = object_avoid.replace("_", " ")
	DistractorObjectsScoreLabel.set_text("Number of " + str(object_avoid2) + " hit: " + str(DistractorObjectsPoints))
	
	MissedObjectsScoreLabel.set_text("Number of missed objects: " + str(MissedObjectsPoints))

func Start():
	PlayerData._reset_points()
	Global._reset_objects()
	Global._ready()
	get_tree().change_scene("res://Scenes/Game.tscn")

func Quit():
	get_tree().quit()
extends Node

var currentScene = null
var currentSceneIndex : int = -1

var sample_scenes = [preload("res://scene_sample/FakeLayer.tscn"),
					preload("res://scene_sample/NeonOpen.tscn"),
					preload("res://scene_sample/Horror.tscn"),
					preload("res://scene_sample/LogoGodot.tscn")]

# Called when the node enters the scene tree for the first time.
func _ready():
	setWindowCenter()
	createNextScene()


func setWindowCenter():
	var screen_size = OS.get_screen_size(OS.get_current_screen())
	var window_size = OS.get_window_size()
	var centered_pos = (screen_size - window_size) / 2
	OS.set_window_position(centered_pos)


func createScene(index : int):
	if (currentScene != null):
		currentScene.queue_free()
	
	currentScene = sample_scenes[index].instance() #scene_LogoGodot.instance()
	add_child(currentScene)


func createNextScene():
	currentSceneIndex += 1
	
	if (currentSceneIndex < 0): 
		currentSceneIndex = 0
	
	if (currentSceneIndex >=  sample_scenes.size()): 
		currentSceneIndex = 0
	
	createScene(currentSceneIndex)


func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_SPACE) and just_pressed:
		createNextScene()
	if Input.is_key_pressed(KEY_ESCAPE) and just_pressed:
		get_tree().quit()

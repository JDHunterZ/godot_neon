tool
extends Control

export (String) var text = "" setget set_text, get_text

export (Font) var custom_font = null setget set_custom_font, get_custom_font

export (Color, RGB) var text_color = Color(1,1,1) setget set_text_color, get_text_color

export(String, "Blinking01", "Blinking02", "Blinking03", "Pulse01", "Pulse02") var animation_name setget set_animation_name, get_animation_name


# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(text)
	set_custom_font(custom_font)
	set_text_color(text_color)
	set_animation_name(animation_name)


func set_text(value):
	text = value
	if (has_node("Label")):
		$Label.text = value


func get_text():
	return $Label.text


func set_custom_font(value):
	custom_font = value
	if (has_node("Label")):
		$Label.add_font_override("font", value)


func get_custom_font():
	return $Label.get_font("font")


func set_text_color(value):
	text_color = value
	if (has_node("Label")):
		$Label.add_color_override("font_color", value)


func get_text_color():
	return $Label.get_color("font_color")


func set_animation_name(value):
	animation_name = value
	if (has_node("AnimationPlayer")):
		$AnimationPlayer.current_animation = value


func get_animation_name():
	return $AnimationPlayer.current_animation

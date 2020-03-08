shader_type canvas_item;
//render_mode unshaded;

uniform vec2 iResolution;
uniform sampler2D iChannel0;
uniform vec2 direction;

vec4 blur13(sampler2D image, vec2 uv, vec2 resolution, vec2 dir) {
	vec4 color = vec4(0.0);
	vec2 off1 = vec2(1.411764705882353) * dir;
	vec2 off2 = vec2(3.2941176470588234) * dir;
	vec2 off3 = vec2(5.176470588235294) * dir;
	color += texture(image, uv) * 0.1964825501511404;
	color += texture(image, uv + (off1 / resolution)) * 0.2969069646728344;
	color += texture(image, uv - (off1 / resolution)) * 0.2969069646728344;
	color += texture(image, uv + (off2 / resolution)) * 0.09447039785044732;
	color += texture(image, uv - (off2 / resolution)) * 0.09447039785044732;
	color += texture(image, uv + (off3 / resolution)) * 0.010381362401148057;
	color += texture(image, uv - (off3 / resolution)) * 0.010381362401148057;
	return color;
}

void fragment() 
{
	//vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, 3.0);
	
	//vec4 color = texture(TEXTURE, UV, 3.0);
	//COLOR = color; // vec4(0.0, 1.0, 1.0, 0.5);
	//COLOR.g = UV.x;
	//COLOR.a = texture(TEXTURE, UV).a;
	
	//vec4 color = texture(TEXTURE, UV) * 2.5;
	//float gray_value = (color.r + color.g + color.b) / 3.0;
	//COLOR.rgb = vec3(gray_value);
	
	vec2 uv = UV / iResolution.xy;
	COLOR = blur13(iChannel0, uv, iResolution.xy, direction);
}


void grey()
{
	//vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
	//float gray_value = (color.r + color.g + color.b) / 3.0
	//COLOR.rgb = vec3(gray_value);
}


shader_type spatial;
uniform sampler2D albedo: source_color; 
uniform sampler2D distortion_map; 
uniform vec2 distortion = vec2(0.0,0.0); 

void fragment() {
	vec3 text_distortion = texture(distortion_map, UV+TIME* 0.1).rgb * 2.0 - 1.0; 
	vec2 uv = UV + text_distortion.rg * distortion; 
	ALBEDO = texture(albedo, uv* 3.0).rgb; 
}

shader_type spatial;
uniform sampler2D albedo: source_color; 
uniform sampler2D noise; 
uniform float warp_strength: hint_range(0.0,1.0) = 0.025; 
uniform float warp_speed: hint_range(0.0,16.0) = 0.025; 
uniform float warp_scale: hint_range(0.0,2.0) = 0.5;

vec3 overlay(vec3 base, vec3 blend){
	vec3 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

void fragment(){
	float x_warp = TIME * warp_speed + UV.y * TAU / warp_scale; 
	float y_warp = TIME * warp_speed + UV.x * TAU / warp_scale; 
	
	vec2 distortion_offset = vec2(sin(x_warp), sin(y_warp)) * warp_strength; 
	float n = texture(noise, UV + distortion_offset).r* 0.2; 
	vec3 alb = texture(albedo, UV + distortion_offset).rgb; 
	ALBEDO = overlay(alb, vec3(n)); 
}
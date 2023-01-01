shader_type spatial;
group_uniforms deformation; 
uniform float defstrength: hint_range(0.0, 1.0); 
uniform float deffreq: hint_range(0.0, 5.0); 

void fragment() {
	vec2 uv = UV; 
	uv.y += sin(uv.x * TAU * deffreq) * defstrength; 
	float f = clamp(sin(uv.y * TAU * 5.0),0.0,1.0); 
	ALBEDO = vec3(f); 
	
}

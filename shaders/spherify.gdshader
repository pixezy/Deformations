shader_type spatial; 
uniform float warp_borders: hint_range(0.0, 10.0); 
uniform sampler2D icon_tex : source_color,repeat_disable; 

vec2 spherify(vec2 uv, float _warp_amount){
	vec2 delta = uv - 0.5;
	float delta2 = dot(delta.xy, delta.xy);
	float delta4 = delta2 * delta2;
	float delta_offset = delta4 * _warp_amount;	
	return uv + delta * delta_offset;
}

void fragment(){
	float v = (sin(TIME * TAU)+1.0)*5.0; 
	ALBEDO = texture(icon_tex, spherify(UV,v)).rgb; 
}
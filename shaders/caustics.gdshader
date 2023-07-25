shader_type canvas_item;

uniform sampler2D color_ramp;

vec2 random(vec2 uv) {
	return vec2(fract(sin(dot(uv.xy,
		vec2(12.9898,78.233))) * 43758.5453123));
}

float worley(vec2 uv, float columns, float rows) {
	
	vec2 index_uv = floor(vec2(uv.x * columns, uv.y * rows));
	vec2 fract_uv = fract(vec2(uv.x * columns, uv.y * rows));
	
	float minimum_dist = 1.0;  
	
	for (int y= -1; y <= 1; y++) {
		for (int x= -1; x <= 1; x++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 point = random(index_uv + neighbor);
			
			vec2 diff = neighbor + point - fract_uv;
			float dist = length(diff);
			minimum_dist = min(minimum_dist, dist);
		}
	}
	
	return minimum_dist;
}

void vertex() {
}

void fragment(){
	float scale = 5.05f;
	float worley = worley(UV * scale + TIME * 0.05f, 3.0f, 3.0f);
	float color = texture(color_ramp, vec2(worley)).r;
	color = min(0.999, color);
	color = log(0.999) / log(color);
	color *= 50.0f;
	
	vec2 new_uv1 = vec2(worley);
	vec4 new_texture = texture(color_ramp, new_uv1);
	COLOR.rgba = new_texture.rgba;
}
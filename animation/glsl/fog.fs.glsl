#version 300 es

out vec4 out_FragColor;
in vec3 Normal;
in vec3 Pos;
in vec3 viewPos;
uniform vec3 lightDirectionUniform;
uniform vec3 lightColorUniform;

void main() {
	

	float dis = distance(viewPos,Pos);
	float d = 0.0;
	float fogLevel = exp(-dis*0.02);
	
	//DIFFUSE
	vec3 light_DFF = 0.4 * max(dot(Normal,lightDirectionUniform), 0.0) * lightColorUniform;

	vec4 fog_FragColor = vec4(0.5,0.5,0.5,1.0);

	vec4 LightColor = vec4(light_DFF, 1.0);

	float fog_Factor = clamp(fogLevel,0.0,1.0);

	if(Pos.x>d){
		float fogLevel = 1.0 - exp(-dis*0.2);
		out_FragColor = LightColor;
	}

	out_FragColor = mix(LightColor,fog_FragColor,1.0 - fog_Factor);
	
	}
	

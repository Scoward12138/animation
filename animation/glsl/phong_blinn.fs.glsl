#version 300 es

out vec4 out_FragColor;
in vec3 Normal;
in vec3 Pos;
in vec3 viewPos;
uniform vec3 lightColorUniform;
uniform vec3 lightDirectionUniform;

void main() {
	//TODO: PART 1A

	
	vec3 viewDir = normalize(viewPos-Pos);
	vec3 halfway = 0.5 * normalize(viewDir) + normalize(lightDirectionUniform) * 0.5; 
	//AMBIENT
	vec3 light_AMB = vec3(0.16,0.16,0.16);

	//DIFFUSE
	vec3 light_DFF = 0.8 * max(dot(Normal,lightDirectionUniform), 0.0) * lightColorUniform;

	//SPECULAR
	vec3 light_SPC = 0.8 * pow(max(dot(halfway,Normal), 0.0),10.0)*lightColorUniform;
	//0.8 * pow(max(dot(viewDir, reflectDir), 0.0), 32)* lightColorUniform;

	//TOTAL
	vec3 TOTAL = light_DFF + light_AMB + light_SPC;

	

	out_FragColor = vec4(TOTAL, 1.0);
	}
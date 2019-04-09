#version 300 es
uniform sampler2D tex;
out vec4 out_FragColor;
in vec3 Normal;
in vec3 Pos;
in vec3 viewPos;
uniform vec3 lightColorUniform;
uniform vec3 lightDirectionUniform;

void main() {
    
 	vec3 reflectDir = reflect(-lightDirectionUniform, Normal);
	vec3 viewDir = normalize(viewPos-Pos);

	//AMBIENT
	float light_AMB = 0.4;

	//DIFFUSE
	float light_DFF = 0.8 * max(dot(Normal,lightDirectionUniform), 0.0);

	//SPECULAR
	float light_SPC = 0.8 * pow(max(dot(viewDir, reflectDir), 0.0),10.0);

	//TOTAL INTENSITY
	//TODO PART 1E: calculate light intensity (ambient+diffuse+speculars' intensity term)
	float lightIntensity = light_DFF + light_AMB + light_SPC;

	//TODO PART 1E: change resultingColor based on lightIntensity (toon shading)
	float c1 = 0.95;
	float c2 = 0.5;
	float c3 = 0.25;
	
	vec4 resultingColor = vec4(0.2,0.1,0.1,1.0);
	
	if (lightIntensity > c1)
		resultingColor = vec4(0.0,0.0,0.0,0.0);
	else if (lightIntensity > c2)
		resultingColor = vec4(0.5,0.5,1.0,1.0);
	else if (lightIntensity > c3)
		resultingColor = vec4(0.3,0.3,0.6,1.0);
	else
		resultingColor = vec4(0.4,0.2,0.2,1.0);

   

   	//TODO PART 1E: change resultingColor to silhouette objects

	out_FragColor = resultingColor;
}

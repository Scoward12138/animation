#version 300 es

precision highp float;
precision highp int;
out vec4 out_FragColor;
in vec3 pos;
uniform vec3 spotDirectPosition;
uniform vec3 lightDirectionUniform;
uniform vec3 spotlightPosition;


void main() {

	// TODO: PART 1D

   float spotExponent = 5.0;

   vec3 SpotColor = vec3(1.0, 1.0, 0.0);

   float angle = dot(normalize(spotDirectPosition-spotlightPosition),normalize( pos - spotlightPosition));

   float theta = 0.5;

   vec3 color1 = vec3(0.0,0.0,0.0);

   if(angle > theta){
      color1 = SpotColor * pow(angle, spotExponent);
   } else{
      color1 = vec3(0.0,0.0,0.0);
   }


   out_FragColor = vec4(color1,1.0);
}
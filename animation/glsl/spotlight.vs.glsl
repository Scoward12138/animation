#version 300 es

out vec3 pos;

void main() {

 	// TODO: PART 1D
  pos = vec3(modelMatrix * vec4(position,1.0)); 
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
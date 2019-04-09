#version 300 es

out vec3 Normal;
out vec3 Pos;
out vec3 viewPos;

void main() {

    // TODO: PART 1A
   

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);

    Normal = normalize(vec3(modelMatrix * vec4(normal, 0.0)));

    Pos = vec3(modelMatrix * vec4(position,1.0));

    viewPos = vec3(cameraPosition);
}

#version 300 es
out vec3 Normal;
out vec3 Pos;
out vec3 viewPos;
uniform vec3 ballPosition;

void main() {

    mat4 R = mat4(0.0);

    R[0][0] = 1.0;
    R[2][1] = 1.0;
    R[1][2] = -1.0;
    R[3][3] = 1.0;

    gl_Position = projectionMatrix * viewMatrix * R *(modelMatrix * vec4(position, 1.0));

    Normal = normalize(vec3(modelMatrix * vec4(normal, 0.0)));

    Pos = vec3(modelMatrix * vec4(position,1.0));

    viewPos = vec3(cameraPosition);
}
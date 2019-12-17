#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform vec2 u_mouse;

// defining the number of lights we will use
const int nr_lights = 3;
vec3 lights[nr_lights];


void main() {
    lights[0] = vec3(120, 120, 1); // random light
    lights[1] = vec3(200, 200, 1); // random light
    lights[2] = vec3(u_mouse, 1.0); // light where the mouse is

    // light color
    float r = 1.5;
    float g = 1.1;
    float b = 1.1;
    vec3 color = vec3(0, 0, 0);
    
    // calculating the final FragColor by combining all the lights.
    for (int i = 0; i < nr_lights; i++)
    {
        vec3 lightPos = lights[i];
        float dist = 150.0 / (distance(vec3(gl_FragCoord.x, gl_FragCoord.y, 1), lightPos) * 20.0);
        color.r += dist * r;
        color.g += dist * g;
        color.b += dist * b;
    }

    gl_FragColor = vec4(color, 1.0);
}

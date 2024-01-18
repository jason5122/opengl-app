#version 330 core

layout(location = 0) in vec2 pixelPos;

vec2 pixelToClipSpace(vec2 point) {
    point /= vec2(1728, 1051);   // Normalize to [0.0, 1.0].
    point.y = 1.0 - point.y;     // Set origin to top left instead of bottom left.
    return (point * 2.0) - 1.0;  // Convert to [-1.0, 1.0].
}

void main() {
    vec2 offset = vec2(500, 500);
    gl_Position = vec4(pixelToClipSpace(pixelPos + offset), 0.0, 1.0);
}

#import <OpenGL/gl3.h>

class Renderer {
public:
    Renderer(float width, float height);
    void draw();
    ~Renderer();

private:
    float width, height;
    GLuint shaderProgram;
    GLuint VAO, VBO, EBO;

    void link_shaders();
};

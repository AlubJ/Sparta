function DrawWireframe(_vertexBuffer, _matrix)
{
    matrix_set(matrix_world, _matrix)
    shader_set(shdWireframe);
    vertex_submit(_vertexBuffer, pr_linelist, -1);
    shader_reset();
    matrix_set(matrix_world, matrix_build_identity());
}
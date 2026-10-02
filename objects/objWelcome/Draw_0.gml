/// @desc Draw the particle system

shader_set(shdMesh);
matrix_set(matrix_world, matrix);
vertex_submit(global.gamemakerLogo, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());
shader_reset();

SpartaSystemDraw(particleSystem);
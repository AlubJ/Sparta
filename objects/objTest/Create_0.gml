SpartaSpriteAdd(sprLeaf);

camera = new Camera();

system = new __SpartaClassSystem([256]);

part = new __SpartaClassType();
part.SetSprite(sprLeaf, 0, false);

part.SetLife(60, 100);
part.SetSize(0.1, 1, 0, 0, 1, 2);
part.SetColor(c_green, 0, c_green, 1, c_maroon, 1, c_maroon, 0, false);
part.SetGravity(0, 0, -1, 0.01);
part.SetScale(0, 0.05);
part.SetBlend(true, bm_src_alpha, bm_inv_src_alpha);
part.SetAngle(0, 360, 0.1, 0, false);
part.SetAlphaTest(100);

emitter = new __SpartaClassEmitter(system);
emitter.SetRegion(matrix_build(0, 0, 5, 0, 0, 0, 1, 1, 1), 5, 5, 1, SPARTA_SHAPE_SPHERE, SPARTA_DISTR_LINEAR);
emitter.Stream(part, 1, -1);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();
format = vertex_format_end();

vb = vertex_create_buffer();

vertex_begin(vb, format);

vertex_position_3d(vb, 10, 10, 0);
vertex_texcoord(vb, 0, 0);
vertex_color(vb, c_white, 1);

vertex_position_3d(vb, 10, -10, 0);
vertex_texcoord(vb, 0, 0);
vertex_color(vb, c_white, 1);

vertex_position_3d(vb, -10, -10, 0);
vertex_texcoord(vb, 0, 0);
vertex_color(vb, c_white, 1);

vertex_position_3d(vb, -10, -10, 0);
vertex_texcoord(vb, 0, 0);
vertex_color(vb, c_white, 1);

vertex_position_3d(vb, -10, 10, 0);
vertex_texcoord(vb, 0, 0);
vertex_color(vb, c_white, 1);

vertex_position_3d(vb, 10, 10, 0);
vertex_texcoord(vb, 0, 0);
vertex_color(vb, c_white, 1);

vertex_end(vb);

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
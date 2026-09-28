camera = new Camera();

system = new __SpartaClassSystem([256]);

part = new __SpartaClassType();
part.SetSprite(sprTest, 0, false);

part.SetDirection(0, 0, 1, 10, false);
part.SetLife(10, 100);
part.SetSize(0.1, 1, 0, 0, 1, 2);
part.SetColor(c_white, 0, c_white, 1, c_white, 1, c_white, 0, false);
part.SetSpeed(0.01, 0.1, 0, false);
part.SetScale(0, 0.1);

emitter = new __SpartaClassEmitter(system);
emitter.SetRegion(matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1), 1, 1, 1, SPARTA_SHAPE_SPHERE, SPARTA_DISTR_LINEAR);
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
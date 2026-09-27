camera = new Camera();

system = new __SpartaClassSystem([256]);

part = new __SpartaClassType();
part.SetSprite(sprTest, 0, false);

part.SetDirection(0, 0, 1, 10, false);
part.SetLife(1, 10);
part.SetSize(10, 20, 0, 0, 1, 2);
part.SetColor(c_white, 1, c_white, 1, c_white, 1, c_white, 1, false);
part.SetSpeed(1, 2, 0, false);

emitter = new __SpartaClassEmitter(system);
emitter.SetRegion(matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1), 5, 5, 5, SPARTA_SHAPE_SPHERE, SPARTA_DISTR_LINEAR);
emitter.Stream(part, 1000, -1);

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
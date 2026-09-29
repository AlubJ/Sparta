SpartaSpriteAdd(sprLeaf);

camera = new Camera();

system = new __SpartaClassSystem([256]);

childPart = new __SpartaClassType();
childPart.SetSprite(sprCircle, -1, false);
childPart.SetLife(10, 20);
childPart.SetSize(0.1, 1, 0, 0, 1, 2);
childPart.SetColor(c_green, 0, c_green, 1, c_maroon, 1, c_maroon, 0, false);

part = new __SpartaClassType();
part.SetSprite(sprLeaf, 0, false);

part.SetLife(10, 20);
part.SetSize(0.1, 1, 0, 0, 1, 2);
part.SetColor(c_green, 0, c_green, 1, c_maroon, 1, c_maroon, 0, false);
part.SetGravity(0, 0, -1, 0.25);
part.SetScale(0, 0.5);
part.SetBlend(true, bm_src_alpha, bm_inv_src_alpha);
part.SetAngle(0, 360, 1, 0, false);
part.SetAlphaTest(100);
part.SetZWrite(true);
//part.SetChild(childPart, 1);
//part.SetCullMode(cull_counterclockwise);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
format2 = vertex_format_end();

var _buffer = buffer_load("gm.vbx");
//part.SetMesh(_buffer, format2, 255);
//part.SetMeshLightDirection(1, 1, -1);
//part.SetMeshRotationAxis(1, 0, 0, 0);

emitter = new __SpartaClassEmitter(SpartaSystemGetGlobal());
emitter.SetRegion(0, 0, 0, 0, 0, 0, 10, 10, 1);
emitter.SetDynamic(true);
emitter.SetShape(SPARTA_SHAPE_CUBE);
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
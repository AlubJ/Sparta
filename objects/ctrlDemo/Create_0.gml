/// @desc Create all globally managed resources
global.camera = new Camera();
global.system = SpartaSystemGetGlobal();
global.demo = "";

// Mesh vertex format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
global.meshVertexFormat = vertex_format_end();

// Wireframe vertex format
vertex_format_begin();
vertex_format_add_position_3d();
global.wireframeVertexFormat = vertex_format_end();

// Create grid
var _gridScale = 10;
var _gridSubdivisions = 10;
var _grid = vertex_create_buffer();

vertex_begin(_grid, global.wireframeVertexFormat);

vertex_position_3d(_grid, -_gridScale, _gridScale, 0);
vertex_position_3d(_grid, _gridScale, _gridScale, 0);
vertex_position_3d(_grid, _gridScale, _gridScale, 0);
vertex_position_3d(_grid, _gridScale, -_gridScale, 0);

for (var _i = -_gridSubdivisions; _i < _gridSubdivisions; _i++)
{
	vertex_position_3d(_grid, (_i/_gridSubdivisions) * _gridScale, -_gridScale, 0);
	vertex_position_3d(_grid, (_i/_gridSubdivisions) * _gridScale, _gridScale, 0);
}

for (var _i = -_gridSubdivisions; _i < _gridSubdivisions; _i++)
{
	vertex_position_3d(_grid, -_gridScale, (_i/_gridSubdivisions) * _gridScale, 0);
	vertex_position_3d(_grid, _gridScale, (_i/_gridSubdivisions) * _gridScale, 0);
}

vertex_end(_grid);

global.grid = _grid;

// Draw grid
DrawGrid = function()
{
    shader_set(shdWireframe);
    vertex_submit(global.grid, pr_linelist, -1);
    shader_reset();
}

// GPU settings
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// Check platform
global.docsDemo = false;
if (os_type == os_gxgames)
{
    global.docsDemo = true;
}

// Rooms
global.rooms = [
    {
        id: rmDemoBasicParticles,
        desc: "Basic particles",
    },
];

// Rooms string
global.roomsString = "Use the numbers on your keyboard to change demo:\n";

var _i = 0;
repeat (array_length(global.rooms))
{
    global.roomsString += global.rooms[_i].desc + $": [{_i + 1}]\n";
    _i++;
}

// Goto demo room
room_goto(rmDemoBasicParticles);
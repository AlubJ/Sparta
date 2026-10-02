/// @desc Create all globally managed resources
global.camera = new Camera();
global.system = SpartaSystemGetGlobal();
global.demo = "";

// Setup command parameters
ArgparRegister("demo", [  ], [ ty_real ], [ -1 ]);
ArgparRegister("welcome", [  ], [  ], [ true ]);
ArgparParse();

// Set a decent dynamic interval
SpartaSystemSetDynamicInterval(global.system, 0.25);

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

// Cube wireframe
global.cubeWireframe = CalicoBuildWireframeAABB();
global.sphereWireframe = CalicoBuildWireframeSphere();

// Load GameMaker model
var _buffer = buffer_load("gm.vbx");
global.gamemakerLogo = vertex_create_buffer_from_buffer(_buffer, global.meshVertexFormat);
buffer_delete(_buffer);

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
        title: "Basic particles",
        desc: "",
    },
    {
        id: rmDemoMeshParticles,
        title: "Mesh particles",
        desc: "You can set particles to have a mesh attached, mesh building is expensive, especially on larger models. The maximum batch of a mesh is 255, meaning a lot of particles will have a performance hit.",
    },
    {
        id: rmDemoDynamicEmitters,
        title: "Dynamic emitters",
        desc: "Dynamic emitters allow you to move an emitter around while properly retaining currently spawned emitters. The way this works is by creating a new emitter every-so-often, and because of this draw calls can massively spike and bring performance down. Though, changing the particle systems dynamic interval may help performance but you'll lose smoothness.",
    },
    {
        id: rmDemoEffects,
        title: "Effects",
        desc: "Effects are a group of types with instructions on how to spawn them over the course of multiple particle system steps. These are a useful way to add reusable effects into your game.",
    },
];

global.welcomeText = "Welcome to Sparta, a shader driven 3D particle system for GameMaker.";

// Rooms string
global.roomsString = "Use the numbers on your keyboard to change demo:\n";

var _i = 0;
repeat (array_length(global.rooms))
{
    global.roomsString += global.rooms[_i].title + $": [{_i + 1}]\n";
    _i++;
}

var _demo = ArgparGet("demo");
global.currentRoom = clamp(_demo, 0, array_length(global.rooms) - 1);

// Goto demo room
room_goto(_demo != -1 ? global.rooms[global.currentRoom].id : rmWelcome);
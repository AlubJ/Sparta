/// @desc Create a mesh particle system and stream them.
// System
particleSystem = global.system;

// Create emitter
particleEmitter = SpartaEmitterCreate(particleSystem);
SpartaEmitterSetRegion(particleEmitter, 0, 0, 0, 0, 0, 0, 1, 1, 1);

// Create the type
particleType = SpartaTypeCreate();

// Set the mesh
var _meshBuffer = buffer_load("gm.vbx");
SpartaTypeSetMesh(particleType, _meshBuffer, global.meshVertexFormat, 255);
buffer_delete(_meshBuffer);

SpartaTypeSetMeshRotationAxis(particleType, 1, 1, -1, 0);
SpartaTypeSetMeshLightDirection(particleType, 1, 1, 1, 0);

// Set the visual properties
SpartaTypeSetSize(particleType, 0.5, 1, 0, -0.01, 0, 1);
SpartaTypeSetColor(particleType, c_green, 0, c_yellow, 1, c_blue, 1, c_red, 0, false);
SpartaTypeSetZWrite(particleType, true);
SpartaTypeSetCullMode(particleType, cull_counterclockwise);

// Set the behaviorial properties
SpartaTypeSetLife(particleType, 2, 5);
SpartaTypeSetDirection(particleType, 0, 0, 1, 10, false);
SpartaTypeSetGravity(particleType, 0, 0, -1, 1);
SpartaTypeSetSpeed(particleType, 2, 5, -0.1, 0);
SpartaTypeSetAngle(particleType, 0, 360, 1, 1, false);

// Stream
SpartaEmitterStream(particleEmitter, particleType, 10, -1);

// Set camera
global.camera.setPitch(-25);
global.camera.setYaw(45);
global.camera.setLookPosition(0, 0, 1);
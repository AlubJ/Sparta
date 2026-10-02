/// @desc Create a basic particle system and stream them.
// System
particleSystem = global.system;

// Create emitter
particleEmitter = SpartaEmitterCreate(particleSystem);
SpartaEmitterSetRegion(particleEmitter, 0, 0, 0, 0, 0, 0, 3, 1, 3);

// Create the type
particleType = SpartaTypeCreate();

// Set the visual properties
SpartaTypeSetSprite(particleType, sprFlame, -1, false);
SpartaTypeSetSize(particleType, 1, 2, 0, 0, 1, 2);
SpartaTypeSetColor(particleType, c_yellow, 0, c_orange, 1, c_orange, 1, c_red, 0, false);
SpartaTypeSetZWrite(particleType, false);

// Set the behaviorial properties
SpartaTypeSetLife(particleType, 0.5, 0.75);
SpartaTypeSetDirection(particleType, 0, 0, 1, 360, false);
SpartaTypeSetSpeed(particleType, 1, 2, -0.1, 0);
SpartaTypeSetAngle(particleType, 0, 360, 0, 0, false);
SpartaTypeSetGravity(particleType, 0, 0, 1, 2);

// Stream
SpartaEmitterStream(particleEmitter, particleType, 200, -1);
SpartaEmitterMature(particleEmitter);

// GameMaker logo matrix
matrix = matrix_build(0, 0, 0, 0, 0, 0, 3, 3, 3);

// Set camera
global.camera.setPitch(-15);
global.camera.setYaw(45);
global.camera.setLookPosition(0, 0, 0);
/// @desc Create a basic particle system and stream them using a dyanmic emitter.
// System
particleSystem = global.system;

// Create emitter
particleEmitter = SpartaEmitterCreate(particleSystem);
SpartaEmitterSetRegion(particleEmitter, 0, 0, 0, 0, 0, 0, 1, 1, 1);
SpartaEmitterSetDynamic(particleEmitter, true);

// Create the type
particleType = SpartaTypeCreate();

// Set the visual properties
SpartaTypeSetSprite(particleType, sprCircle, 0, false);
SpartaTypeSetSize(particleType, 1, 2, 0, 0, 1, 2);
SpartaTypeSetColor(particleType, c_green, 1, c_yellow, 1, c_blue, 1, c_red, 0, false);
SpartaTypeSetZWrite(particleType, false);

// Set the behaviorial properties
SpartaTypeSetLife(particleType, 2, 5);
SpartaTypeSetDirection(particleType, 0, 0, 1, 10, false);
SpartaTypeSetGravity(particleType, 0, 0, -1, 1);
SpartaTypeSetSpeed(particleType, 2, 4, -0.1, 0);

// Stream
SpartaEmitterStream(particleEmitter, particleType, 10, -1);

// Set camera
global.camera.setPitch(-25);
global.camera.setYaw(45);
global.camera.setLookPosition(0, 0, 1);
camera = new Camera();

// System
particleSystem = SpartaSystemGetGlobal();

// Create emitter
particleEmitter = SpartaEmitterCreate(particleSystem);
SpartaEmitterSetRegion(particleEmitter, 0, 0, 0, 0, 0, 0, 1, 1, 1);

// Create the type
particleType = SpartaTypeCreate();

// Set the visual properties
SpartaTypeSetSprite(particleType, sprCircle, 0, false);
SpartaTypeSetSize(particleType, 1, 2, 0, 0, 1, 2);
SpartaTypeSetColor(particleType, c_green, 0, c_yellow, 1, c_blue, 1, c_red, 0, false);

// Set the behaviorial properties
SpartaTypeSetLife(particleType, 2, 5);
SpartaTypeSetDirection(particleType, 0, 0, 1, 10, false);
SpartaTypeSetGravity(particleType, 0, 0, -1, 1);
SpartaTypeSetSpeed(particleType, 2, 4, -0.1, 0);

// Stream
SpartaEmitterStream(particleEmitter, particleType, 10, -1);
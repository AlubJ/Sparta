/// @desc Create an effect and allow them to be played.
// System
particleSystem = global.system;

// Create the type
particleType = SpartaTypeCreate();

// Set the visual properties
SpartaTypeSetSprite(particleType, sprCircle, 0, false);
SpartaTypeSetSize(particleType, 1, 2, 0, 0, 1, 2);
SpartaTypeSetColor(particleType, c_green, 0, c_yellow, 1, c_blue, 1, c_red, 0, false);
SpartaTypeSetZWrite(particleType, false);

// Set the behaviorial properties
SpartaTypeSetLife(particleType, 0.2, 1);
SpartaTypeSetDirection(particleType, 0, 0, 1, 10, false);
SpartaTypeSetGravity(particleType, 0, 0, -1, 1);
SpartaTypeSetSpeed(particleType, 2, 4, -0.1, 0);

// Create the effect
particleEffect = new __SpartaClassEffect();
particleEffect.AddBurst(0, particleType, 500, 0, 0, 0);
particleEffect.AddBurst(1, particleType, 200, 5, 5, 5);
particleEffect.AddBurst(2, particleType, 100, -5, 0, 5);
particleEffect.AddBurst(3, particleType, 50, -5, 0, -5);
particleEffect.AddBurst(4, particleType, 50, -5, 0, -5);
particleEffect.AddBurst(5, particleType, 50, -5, 0, -5);
particleEffect.AddBurst(6, particleType, 50, -5, 0, -5);
particleEffect.AddBurst(7, particleType, 50, -5, 0, -5);
particleEffect.AddBurst(8, particleType, 50, -5, 0, -5);

// Play the effect
particleEffectInstance = SpartaEffectPlay(particleSystem, particleEffect, 0, 0, 0);
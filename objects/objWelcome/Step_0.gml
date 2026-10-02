/// @desc Step the particle system

global.camera.setYaw(global.camera.yaw + 1);
global.camera.stepThird();

SpartaSystemStep(particleSystem, 1 / 60);
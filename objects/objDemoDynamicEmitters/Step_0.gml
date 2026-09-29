/// @desc Step the particle system
SpartaEmitterSetRegionPosition(particleEmitter, dsin(current_time / 20) * 5, dcos(current_time / 20) * 5, 0);
SpartaSystemStep(particleSystem, 1 / 60);
/// @desc Step the particle system
SpartaSystemStep(particleSystem, 1 / 60);

if (!SpartaEffectInstanceIsPlaying(particleEffectInstance))
{
    SpartaEffectInstancePlay(particleEffectInstance);
}
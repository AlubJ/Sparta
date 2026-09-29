// Feather disable all

///
/// Stream particles over multiple frames. Setting the lifespan to `-1` will cause
/// the emitter to not retire.
///
/// @param {Struct.__SpartaClassEmitter} emitter
/// @param {Struct.__SpartaClassType} particleType
/// @param {Real} particlesPerStep
/// @param {Real} lifespan
function SpartaEmitterStream(_emitter, _type, _particlesPerStep, _lifespan)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.Stream(_type, _particlesPerStep, _lifespan);
}
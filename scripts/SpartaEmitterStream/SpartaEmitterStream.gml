// Feather disable all

///
/// Stream particles over multiple frames. Setting the lifespan to `-1` will cause
/// the emitter to not retire.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Struct.__SpartaClassType} type The particle type to emit.
/// @param {Real} particlesPerStep The amount of particles to emit per step.
/// @param {Real} lifespan The life of the emitter before it retires.
function SpartaEmitterStream(_emitter, _type, _particlesPerStep, _lifespan)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _emitter.Stream(_type, _type, _particlesPerStep, _lifespan);
}
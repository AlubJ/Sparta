// Feather disable all

///
/// A particle burst is a single count of particles being spawned at once.
///
/// @param {Struct.__SpartaClassEmitter} emitter
/// @param {Struct.__SpartaClassType} type
/// @param {Real} count
function SpartaEmitterBurst(_emitter, _type, _count)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _emitter.Burst(_type, _type, _count);
}
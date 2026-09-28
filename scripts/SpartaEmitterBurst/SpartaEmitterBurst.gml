// Feather disable all

///
/// Burst particles out once.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Struct.__SpartaClassType} type The particle type to emit.
/// @param {Real} count The amount of particles to emit.
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
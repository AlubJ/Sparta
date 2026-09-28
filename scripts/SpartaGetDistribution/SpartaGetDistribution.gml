// Feather disable all

///
/// Get the distribution from an emitter.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterGetDistribution(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.GetDistribution();
}
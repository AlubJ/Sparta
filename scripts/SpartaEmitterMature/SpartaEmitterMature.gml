// Feather disable all

///
/// Maturing an emitter will cause the emitter to act like it's been running
/// for a while.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterMature(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.Mature();
}
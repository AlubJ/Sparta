// Feather disable all

///
/// Set the emitters emit distribution pattern.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Id.SPARTA_DISTR_*} distribution
function SpartaEmitterSetDistribution(_emitter, _distribution)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetDistribution(_distribution);
}
// Feather disable all

///
/// Set an emitters emit shape.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Id.SPARTA_SHAPE_*} shape
function SpartaEmitterSetShape(_emitter, _shape)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetShape(_shape);
}
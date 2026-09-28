// Feather disable all

///
/// This will set the sector angle from where particles spawn from within
/// the shape. This only affects the sphere and cylinder shapes.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Bool} angle
function SpartaEmitterSetSector(_emitter, _angle)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetSector(_angle);
}
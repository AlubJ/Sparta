// Feather disable all

///
/// Set the emitters emit region from a matrix and scale values. This will essentially
/// set the emitters bounding box.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Array.Matrix} matrix
/// @param {Real} xScale
/// @param {Real} yScale
/// @param {Real} zScale
function SpartaEmitterSetRegion(_emitter, _matrix, _xScale, _yScale, _zScale)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetRegion(_matrix, _xScale, _yScale, _zScale);
}
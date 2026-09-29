// Feather disable all

///
/// Set the scale speed of a particle type. Scale is used for oscilating the
/// scale on a given axis by a speed, and is only used for sprite particles.
/// This can be used to give the particle a 3D effect as if it is spinning.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} xScaleSpeed
/// @param {Real} yScaleSpeed
function SpartaTypeSetScale(_type, _xScale, _yScale)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetScale(_xScale, _yScale);
}
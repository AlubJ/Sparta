// Feather disable all

///
/// Set the direction of a particle type. Direction is a vector.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} xDirection
/// @param {Real} yDirection
/// @param {Real} zDirection
/// @param {Real} angleVariation
/// @param {Bool} radial
function SpartaTypeSetDirection(_type, _xDirection, _yDirection, _zDirection, _angleVariation, _radial)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetDirection(_xDirection, _yDirection, _zDirection, _angleVariation, _radial);
}
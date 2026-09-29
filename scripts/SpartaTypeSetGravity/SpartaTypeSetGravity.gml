// Feather disable all

///
/// Set the gravity of a particle type. The direction is a vector.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} xDirection
/// @param {Real} yDirection
/// @param {Real} zDirection
/// @param {Real} strength
function SpartaTypeSetGravity(_type, _xDirection, _yDirection, _zDirection, _strength)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetGravity(_xDirection, _yDirection, _zDirection, _strength);
}